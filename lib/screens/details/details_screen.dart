import 'package:flutter/material.dart';

import '../../components/load.dart';
import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';
import 'package:shop_app/components/products.dart';
class DetailsScreen extends StatelessWidget {

  static String routeName = "/details";
 // late Future<List>products;

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return FutureBuilder(
        future: agrs.products,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if(snapshot.data==null){
            return loading1(color: Colors.orangeAccent,);

          }else{
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: snapshot.data![agrs.index]['avgstars']),
      ),
      body: Body(products:agrs.products,index:agrs.index,id:snapshot.data![agrs.index]['id']),
    );}});
  }
}

class ProductDetailsArguments {

  late Future<List>products;
  late int index;


  ProductDetailsArguments({//required this.product,
    required this.products, required this.index});
}
