import 'package:fl_newsapp/ui/text_decorations.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../utils/utils.dart';

class ListArticles extends StatelessWidget {
  final List<Article> articles;
  const ListArticles({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return _Article(article: articles[index], index: index);
      },
    );
  }
}

class _Article extends StatelessWidget {
  final Article article;
  final int index;
  const _Article({super.key, required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Entidad que emite la noticia
        _CardTopBar(article: article, index: index),
        // Título de la noticia
        _CardTitle(article: article),
        // Imagen de la noticia
        _CardImage(article: article),
        // Descripción de la noticia
        _CardBody(article: article),
        // Sección de botones de la noticia
        _CardButtons(article: article),
        const SizedBox(height: 10),
        const Divider()
      ],
    );
  }
}

// Sección de botones de la noticia
class _CardButtons extends StatelessWidget {
  final Article article;
  const _CardButtons({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            fillColor: AppTheme.secondary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more_horiz_outlined),
            onPressed: () => openUrl(context, article.url),
          ),
        ],
      ),
    );
  }
}

// Descripción de la noticia
class _CardBody extends StatelessWidget {
  final Article article;
  const _CardBody({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(article.description ?? ''),
    );
  }
}

// Imagen de la noticia
class _CardImage extends StatelessWidget {
  final Article article;
  const _CardImage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: article.urlToImage != null
          ? FadeInImage(
              placeholder: const AssetImage('assets/giphy.gif'), 
              image: NetworkImage(article.urlToImage)
            )
          : const Image(image: AssetImage('assets/no-image.png'))
        ),
      ),
    );
  }
}

// Título de la noticia
class _CardTitle extends StatelessWidget {
  final Article article;
  const _CardTitle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(article.title, style: TextDecorations.titleArticleDecoration),
    );
  }
}

// Entidad que emite la noticia
class _CardTopBar extends StatelessWidget {
  final Article article;
  final int index;
  const _CardTopBar({super.key, required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: TextDecorations.indexArticleDecoration),
          Text('${article.source.name ?? ''}. ')
        ],
      ),
    );
  }
}