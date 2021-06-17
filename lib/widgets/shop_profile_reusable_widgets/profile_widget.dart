import 'dart:io';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  //On Clicked in User Profile (Whic Is Not Editable)
  final VoidCallback? onClicked;
  bool isEditUserProfileOpened = false;
  File? fileImage;
  //Open Image Picker in Editable User Profile
  VoidCallback? openImagePicker;

  ProfileWidget({
    Key? key,
    required this.imagePath,
    this.onClicked,
    this.fileImage,
    this.isEditUserProfileOpened = false,
    this.openImagePicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);
    return fileImage!.path.isEmpty
        ? ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: image,
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: openImagePicker),
              ),
            ),
          )
        : ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: FileImage(fileImage!),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: openImagePicker),
              ),
            ),
          );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: !isEditUserProfileOpened
              ? Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                )
              : GestureDetector(
                  onTap: openImagePicker,
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
