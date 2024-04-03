import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/Model/ChatModel.dart';
import 'package:practice/Screens/IndividualPage.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualPage(chatModel: widget.chatModel),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                (widget.chatModel.isGroup)
                    ? "assets/group.svg"
                    : "assets/person.svg",
                color: Colors.white,
                height: 28,
                width: 20,
              ),
            ),
            title: Text(
              widget.chatModel.name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  widget.chatModel.currentMessage,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            trailing: Text(widget.chatModel.time),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 90, right: 25),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
