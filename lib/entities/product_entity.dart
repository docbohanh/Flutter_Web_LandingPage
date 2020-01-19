import 'package:flutter/material.dart';

class ProductEntity{
  String name;
  Color color;
  String cover;

  ProductEntity(String name, Color color, String cover){
    this.name = name;
    this.color = color;
    this.cover = cover;
  }
}