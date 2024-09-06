import 'package:fl_newsapp/enums/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class NewsService extends ChangeNotifier {
  final String _baseUrl = 'newsapi.org';
  final String _apiKey = '937063a0b34e48a38327b6b493670fd0';
  final String _country = 'us';
  String _selectedCategory = 'business';
  bool _isLoading = true;
  List<Article> headlines = [];
  final Map<String, List<Article>> _categoryArticles = {};

  NewsService() {
    getTopHeadlines();

    for (var item in CategoryEnum.values) {
      _categoryArticles[item.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  bool get isLoading => _isLoading;

  List<Article> get getArticlesCategorySelected => _categoryArticles[_selectedCategory]!;

  set selectedCategory(String valor) {
    _selectedCategory = valor;
    _isLoading = true;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  getTopHeadlines() async {
    // Hacer petición a la API
    final url = Uri.https(_baseUrl, 'v2/top-headlines', {
      'apiKey': _apiKey,
      'country': _country
    });
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromRawJson(response.body);
    headlines.addAll(newsResponse.articles);
    // Indica que las propiedades en el provider cambiaron, para redibujar
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    // Se valida si el listado de articulos para una categoria ya está cargada en la variable y no llamar a la API nuevamente
    if (_categoryArticles[category]!.isNotEmpty) {
      // Indica que las propiedades en el provider cambiaron, para redibujar
      _isLoading = false;
      return _categoryArticles[category];
    }
    // Hacer petición a la API
    final url = Uri.https(_baseUrl, 'v2/top-headlines', {
      'apiKey': _apiKey,
      'country': _country,
      'category': category
    });
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromRawJson(response.body);
    // Guardar en un mapa el resultado
    // Key => Categoria
    // Value => Listado de articulos
    _categoryArticles[category]!.addAll(newsResponse.articles);
    _isLoading = false;
    // Indica que las propiedades en el provider cambiaron, para redibujar
    notifyListeners();
  }
}