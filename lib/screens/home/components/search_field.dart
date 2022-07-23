import 'package:flutter/material.dart';

import '../../../components/load.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/screens/details/details_screen.dart';
class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
  }) : super(key: key);
  var searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: searchcontroller,
        readOnly: true,
        onTap:(){showSearch(context: context,delegate: MySeachdelegate());
        },
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search item",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}

class MySeachdelegate extends SearchDelegate{

  // final String baseurl = "http://127.0.0.1:8000";
  final String baseurl = "https://taqeemss.000webhostapp.com";
  late Future<List>products;

  Future<List> getsearch(var searchs)  async {
    final Dio dio = new Dio();
    try {
      var response = await dio.get("$baseurl/api/v1/search", queryParameters: {
        'product': searchs.toString(),
      });
      var responsedata = response.data as List;

      return responsedata;
    } on DioError catch (e) {
      return ['error'];
    }
  }
  @override
  void initState() {

  }

  List<String> searchlist = ['apple','v','s','Apple','Samsung','Oppo',];


  @override
  List<Widget>? buildActions(BuildContext context) {

  }

  @override
  Widget? buildLeading(BuildContext context) {

  }

  @override
  Widget buildResults(BuildContext context) {

    return FutureBuilder(
        future: getsearch(query),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot)
        {
          if(snapshot.data==null){
            return loading1(color: Colors.orangeAccent,);

          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var result = snapshot.data![index]['product_name'];
              if(query==''){
                result='';
              }
              return ListTile(
                title: Text(result,),
                onTap: ()=> Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(
                      products:getsearch(result),index:0),
                ),
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> suggestions = ['Apple','Samsung','Oppo',];
    return FutureBuilder(
        future: getsearch(query),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if(snapshot.data==null){
            return loading1(color: Colors.orangeAccent,);

          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index){
              var suggestion = snapshot.data![index]['product_name'];
              if(query==''){
                suggestion='';
              }
              return ListTile(
                title: Text(suggestion,),
                onTap: ()=> Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(
                      products:getsearch(suggestion),index:0),
                ),
              );

            },
          );
        }); }
}