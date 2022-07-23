import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/constants.dart';
import 'package:dio/dio.dart';
import '../../../components/load.dart';
import '../../../size_config.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/API/apidio.dart';
import '../../sign_in/sign_in_screen.dart';
class StarRate extends StatefulWidget {
//  final Product product;
  late Future<List>products;
  late int index;
  late int id;
   StarRate({
     required  this.products, required  this.index, required this.id,
  });

  @override
  _StarRateState createState() => _StarRateState(products:products,
    index:index,
    id:id,);
}

class _StarRateState extends State<StarRate> {
  late Future<List>products;
  late int index;
  late int id;
  _StarRateState({
    required  this.products, required  this.index, required this.id});

  late double rating;
  TextEditingController TEC = TextEditingController();
  String t = '';
  String text = 'Submit';
  var revi=TextEditingController();

  void addreview() async {
    try{
      if(revi.text.isNotEmpty) {
        var response =  await CustomDio().send(reqMethod: "get",path:"/api/v1/auth/add-review",query:{
          'product_id': id.toString(),
          'stars':rating.toString(),
          'Review':revi.text.toString(),
          'Date':DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        });

      if(response.statusCode==200){
        var responsedata=response.data as List ;
        late Future<List>review=responsedata as Future<List>;
        loading1(color: Colors.orangeAccent,);
        DetailsScreen.routeName;
        arguments: ProductDetailsArguments(products:products,index:index);


      }else {
        print(response.data);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("login first")));
        Navigator.push(context, MaterialPageRoute(builder:(context)=> SignInScreen()));
      }
    }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("black field not allowed")));

      }
    }on DioError catch(e){


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              'Rate',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Center(
            child: RatingBar.builder(
              minRating: 1,
              itemSize: 46,
              itemBuilder: (BuildContext context, _) =>
                  Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) => setState(() {
                this.rating = rating;
              }),
              updateOnDrag: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: TextField1(),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          ElevatedButton(
            onPressed: () {
    setState(() {



              addreview();
              revi.text='';
    });
            },
            child: Text(
              text,
            ),
            style: ElevatedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.headline5,
              minimumSize: Size(200, 55),
              primary: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }

  TextField TextField1() {
    return TextField(
      controller:revi,
      // TEC,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(),
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(),
      ),
      onSubmitted: (val) {

        setState(() {

        });
      },
    );
  }
}
