import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';

class ImageFromNet extends StatelessWidget {
  ImageFromNet({
    super.key,
    required this.imgUrl,
    this.height = 50,
    this.width = 50,
    this.radiusTopLeft = 10,
    this.radiusTopRight = 10,
    this.radiusBottomLeft = 10,
    this.radiusBottomRight = 10,
    this.borderWidth = 1,
    this.boxFit = BoxFit.cover,
    required this.shape,
  });

  String imgUrl;
  double width;
  double height;
  double radiusTopLeft;
  double radiusTopRight;
  double radiusBottomLeft;
  double radiusBottomRight;
  double borderWidth;
  BoxFit boxFit;
  BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radiusTopLeft),
            topRight: Radius.circular(radiusTopRight),
            bottomLeft: Radius.circular(radiusBottomLeft),
            bottomRight: Radius.circular(radiusBottomRight),
          ),
          border: Border.all(width: borderWidth, color: Colors.grey),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) {
        return SizedBox(
          height: Get.height,
          width: Get.width,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
          // ShimmerEffect(width: width, height: height, shape: shape);
      },
      errorWidget: (context, url, error) => SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(AppColor.primary),
          ),
          child: const Icon(Icons.image_outlined)

        ),
      ) /*const Icon(Icons.error)*/,
    );
  }
}
