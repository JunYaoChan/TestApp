import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
            color: Colors.blue,
            child: const Text('Pick image from gallery',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            onPressed: () {
              _pickImageFromGallery();
            }),
        MaterialButton(
            color: Colors.red,
            child: const Text('Pick image from camera',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            onPressed: () {
              _pickImageFromCamera();
            }),
        const SizedBox(
          height: 20,
        ),
        _selectedImage != null
            ? Image.file(_selectedImage!)
            : const Text('Please select an image')
      ],
    ));
  }

// image gets saved to a variable and if it's not null (i.e. an image has been selected) _selected image gets updated
  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}
