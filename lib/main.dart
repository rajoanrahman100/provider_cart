import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'checkOut.dart';
import 'item.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> items = [
    Item(title: 'laptop ', price: 500.0,count: 0,totalPrice: 0),
    Item(title: 'iphone x ', price: 400.0,count: 0,totalPrice: 0),
    Item(title: 'keyboard ', price: 40.0,count: 0,totalPrice: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Shopping cart'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckoutPage()));
                    },
                  ),
                  Text(cart.count.toString())
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(

                          child: Container(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(items[index].title),
                                Text(items[index].price.toString()),
                                SizedBox(height: 15.0,),
                                Text("total: ${items[index].totalPrice}"),


                              ],
                            ),
                          ),
                        ),


                        FlatButton(color: Colors.red,onPressed: (){
                          cart.add(items[index]);
                        }, child: Center(child: Text("Add to cart"),))

                        // Container(
                        //   child: Row(
                        //     children: [
                        //       IconButton(icon: Icon(Icons.add_circle_rounded,size: 20.0,), onPressed: (){
                        //         cart.add(items[index]);
                        //         cart.addProductCount(items[index]);
                        //         cart.addItemsTotalPrice(items[index]);
                        //       }),
                        //
                        //       items[index].count<0 ?Text("0"):Text(items[index].count.toString()),
                        //
                        //       IconButton(icon: Icon(Icons.remove_circle,size: 20.0,), onPressed: (){
                        //         cart.removeProductCount(items[index]);
                        //         cart.removeItemTotalPrice(items[index]);
                        //       }),
                        //     ],
                        //   ),
                        // ),


                      ],
                    ),
                  );
                  // return ListTile(
                  //   title: Text(items[index].title),
                  //   subtitle: Text(items[index].price.toString()),
                  //   isThreeLine: true,
                  //   trailing: IconButton(icon: Icon(Icons.add,size: 10,),onPressed: (){
                  //
                  //   },),
                  //   onTap: () {
                  //     cart.add(items[index]);
                  //   },
                  // );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text("Total Prices:${cart.totalPrice}"),
            ),


          ],
        ),
      );
    });
  }
}