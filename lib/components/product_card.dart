import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:dio/dio.dart' ;
import '../constants.dart';
import '../size_config.dart';

import 'dart:async';
class ProductCard extends StatefulWidget {

   ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,

     required this.index, required  this.products, //required Future<List<dynamic>> productk,

  }) : super(key: key);

  final double width, aspectRetio;
  late int index;

  late Future<List> products;

  @override
  State<ProductCard> createState() => _ProductCardState(index: index,products :products);
}

class _ProductCardState extends State<ProductCard> {
  final String baseurl = "http://127.0.0.1:8000";
  late int index;

  _ProductCardState({required this.index,required this.products});

var datas;
  var responsedata;
 late Future<List>products;
 void getData()   async {

    final Dio dio=new Dio();
    try {
         final response = await dio.get("http://taqeems.infinityfreeapp.com/api/v1/top-get-product");

       responsedata=response.data as List ;
       print(responsedata[0]);

    }on DioError catch(e){
     print(e);

    }
  }

  @override
  void initState() {

     }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: FutureBuilder(
        future: products,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            return Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              child: SizedBox(
                width: getProportionateScreenWidth(widget.width),
                height: getProportionateScreenHeight(300),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments: ProductDetailsArguments(
                        products:products,index:index),
                  ),


                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.02,
                          child: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                            decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Hero(
                              tag: snapshot.data![index]['id'].toString(),
                              child: Image.network(snapshot.data![index]['path'].toString()
                                  //widget.product.images[0]
                                 ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                            snapshot.data![index]['product_name'].toString() ,
                        maxLines: 2,
                          style: Theme.of(context).textTheme.headline6,

                        ),


                        SizedBox(height: getProportionateScreenWidth(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                        snapshot.data![index]['avgstars'].toString(),

                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.network("assets/icons/Star Icon.svg"),
                              ],
                            ),

                          ],
                        )
                      ],
                    ),
    ),
              ),
            );
          }),
    );
  }
    }

