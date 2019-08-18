import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/app_drawer.dart';
import '../screens/product_item.dart';
import '../providers/products.dart';
import '../providers/cart.dart';
import '../screens/badge.dart';

enum FilterOptions { Favourites, All }

class ProductsOverview extends StatefulWidget {
  @override
  _ProductsOverviewState createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  bool showFavs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shoppify'),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions value) {
                  setState(() {
                    if (value == FilterOptions.Favourites) {
                      showFavs = true;
                    } else {
                      showFavs = false;
                    }
                  });
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Only favourites'),
                        value: FilterOptions.Favourites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.All,
                      ),
                    ]),
            Consumer<Cart>(
              builder: (_, cart, _1) => Badge(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cart-detail');
                    },
                  ),
                  value: cart.itemCount.toString()),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ProductsGrid(showFavs));
  }
}

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final products = showFavs
        ? Provider.of<Products>(context).showFavouritesOnly
        : Provider.of<Products>(context).products;

    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            value: products[i], child: ProductItem()));
  }
}
