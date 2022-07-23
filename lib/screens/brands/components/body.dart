import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/load.dart';
import '../../../components/product_card.dart';
import '../../../size_config.dart';
import 'brand_body.dart';
import 'brand_product.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/components/products.dart';
import 'package:shop_app/API/apidio.dart';
import 'package:dio/dio.dart';
class Body extends StatefulWidget{
  @override
  _BodyState createState() => _BodyState();
  }

class _BodyState extends State<Body>{
  late Future<List>products;

  Future<List> getData()  async {

    try {
      var response = await CustomDio().send(reqMethod: "get", path: "/api/v1/product_cats",query: {
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
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 10),
            Brand(
              image: "assets/images/Samsung.png",
              brand: "Samsung",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>PopularProducts(brands :1)));
              },
            ),
            SizedBox(height: 10),
            Brand(
              image: "assets/images/Apple.png",
              brand: "Apple",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>PopularProducts(brands :2)));
              },
            ),
            SizedBox(height: 10),
            Brand(
              image: "assets/images/Xiaomi_Logo_2019.png",
              brand: "Xiaomi",
              padding: 8,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>PopularProducts(brands :7)));
              },
            ),
            SizedBox(height: 10),

            SizedBox(height: 30),
            Text("all products",style: TextStyle(fontSize: 20),),
            SizedBox(height: 50),
    FutureBuilder(
    future: products,
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      if(snapshot.data==null){
        return loading1(color: Colors.orangeAccent,);

      }else{
          return  SizedBox(
              height: 500,
              width: 370,
              child: Align(
                alignment: Alignment.center,
                child: GridView.count(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 100,
                  crossAxisCount: 2,
                  children: [
                    ...List.generate(
                      snapshot.data!.length,
                          (index) {
                        if (snapshot.data![index]['category_id']==1)
                          return ProductCard(index: index, products: products,);

                        return SizedBox
                            .shrink(); // here by default width and height is 0
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
      ],
      ),

    ),
      );}
   }
   ),
                  ],
                ),
              ),
            );




  }
}