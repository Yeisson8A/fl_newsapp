import 'package:fl_newsapp/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class Tab1Screen extends StatefulWidget {
   
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // Obtener instancia del servicio
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: newsService.headlines.isEmpty
        ? const Center(
            child: CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary))
          )
        : ListArticles(articles: newsService.headlines)
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}