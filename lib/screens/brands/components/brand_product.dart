import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/components/products.dart';
import '../../../components/load.dart';
import '../../../size_config.dart';
import 'body.dart';
import 'package:dio/dio.dart';
//import 'section_title.dart';
import 'package:shop_app/API/apidio.dart';
class PopularProducts extends StatefulWidget {
  var products;
  var brands;
  PopularProducts({required this.brands});
  @override
  State<PopularProducts> createState() => _PopularProducts(brand: brands);
}

class _PopularProducts extends State<PopularProducts>{
  var brand;
  _PopularProducts({required this.brand});
 // PopularProducts({required this.products});

 // final String baseurl = "http://127.0.0.1:8000";
 // final String baseurl = "https://taqeemss.000webhostapp.com";
  late Future<List>products;

  Future<List> getData()  async {
    final Dio dio=new Dio();
    try {
      var response = await CustomDio().send(reqMethod: "get", path: "/api/v1/brand_cats",query: {
        'brand':brand,
        'cat':1
      });
      //await dio.get("$baseurl/api/v1/get-product");
      var responsedata=response.data as List ;

      return responsedata;

    }on DioError catch(e){
      return ['g'];
    }
  }
  @override
  void initState() {
    products = getData();
    print(products);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: 800,
          child: FutureBuilder(
              future: products,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if(snapshot.data==null){
                  return loading1(color: Colors.orangeAccent,);

                }
              return GridView.count(

                crossAxisCount: 2,
                mainAxisSpacing: 100,
                children: [
                  ...List.generate(
                   // demoProducts.length,
                    snapshot.data!.length,
                    (index) {
                    //  if (snapshot.data![index]['category_id']==1&&snapshot.data![index]['brand_id']==brand)
                        return ProductCard(index: index, products: products,);

                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
  AppBar buildAppBar(BuildContext context){
    return AppBar(
      title: Text(
        "Brand",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
