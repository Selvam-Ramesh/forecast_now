import 'dart:ui';
import 'package:flutter/material.dart';
class List_Tile extends StatelessWidget {
  final String title;
  final Color color;
  final Icon icon;
  final GestureTapCallback onlist_tap;
  const List_Tile({required this.title,required this.color,this.icon=const Icon(null), required this.onlist_tap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>onlist_tap(),
      child: Card(
          color: color,
          margin: const EdgeInsets.only(left: 24,right: 24,bottom: 9),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child:icon.icon != null?ListTile(
            leading: icon,
            contentPadding: const EdgeInsets.all(10),
            title: Text(title,
                style:TextStyle(fontWeight: FontWeight.w500,fontSize: 17,letterSpacing: 1)
                ),
          ):ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Text(title,
                style:TextStyle(fontWeight: FontWeight.w500,fontSize: 17,letterSpacing: 1)
            ),
          )
      ),
    );
  }
}