import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return InkWell(
      onTap: () {
        // Do Nothing~!
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                height: 28,
                width: 20,
              ),
            ),
            title: Text(
              "Gizaw D.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            subtitle: const Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Hi My Stack!!",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            trailing: const Text("12:36 mp"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 25),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
