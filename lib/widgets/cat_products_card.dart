import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../screens/product_screen.dart';

class CatProductsCard extends StatelessWidget {
  CatProductsCard(this.pIndex, {Key? key}) : super(key: key);

  int pIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            color: Color(0xFFF3F6FD),
            intensity: 1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                },
                child: Image.asset("images/Product ${pIndex + 1}.png", height: 150, width: 150,)
              ),
              SizedBox(height: 8,),
              Text("Product Name", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: Colors.black45),),
              SizedBox(height: 8,),
              Text("Price \$223", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
}
