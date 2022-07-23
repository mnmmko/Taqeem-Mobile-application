// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutkart/utils/flutkart.dart';
// // import 'package:flutkart/utils/my_navigator.dart';
// //
// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     Timer(Duration(seconds: 5), () => MyNavigator.goToIntro(context));
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         fit: StackFit.expand,
// //         children: <Widget>[
// //           Container(
// //             decoration: BoxDecoration(color: Colors.redAccent),
// //           ),
// //           Column(
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             children: <Widget>[
// //               Expanded(
// //                 flex: 2,
// //                 child: Container(
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: <Widget>[
// //                       CircleAvatar(
// //                         backgroundColor: Colors.white,
// //                         radius: 50.0,
// //                         child: Icon(
// //                           Icons.shopping_cart,
// //                           color: Colors.greenAccent,
// //                           size: 50.0,
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.only(top: 10.0),
// //                       ),
// //                       Text(
// //                         Flutkart.name,
// //                         style: TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 24.0),
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 1,
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: <Widget>[
// //                     CircularProgressIndicator(),
// //                     Padding(
// //                       padding: EdgeInsets.only(top: 20.0),
// //                     ),
// //                     Text(
// //                       Flutkart.store,
// //                       softWrap: true,
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 18.0,
// //                           color: Colors.white),
// //                     )
// //                   ],
// //                 ),
// //               )
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
// // اكتب إلى Saif
// /////////////////////////////////////////////////////////////
// ///                     - Tushar Gupta                    ///
// /////////////////////////////////////////////////////////////
//
// import 'package:flutter/material.dart';
// import 'package:flutter/animation.dart';
//
// class loading2 extends StatefulWidget {
//   Color fromcolor;
//   Color tocolor;
//   loading2({required this.fromcolor,required this.tocolor});
//   @override
//   _loading2State createState() => _loading2State();
// }
//
// class _loading2State extends State<loading2> with TickerProviderStateMixin{
//
//   late AnimationController animationController;
//   late AnimationController _controller;
//   late Animation animation;
//   late Animation animation1;
//   late Tween tween;
//   late Color fill1;
//   late Color fill2;
//
//   createbubble(double begin, double end){
//     animation = tween.animate(CurvedAnimation(
//       parent: animationController,
//       curve: Interval(begin,end,curve: Curves.easeIn),
//     ));
//     animation.addListener(() {setState(() {});});
//     animation.addStatusListener((status) {
//       if(status == AnimationStatus.completed){
//         animationController.reverse();
//       }else if(status == AnimationStatus.dismissed){
//         animationController.forward();
//       }
//     });
//     animation1 = ColorTween(begin: fill1,end: fill2).animate(_controller);
//     animation1.addListener(() {setState(() {});});
//     animation1.addStatusListener((status) {
//       if(status == AnimationStatus.completed){
//         _controller.reverse();
//       }else if(status == AnimationStatus.dismissed){
//         _controller.forward();
//       }
//     });
//     return Transform.scale(
//       scale: animation.value,
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: animation1.value,
//             radius: 8.0,
//           ),
//           SizedBox(width: 5.0,)
//         ],
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fill1 = widget.fromcolor;
//     fill2 = widget.tocolor;
//     animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
//     _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
//     tween = Tween<double>(begin: 0.0,end: 1.0);
//     animationController.forward();
//     _controller.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           createbubble(0.0,0.2),
//           createbubble(0.2,0.4),
//           createbubble(0.4,0.6),
//           createbubble(0.6,0.8),
//           createbubble(0.8,1.0),
//         ],
//       ),
//     );
//   }
// }
/////////////////////////////////////////////////////////////
///                    - Tushar Gupta                     ///
/////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math' as math;

import 'package:shop_app/screens/homegust/home_screen.dart';

class loading1 extends StatefulWidget {
  Color color;
  loading1({required this.color});
  @override
  _loading1State createState() => _loading1State();
}

class _loading1State extends State<loading1> with TickerProviderStateMixin{

  late AnimationController animationController;
  late Animation animation;
  late Tween tween;
  bool isclockwise = true;
  late Color fill;

  doanimation(double begin, double end){
    return tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(begin, end,curve: Curves.linear),
    ));
  }

  brick(bool isclock,double begin1,double end1,double begin2,double end2){
    animation = doanimation(begin1, end1);
    Animation anim = doanimation(begin2, end2);
    animation.addListener(() {setState(() {});});
    anim.addListener(() {setState(() {});});

    return Transform(
      transform: isclock
          ?Matrix4.rotationZ(animation.value * math.pi * 2.0 * 0.5)
          :Matrix4.rotationZ(-(animation.value * math.pi * 2.0 * 0.5)),
      alignment: Alignment.centerRight,
      child: Transform(
        transform: isclock
            ?Matrix4.rotationZ(anim.value * math.pi * 2.0 * 0.5)
            :Matrix4.rotationZ(-(anim.value * math.pi * 2.0 * 0.5)),
        alignment: Alignment.centerRight,
        child: Container(
//          margin: EdgeInsets.only(left: 0.0),
          height: 10.0,
          width: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: fill,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fill = widget.color;
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
    tween = Tween<double>(begin: 0.0, end: 1.0);
    animationController.repeat();
  //  Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreenGuest()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            brick(true,0.0, 0.1, 0.9, 1.0),
            brick(false,0.1, 0.2, 0.8, 0.9),
            brick(true,0.2, 0.3, 0.7, 0.8),
            brick(false,0.3, 0.4, 0.6, 0.7),
            brick(true,0.4, 0.5,0.5, 0.6),
          ],
        ));
  }
}