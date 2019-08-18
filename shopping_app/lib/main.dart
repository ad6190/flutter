import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/product_detail.dart';
import './screens/products_overview.dart';
import './providers/products.dart';
import './providers/cart.dart' as pd;
import './screens/cart.dart';
import './providers/orders.dart';
import './screens/orders.dart';
import './screens/user_products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: pd.Cart()),
        ChangeNotifierProvider.value(value: Orders()),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: ProductsOverview(),
        routes: {
          '/product-details': (ctx) => ProductDetail(),
          '/cart-detail': (ctx) => Cart(),
          '/order-screen': (ctx) => OrdersScreen(),
          '/user-products': (ctx) => UserProducts()
        },

      ),
    );
  }
}
