import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadFileDialog extends StatelessWidget {
  final Function() onGallerySelected;
  final Function() onCameraSelected;

  const UploadFileDialog({
    Key? key,
    required this.onGallerySelected,
    required this.onCameraSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Select'.tr),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: onGallerySelected,
          child: Text('Gallery'.tr),
        ),
        SimpleDialogOption(
          onPressed: onCameraSelected,
          child: Text('Camera'.tr),
        ),
      ],
    );
  }
}
