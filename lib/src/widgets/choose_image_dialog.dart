import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImageDialog extends StatefulWidget {
  @override
  _ChooseImageDialog createState() => _ChooseImageDialog();
}

class _ChooseImageDialog extends State<ChooseImageDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  final picker = ImagePicker();
  File _selectedImage;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(8.0),
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.camera_alt,
                        color: const Color(0xffFEC200),
                      ),
                      SizedBox(width: 8.0,),
                      Text(
                        'Camera',
                        style: TextStyle(
                          color: const Color(0xff212121),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ])),
                Container(
                    margin: EdgeInsets.all(8.0),
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.folder,
                        color: const Color(0xffFEC200),
                      ),
                      SizedBox(width: 8.0,),
                      Text(
                        'Gallery',
                        style: TextStyle(
                          color: const Color(0xff212121),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getCameraImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      }
    });
  }

  Future getGalleryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      }
    });
  }
}
