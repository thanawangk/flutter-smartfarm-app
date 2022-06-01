import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  String title; //ชื่อ
  dynamic data;
  IconData icon;
  Color color; //สี
  double size; //ขนาด

  Box(this.title, this.data, this.icon, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.yellow, size: 28),
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              data.toString(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
