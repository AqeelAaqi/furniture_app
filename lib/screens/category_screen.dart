import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/cat_products_card.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key, required this.category}) : super(key: key);

  String category;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF3F6FD),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    Text(
                      category,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500),
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        color: Color(0xFFF3F6FD),
                        intensity: 1,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(CupertinoIcons.cart_fill),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20),
                      ),
                      color: Color(0xFFF3F6FD),
                      intensity: 1,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Row(
                        children: [
                          Icon(Icons.sort),
                          SizedBox(height: 5),
                          Text(
                            "Sort",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20),
                      ),
                      color: Color(0xFFF3F6FD),
                      intensity: 1,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Row(
                        children: [
                          Icon(Icons.filter_list),
                          SizedBox(height: 5),
                          Text("Filter",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding:
                    EdgeInsets.only(top: 20, right: 5, left: 5, bottom: 50),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width - 15 - 10) / (2 * 250),
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    // return Center();
                    return CatProductsCard(index);
                  }
                  return OverflowBox(
                    maxHeight: 250 + 70,
                    child: Container(
                      margin: EdgeInsets.only(top: 70),
                      child: CatProductsCard(index),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
