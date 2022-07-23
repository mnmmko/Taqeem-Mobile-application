import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/special_offers.dart';
import 'components/body.dart';

class BrandsScreen extends StatelessWidget{
  static String routeName = "/Brand";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }
  AppBar buildAppBar(BuildContext context){
    return AppBar(
      title: Text(
        "$Category",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
