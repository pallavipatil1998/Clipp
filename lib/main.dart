import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Clipp()
    );
  }
}


class Clipp extends StatelessWidget {
  const Clipp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ClipPath(
            clipper: PathClipper(),
            child: Container(height: 400,width: 400,
                child: Image.asset("assets/images/img_natural9.jpg",fit: BoxFit.cover,)),
          ),
        ),
      )








      /*Stack(
        children: [
          Center(
            child: SizedBox( height: 500,
                width: 500,
                child: Image.asset("assets/images/img_natural9.jpg")),
          ),
          BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 10.0,sigmaY: 10.0,

          ),
            child:Container(child: Center(
              child: Text("It\s Raining",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),

              ),
            ),) ,
          ),

        ],
      ),*/
    );
    
    
    
    
  }
}


class PathClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   var mPath= Path();

   //1 Clip
   // mPath.lineTo(size.width,0);
   // mPath.lineTo(0,size.height);
   // mPath.lineTo(size.width,size.height);
   // mPath.lineTo(size.width,size.height*0.5);
   // mPath.lineTo(size.width,size.height/2);


   //2 Clip With Moveto
   // mPath.moveTo(size.width*0.5, 0);
  /* mPath.moveTo(0, size.height);
   mPath.lineTo(size.width*0.5, size.height*0.75);
   mPath.lineTo(size.width, size.height);*/

   //3 Curve quadraticBezierTo
   /*mPath.lineTo(size.width, 0);
   mPath.quadraticBezierTo(size.width*0.3, size.height*0.5, size.width, size.height);

   mPath.lineTo(size.width, size.height);
   mPath.lineTo(size.width*0.1,size.height);
   mPath.quadraticBezierTo(size.width*0.8, size.height*0.5, 0, 0);
*/

   //4 Cubic To
   mPath.lineTo(size.width*0.8, 0);
   mPath.cubicTo(size.width, size.height*0.2, size.width*0.6, size.height*0.8, size.width*0.8, size.height);
   //mPath.quadraticBezierTo(size.width*0.7, size.height*0.5, size.width, size.height);
   //mPath.lineTo(size.width*0.8, size.height);
   mPath.lineTo(size.width*0.5, size.height);
   mPath.cubicTo(size.width*0.1, size.height*0.75, size.width*0.3, size.height*0.1, 0, 0);

   mPath.close();

   return mPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}
