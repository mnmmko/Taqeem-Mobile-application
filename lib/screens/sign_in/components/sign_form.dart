//import 'dart:js';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/homegust/home_screen.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:dio/dio.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'dart:convert';
import 'package:shop_app/components/products.dart';
import 'package:shop_app/API/apidio.dart';
class SignForm extends StatefulWidget {
  SignForm({Key? key}) : super(key: key);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  var emailcontroller=TextEditingController();
  var passwoedcontroller=TextEditingController();
  var accsess_tokens='';

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  @override
  initState(){
    //print('hello');
    super.initState();
    // getDate();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Log in",
            press: () {
              login();
            },

          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(height: getProportionateScreenHeight(20)),
      GestureDetector(
        onTap:() {
              () =>
                  getDate();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreenGuest()));

        },
        child: Text("guest?"
             ,
            style: TextStyle(
                decoration: TextDecoration.underline,
             // color: Colors.black,
              fontSize: getProportionateScreenWidth(7.5),

             // fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
      ),
        /*  DefaultButton(

            press: () {
              //login();
           //   Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
            },
          ),*/
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwoedcontroller,
      obscureText: true,

      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailcontroller,

      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  Future<void> login() async {
    try{
      final Dio dio = new Dio();


      if(passwoedcontroller.text.isNotEmpty&&emailcontroller.text.isNotEmpty) {
        var response =  await CustomDio().send(reqMethod: "get",path:"/api/v1/auth/loginss",query:{
          'email': emailcontroller.text,
          'password': passwoedcontroller.text
        });

        if(response.statusCode==200){
          accsess_tokens=response.data['access_token'];
          print(response.data['user']['id']);
          Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginSuccessScreen(accsess_tokens : accsess_tokens)));
        }else {
          print(response.data);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Incrocet email or password")));

        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("black field not allowed")));

      }}
    on DioError catch(e){


    }
  }
  List<Products> products=[];
  void getDate()   async {
    // List<posts> post=[];

  }

}
