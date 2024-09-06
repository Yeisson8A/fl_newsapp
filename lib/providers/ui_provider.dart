import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;
  PageController _tabController = PageController();

  int get selectedMenuOpt => _selectedMenuOpt;

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
    // Cambiar screen seleccionado
    _tabController.animateToPage(_selectedMenuOpt, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    // Notificar a los widgets que la propiedad cambio
    notifyListeners();
  }

  PageController get tabController => _tabController;
}