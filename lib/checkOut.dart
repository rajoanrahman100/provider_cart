import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {



    return Consumer<Cart>(
      builder: (context, cart, child) {

        print("basket Items: ${cart.basketItems.toString()}");

        return Scaffold(
            appBar: AppBar(
              title: Text('Checkout Page [\$ ${cart.totalPrice}]'),
            ),
            body: cart.basketItems.length == 0
                ? Text('no items in your cart')
                : ListView.builder(
              itemCount: cart.basketItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    // child: ListTile(
                    //   title: Text(cart.basketItems[index].title),
                    //   subtitle: Row(
                    //     children: [
                    //       Text(cart.basketItems[index].price.toString()),
                    //       cart.basketItems[index].count<0 ?Text("0"):Text(cart.basketItems[index].count.toString())
                    //     ],
                    //   ),
                    //   trailing: IconButton(
                    //     icon: Icon(Icons.add_circle),
                    //     onPressed: () {
                    //       cart.addProductCount(cart.basketItems[index]);
                    //       //cart.remove(cart.basketItems[index]);
                    //     },
                    //   ),
                    // ),
                    child: Container(
                      height: 90.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(cart.basketItems[index].title),
                              Text(" \$ ${cart.basketItems[index].price.toString()}"),
                              Text("total price \$ ${cart.basketItems[index].price.toString()}"),
                            ],
                          ),

                          Row(
                            children: [
                              GestureDetector(onTap: (){
                                cart.addProductCount(cart.basketItems[index]);
                              },child: Icon(Icons.add_circle)),
                              Text("${cart.basketItems[index].count+1}"),
                              Icon(Icons.remove_circle),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}