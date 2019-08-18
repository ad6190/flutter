import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' as pd;
import '../screens/cart_item.dart';
import '../providers/orders.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<pd.Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    label: Text(
                      '\$${cart.totalCount}',
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text(
                      'ORDER NOW',
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.productCartItems.values.toList(),
                        cart.totalCount,
                      );
                      cart.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                return CartItem(
                    id: cart.productCartItems.values.toList()[i].id,
                    title: cart.productCartItems.values.toList()[i].title,
                    quantity: cart.productCartItems.values.toList()[i].quantity,
                    price: cart.productCartItems.values.toList()[i].price,
                    productId: cart.productCartItems.keys.toList()[i]);
              },
              itemCount: cart.productCartItems.length,
            ),
          )
        ],
      ),
    );
  }
}
