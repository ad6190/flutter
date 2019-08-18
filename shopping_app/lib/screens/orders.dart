import 'package:flutter/material.dart';
import '../screens/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import 'package:provider/provider.dart';
import '../screens/order_item.dart' as oi;

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your orders')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return oi.OrderItem(orderData.orders[i]);
        },
        itemCount: orderData.orders.length,
      )
    );
  }
}
