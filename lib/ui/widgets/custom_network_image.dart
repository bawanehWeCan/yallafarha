import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/images.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double? border;
  final EdgeInsetsGeometry? margin;

  const CustomNetworkImage({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.border,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: kDebugMode ? '' : url,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: border == null ? null : BorderRadius.circular(border!),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: border == null ? null : BorderRadius.circular(border!),
          image: DecorationImage(
            image: AssetImage(BaseImages.placeHolder),
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: border == null ? null : BorderRadius.circular(border!),
          image: DecorationImage(
            image: AssetImage(BaseImages.placeHolder),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
