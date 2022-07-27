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
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text('From gallery'),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: Text('From camera'),
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
        ],
      ),
    );
  }

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