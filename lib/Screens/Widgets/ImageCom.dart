import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCom extends StatelessWidget {
  ImageCom({Key? key, this.image}):super(key:key);

  final image;

  @override
  Widget build(BuildContext context) {
    return (image==null)?Image(
      image: AssetImage("assets/lasagna.jpg"),
      fit: BoxFit.cover,
    ):CachedNetworkImage(
      imageUrl: "http://10.0.2.2:3001/fetchimg/${image}",
      placeholder: (context, url) => new Container(color:Colors.grey[200]),
      errorWidget: (context, url, error) => Container(color:Colors.grey[200]),
      fadeOutDuration: Duration(seconds:1),
      fadeInDuration: Duration(seconds:3),
      fit:BoxFit.cover,
    );
  }
}
