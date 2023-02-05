import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/products_widget.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List categories = [
    "Chairs",
    "Sofas",
    "Beds",
    "Tables",
    "Doors",
    "Windows",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Material(
          color: Color(0xFFF3F6FD),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 50, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Our Products",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {},
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12)),
                              color: Color(0xFFF3F6FD),
                              intensity: 1),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.search),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.black54,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black38,
                  isScrollable: true,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  tabs: [
                    Tab(text: "Chairs"),
                    Tab(text: "Sofas"),
                    Tab(text: "Beds"),
                    Tab(text: "Tables"),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 360,
                  child: TabBarView(
                    children: [
                      ProductsWidget(),
                      ProductsWidget(),
                      ProductsWidget(),
                      ProductsWidget(),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                //Category
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryScreen(category: categories[index],)));
                          },
                          child: Neumorphic(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20)),
                              color: Color(0xFFF3F6FD),
                              intensity: 1,
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Best Offers",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ListTile(
                        minLeadingWidth: 70,
                        leading: Image.asset("images/Product ${index + 1}.png"),
                        title: Text(
                          "Product Name",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "category",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(
                          "\$223",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
