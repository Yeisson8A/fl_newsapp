import 'package:fl_newsapp/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens.dart';

class TabsScreen extends StatelessWidget {
   
  const TabsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UiProvider(),
      child: Scaffold(
        body: _Tabs(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener instancia del provider
    final uiProvider = Provider.of<UiProvider>(context);

    return BottomNavigationBar(
      currentIndex: uiProvider.selectedMenuOpt,
      onTap: (value) => uiProvider.selectedMenuOpt = value,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados')
      ]
    );
  }
}

class _Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener instancia del provider
    final uiProvider = Provider.of<UiProvider>(context);

    return PageView(
      controller: uiProvider.tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Screen(),
        Tab2Screen()
      ],
    );
  }
}