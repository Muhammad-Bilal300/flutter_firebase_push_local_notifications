import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartModel.dart';
import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart products"),
        actions: [
          Center(
            child: Badge(
                animationType: BadgeAnimationType.slide,
                badgeContent: Consumer<CartProvider>(
                    builder: (context, value, child) =>
                        Text("${value.getCounter().toString()}")),
                animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_cart)),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            height: 100,
                                            width: 100,
                                            image: NetworkImage(snapshot
                                                .data![index].image
                                                .toString())),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data![index].productName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                snapshot.data![index].unitTag
                                                        .toString() +
                                                    " " +
                                                    r"$" +
                                                    snapshot.data![index]
                                                        .productPrice
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: () {
                                                    // dbHelper
                                                    //     .insert(CartModel(
                                                    //         // id: index,
                                                    //         // productId: index.toString(),
                                                    //         productName:
                                                    //             productName[index]
                                                    //                 .toString(),
                                                    //         initialPrice:
                                                    //             productPrice[index],
                                                    //         productPrice:
                                                    //             productPrice[index],
                                                    //         quantity: 1,
                                                    //         unitTag: productUnit[index]
                                                    //             .toString(),
                                                    //         image: productImage[index]
                                                    //             .toString()))
                                                    //     .then((value) {
                                                    //   print("Product is added to cart");
                                                    //   cart.addTotalPrice(double.parse(
                                                    //       productPrice[index]
                                                    //           .toString()));
                                                    //   cart.addCounter();
                                                    // }).onError((error, stackTrace) {
                                                    //   print(error.toString());
                                                    // });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7)),
                                                    height: 35,
                                                    width: 100,
                                                    child: Center(
                                                      child: Text(
                                                        "Add to Cart",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }));
                }
                return Text("data");
              })
        ],
      ),
    );
  }
}
