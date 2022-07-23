import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'review_section.dart';
import 'star_rate.dart';

class Body extends StatefulWidget {
  // Product product;
  late Future<List>products;
  late int index;
  late int id;
   Body({Key? key, //required this.product,
     required this.products, required  this.index, required this.id}) : super(key: key);
  State<Body> createState() => _Body(index: index,products :products,id:id);
}


class _Body extends State<Body>{
  _Body({required this.index,required this.products,required this.id});
  late Future<List>products;
  late int index;
  late int id;
  late Product product;
 // final Product product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    child: FutureBuilder(
        future: products,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    return ListView(
      children: [
        ProductImages(products: products,index:index),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
             //   product: product,
                products:products,
                index:index,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                   // ColorDots(product: product),
                  ],
                ),
              ),
              TopRoundedContainer(
                color: Colors.white,
                child: SizedBox(
                  height: 300,
                  width: SizeConfig.screenWidth,
                  child: StarRate(
                    products:products,
                    index:index,
                   id:id,
                  //  product: product,
                  ),
                ),
              ),
              TopRoundedContainer(
                color: Color(0xFFF5F6F9),
                child: ReviewSection(
                  products:products,
                  index:index,
                 id:id,
                //  product: product,
                ),
              ),

            ],
          ),
        ),
      ],
    );
        }
    )
    );
  }
}
