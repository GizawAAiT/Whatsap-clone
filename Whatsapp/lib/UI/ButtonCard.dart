import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/Model/ChatModel.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.name, required this.icon});
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(
          icon,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff25D366),
      ),
      title: Text(name),
    );
  }
}
