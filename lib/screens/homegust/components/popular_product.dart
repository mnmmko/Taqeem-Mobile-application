import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/components/products.dart';
import '../../../components/load.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shop_app/API/apidio.dart';
class PopularProducts extends StatefulWidget {

  PopularProducts();
  @override
  State<PopularProducts> createState() => _PopularProducts();
}

class _PopularProducts extends State<PopularProducts>{

  List<Products> prod=[];
  var datas;

  late Future<List>products;

  Future<List> getData()  async {
    // List<posts> post=[];
    final Dio dio=new Dio();
    try {

      var response =await CustomDio().send(reqMethod: "get", path: "/api/v1/top-get-product");

      var responsedata=response.data as List ;

      return responsedata;
    }on DioError catch(e){

      return ['g'];
    }
  }
  @override
  void initState() {
    products = getData();
  //  List<Productss> productss=products as List<Productss>;
    print(products);

  }
  @override

  Widget build(BuildContext context) {
    return Column(

      children: [
        Padding(

          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () { }),
        ),


        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FutureBuilder(
            future: products,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

              if(snapshot.data==null){
                return loading1(color: Colors.orangeAccent,);

              }
              return Row(
                children: [
                  ...List.generate(
                    snapshot.data!.length,

                    (index) {
                      if ( snapshot.data![index]['avgstars']>=4.7)
                        return ProductCard(index: index,products:products);

                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              );
            }
          ),
        )
      ],
    );
  }
}
