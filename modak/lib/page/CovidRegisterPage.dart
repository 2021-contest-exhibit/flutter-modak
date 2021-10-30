// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// import 'dart:async';
// import 'dart:io';
// import 'dart:ui';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
//
//
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: Center(
//         child: CovidRegisterPage(),
//       ),
//     ),
//   ));
// }
//
// class CovidRegisterPage extends StatefulWidget {
//
//   @override
//   CovidRegisterPageState createState() => CovidRegisterPageState();
// }
//
// class CovidRegisterPageState extends State<CovidRegisterPage> {
//   late File pickedImage;
//   bool isImageLoaded = false;
//   String w="";
//   final picker = ImagePicker();
//
//   Future pickImage() async {
//     var tempStore = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       pickedImage = tempStore as File;
//       isImageLoaded = true;
//     });
//   }
//
//   Future readText() async {
//     FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
//     TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
//     VisionText readText = await recognizeText.processImage(ourImage);
//
//     for (TextBlock block in readText.blocks) {
//       for (TextLine line in block.lines) {
//         for (TextElement word in line.elements) {
//           w = w + " "+ word.text;
//           print(word.text);
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           isImageLoaded
//               ? Center(
//             child: Container(
//               //padding: EdgeInsets.all(30),
//               height: 200.0,
//               width: 200.0,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: FileImage(pickedImage), fit: BoxFit.cover),
//               ),
//             ),
//           )
//               : Container(),
//           SizedBox(height: 10.0),
//           RaisedButton(
//             child: Text("Pick an image"),
//             onPressed: pickImage,
//           ),
//           SizedBox(height: 10.0),
//           RaisedButton(
//             child: Text("Read Text"),
//             onPressed: readText,
//           ),
//           Container(
//             child: Text(""+ w),
//           )
//         ],
//       ),
//     );
//   }
// }