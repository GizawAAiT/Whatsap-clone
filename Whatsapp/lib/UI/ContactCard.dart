import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 53,
        height: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset(
                'assets/person.svg',
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
            contact.selected
                ? const Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Color(0xff25D366),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(
        contact.status,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
