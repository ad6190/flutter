import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/app_drawer.dart';
import '../providers/products.dart';
import '../screens/user_product_item.dart';

class UserProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Your Products'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(
            8,
          ),
          child: ListView.builder(
            itemBuilder: (ctx, i) => Column(children: [
                  UserProductItem(
                    productData.products[i].title,
                    productData.products[i].imageUrl,
                  ),
                  Divider(),
                ]),
            itemCount: productData.products.length,
          ),
        ));
  }
}
