// import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_preview/image_preview.dart';
import 'package:rate_my_quilt/Utils/Constants.dart';
// import 'package:image_crop/image_crop.dart';
// import 'package:image_picker/image_picker.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Image Picker and Crop Example',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   File _imageFile;
//   final _cropController = CropController();
//   final _cropKey = GlobalKey<CropState>();

//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _cropImage() async {
//     final croppedFile = await _cropController.crop();

//     if (croppedFile != null) {
//       setState(() {
//         _imageFile = croppedFile;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Image Picker and Crop Example'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (_imageFile != null) ...[
//               Container(
//                 width: 300,
//                 height: 300,
//                 child: Crop(
//                   key: _cropKey,
//                   controller: _cropController,
//                   aspectRatio: 1.0,
//                   image: FileImage(_imageFile),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   FloatingActionButton(
//                     onPressed: _pickImage,
//                     tooltip: 'Pick Image',
//                     child: Icon(Icons.photo_library),
//                   ),
//                   FloatingActionButton(
//                     onPressed: _cropImage,
//                     tooltip: 'Crop Image',
//                     child: Icon(Icons.crop),
//                   ),
//                 ],
//               ),
//             ] else ...[
//               Center(
//                 child: Text('No image selected.'),
//               ),
//               FloatingActionButton(
//                 onPressed: _pickImage,
//                 tooltip: 'Pick Image',
//                 child: Icon(Icons.photo_library),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

class cropapp extends StatelessWidget {
  const cropapp({super.key});

  @override
  Widget build(BuildContext context) {
    createrewarderad();

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  
                  AssetsAudioPlayer.newPlayer().open(
                    Audio("assets/audios/sound.wav"),
                    autoStart: true,
                    showNotification: true,
                  );
                  //  List<String> list=["4","2","44","5","6","7","9","8"];
                  //  list.indexOf("7");
                  //   int a=21,b=5;
                  //  int c = a ~/ b;
                  //  list.insert(3, "6");
                  // print("dasa"+list.toString());

                  //  print("dasa"+list[5].toString());
                  //  print("dasa"+list.indexOf("7",3).toString());
                  //  print("dasa"+.toString());

                  //loadrewarded();
                  // openImagesPage(Navigator.of(context),
                  //   imgUrls: ["https://thumbs.dreamstime.com/b/beautiful-rain-forest-ang-ka-nature-trail-doi-inthanon-national-park-thailand-36703721.jpg"],
                  //   );
                },
                child: Text("image preview")),
          ),
RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) =>  Container(
      width: 20,
      height: 20,
      child: Icon(
        Icons.star,
        color: Colors.blue,
      ),
    ),
      onRatingUpdate: (rating) {
        // onChanged(rating.toInt());
        // final player = AudioCache();
        // player.play('sound.wav');
      },
    )
        ],
      ),
    );
  }
}
