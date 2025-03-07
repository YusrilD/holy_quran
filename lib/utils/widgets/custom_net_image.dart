import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../text_theme.dart';

class ImageFromNet extends StatefulWidget {
  ImageFromNet({
    super.key,
    required this.imgUrl,
  });

  String imgUrl;

  @override
  State<ImageFromNet> createState() => _ImageFromNetState();
}

class _ImageFromNetState extends State<ImageFromNet> {
  int _retry = 0; // Change key to force reload

  void _reloadImage() {
    setState(() {
      _retry++; // Change key to reload image
    });
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return CachedNetworkImage(
      key: ValueKey(_retry),
      imageUrl: widget.imgUrl,
      placeholder: (context, url) {
        return const SizedBox(
          height: 50,
          width: 50,
        ).paddingOnly(
          top: statusBarHeight,
        );
      },
      errorWidget: (context, url, error) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, color: Colors.red),
          TextButton.icon(
            onPressed: _reloadImage,
            icon: const Icon(Icons.refresh),
            label: Text(
              "Muat Ulang",
              style: AppTextTheme.getTextTheme().bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
