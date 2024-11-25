import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/ui_config_bloc.dart';
import 'screens/cart_screen.dart';
import 'screens/dynamic_screen.dart';
import 'screens/banner_detail_screen.dart';
import 'screens/category_screen.dart';
import 'screens/deal_detail_screen.dart';
import 'screens/search_screen.dart';
import 'screens/wishlist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Furniture App',
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
          create: (context) => UiConfigBloc()..add(LoadUiConfigEvent()),
          child: DynamicScreen(),
        ),
        '/bannerDetail': (context) => BannerDetailScreen(),
        '/category': (context) => CategoryScreen(),
        '/dealDetail': (context) => DealDetailScreen(),
        '/search': (context) => SearchScreen(),
        '/wishlist': (context) => WishlistScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
