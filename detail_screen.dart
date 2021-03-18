import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'file:///D:/flutter/flutter_course/lib/app/dashboard/constants.dart';
import 'package:flutter_course/app/product_details/detail.dart';
import 'package:flutter_svg/svg.dart';
class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        title: Text('Detail Page'),
        ),

    body: Details(product :product),
    );

  }

}
