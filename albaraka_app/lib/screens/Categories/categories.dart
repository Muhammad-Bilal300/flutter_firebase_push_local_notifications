import 'package:albaraka_app/Constants/colors.dart';
import 'package:albaraka_app/screens/Categories/components/slider.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Categories Page"),
      // ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 35, right: 35, top: 35, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      width: 110,
                      child: Image.asset(
                        "assets/images/appIcon.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.email_outlined,
                          size: 20,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              SliderImage(),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.75),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 5),
                      // height: 200,
                      // width: 200,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 4,
                                      blurRadius: 5,
                                      offset: Offset(
                                          1, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  "assets/images/Fruits.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 9),
                                child: Text(
                                  "Hygiene & Personal Care",
                                  style: TextStyle(fontSize: 13),
                                ),
                              )
                            ],
                          ),
                        ),
                        // elevation: 1,
                        // shadowColor: Colors.green,
                        // margin: EdgeInsets.all(10),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
