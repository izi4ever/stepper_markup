import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../theme/tpl_page_body_padding.dart';

class GetAvatar extends StatefulWidget {
  GetAvatar({Key? key}) : super(key: key);

  @override
  State<GetAvatar> createState() => _GetAvatarState();
}

class _GetAvatarState extends State<GetAvatar> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get image for your profile'),
        centerTitle: true,
      ),
      body: PageBodyPadding(
        children: [
          Container(
            child: imageFile == null
                ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _getFromGallery();
                      },
                      child: Text("PICK FROM GALLERY"),
                    ),
                    Container(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _getFromCamera();
                      },
                      child: Text("PICK FROM CAMERA"),
                    )
                  ],
                ),
              )
              : Container(
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          // ElevatedButton(
          //   onPressed: () {}, 
          //   child: const Text('Get image')
          // ),
        ],
      ),
    );
  }


  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

}