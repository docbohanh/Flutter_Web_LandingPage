import 'package:flutter/material.dart';
import 'package:helloweb/entities/product_entity.dart';

class ProductView extends StatelessWidget {
  final ProductEntity data;

  const ProductView({this.data}) : assert(data != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Colors.white),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.055),
              offset: Offset(0, 10),
              blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
            fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Image.network(
              data?.cover ?? "",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                data?.name,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: data?.color ?? Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
