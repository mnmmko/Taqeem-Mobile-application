import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatefulWidget {
   ProductDescription({
    Key? key,
   // required this.product,
    this.pressOnSeeMore, required this.products,
     required this.index,
  }) : super(key: key);
  late Future<List>products;
  late int index;
 // final Product product;
  final GestureTapCallback? pressOnSeeMore;
   State<ProductDescription> createState() => _ProductDescription(index: index,products :products);
}


class _ProductDescription extends State<ProductDescription>{
  _ProductDescription({required this.index,required this.products});
  late Future<List>products;
  late int index;
  late Product product;
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: products,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(

            snapshot.data![index]['product_name'],
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            snapshot.data![index]['description'],
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
        )
      ],
    );
        });

  }
}
