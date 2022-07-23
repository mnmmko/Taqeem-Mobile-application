import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
   ProductImages({
    Key? key,
   // required this.product,
     required  this.products,
     required  this.index,
  }) : super(key: key);

//  final Product product;
  late Future<List>products;
  late int index;
  @override
  _ProductImagesState createState() => _ProductImagesState(index:index,products: products);
}

class _ProductImagesState extends State<ProductImages> {
  _ProductImagesState({required this.index,required this.products});
  int selectedImage = 0;
  late Future<List>products;
  late int index;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: products,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: snapshot.data![index]['id'].toString(),
              child: Image.network(
                snapshot.data![index]['path'].toString()
                 // widget.product.images[selectedImage]
              ),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
      /*  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                widget.product.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )*/
      ],
    );
        });
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        //child: Image.network(widget.product.images[index]),
      ),
    );
  }
}
