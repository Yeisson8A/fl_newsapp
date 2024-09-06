import 'package:fl_newsapp/enums/category_enum.dart';
import 'package:fl_newsapp/services/news_service.dart';
import 'package:fl_newsapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class Tab2Screen extends StatelessWidget {
   
  const Tab2Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Obtener instancia del servicio
    final newsService = Provider.of<NewsService>(context);
    newsService.getArticlesByCategory(newsService.selectedCategory);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Listado de categorías
            const _ListCategories(),
            newsService.isLoading 
            ? const Expanded(
                child: Center(
                  child: CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary))
                ),
              )
            : Expanded(child: ListArticles(articles: newsService.getArticlesCategorySelected))
          ],
        )
      ),
    );
  }
}

// Listado de categorías
class _ListCategories extends StatelessWidget {
  const _ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    const categories = CategoryEnum.values;

    return Container(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(category: categories[index]),
                const SizedBox(height: 5),
                Text(categories[index].value)
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CategoryEnum category;
  const _CategoryButton({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Obtener instancia del servicio
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        // Obtener instancia del servicio
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon, 
          color: newsService.selectedCategory == category.name ? AppTheme.primary : Colors.black54
        ),
      ),
    );
  }
}