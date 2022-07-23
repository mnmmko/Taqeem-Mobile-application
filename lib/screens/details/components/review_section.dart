import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/Review.dart';
import '../../../components/load.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/API/apidio.dart';
class ReviewCard extends StatefulWidget {

   late int id;
   late Future<List>review;
   late int index;
   ReviewCard({
     Key? key,
     required  this.id, required  this.review, required  this.index,
   }) : super(key: key);
  @override
  State<ReviewCard> createState() => _ReviewCard(id:id,review:review,index: index);
}

class _ReviewCard extends State<ReviewCard> {
  _ReviewCard({
    required  this.id,required  this.review, required  this.index});
  late int id;
  late Future<List>review;
  late int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: review,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            snapshot.data![index]['Date'].toString(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            snapshot.data![index]['Review'].toString(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            snapshot.data![index]['stars'].toString(),
          ),
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
        }
    );
        }

}

class ReviewSection extends StatefulWidget {
  late Future<List>products;
  late int index;
  late int id;
  ReviewSection({
    required this.products, required  this.id,required  this.index,
  });

  @override
  _ReviewSectionState createState() => _ReviewSectionState(products:products,id: id,index: index,);
}

class _ReviewSectionState extends State<ReviewSection> {

  late int id;
  late Future<List>products;
  late int index;
  late Review reviews;
  _ReviewSectionState({

   required this.products, required  this.id,required  this.index,
  });



  late Future<List>review;
  Future<List> getData(double i)  async {


    try {
      var response =  await CustomDio().send(reqMethod: "get",path:"/api/v1/review",query:{
        'product_id': id,
        'stars':i.toString(),

      });
      var responsedata;
      setState(() {
       responsedata=response.data as List ;
      });
      return responsedata;

    }on DioError catch(e){

      return ['g'];
    }
  }





  List<bool> click = [
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  getRate() {
    if (click[0] == false) {

      review=getData(1.0);

    } else if (click[1] == false) {

      review=getData(2.0);
    } else if (click[2] == false) {
      return review=getData(3.0);


    } else if (click[3] == false) {
      review=getData(4.0);


    } else if (click[4] == false) {
      review=getData(5.0);


    } else {
      review=getData(0.0);

    }
  }

  @override
  void initState() {
    review = getData(0);
    print(review);

  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            'Reviews',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            ElevatedButton(
              child: Text(
                'All',
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50, 50),
                primary: (click[5] == false) ? Colors.black : kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                setState(() {
                  click = [true,true,true,true,true,false];

                     loading1(color: Colors.orangeAccent,);


             getRate();
                });
              },
            ),

            ElevatedButton(
              child: Text(
                '1',
              ),
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headline6,
                minimumSize: Size(50, 50),
                primary: (click[0] == false) ? Colors.black : kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                setState(() {
                  click = [false,true,true,true,true,true,];
                  loading1(color: Colors.orangeAccent,);

                  getRate();
                });
              },
            ),

            ElevatedButton(
              child: Text(
                '2',
              ),
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headline6,
                minimumSize: Size(50, 50),
                primary: (click[1] == false) ? Colors.black : kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                setState(() {
                  click = [true,false,true,true,true,true];
                  loading1(color: Colors.orangeAccent,);
                  getRate();
                });
              },
            ),

            ElevatedButton(
              child: Text(
                '3',
              ),
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headline6,
                minimumSize: Size(50, 50),
                primary: (click[2] == false) ? Colors.black : kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                setState(() {
                  click = [true,true,false,true,true,true];

                  loading1(color: Colors.orangeAccent,);
                  getRate();
                });
              },
            ),

            ElevatedButton(
              child: Text(
                '4',
              ),
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headline6,
                minimumSize: Size(50, 50),
                primary: (click[3] == false) ? Colors.black : kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                setState(() {
                  click = [true,true,true,false,true,true];

                  loading1(color: Colors.orangeAccent,);
                  getRate();
                });
              },
            ),

            ElevatedButton(
              child: Text(
                '5',
              ),
              style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.headline6,
                minimumSize: Size(50, 50),
                primary: (click[4] == false) ? Colors.black : kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                setState(() {
                  click = [true,true,true,true,false,true];

                  loading1(color: Colors.orangeAccent,);

                  getRate();
                });
              },
            ),

          ],
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
     FutureBuilder(
    future: review,
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      if(snapshot.data==null){
        return loading1(color: Colors.orangeAccent,);

      }
      return  SizedBox(
          height: 500,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              itemCount: snapshot.data!.length,

              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),

                child: ReviewCard(
                  id:id,

                  review:review,
                  index:index,
                ),
              ),
            ),
          ),
        );
        }
    ),
      ],
    );

        }
}
