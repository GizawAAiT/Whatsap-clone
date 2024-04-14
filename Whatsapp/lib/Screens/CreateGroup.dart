import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/Model/ChatModel.dart';
import 'package:practice/UI/AvatarCard.dart';
import 'package:practice/UI/ButtonCard.dart';
import 'package:practice/UI/ContactCard.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: 'Gizaw', status: 'turing fullstack python developer'),
    ChatModel(name: 'Dagne', status: 'lead start-up at NY'),
    ChatModel(name: 'zeberga', status: 'a2sv head of education'),
    ChatModel(name: 'Ensana', status: 'strange employee'),
    ChatModel(name: 'Xamarin', status: 'the CEO of apple'),
    ChatModel(name: 'Class', status: 'addis ababa university classroom'),
    ChatModel(name: 'Dagsag', status: 'lengthy class after no0n!'),
  ];

  List<ChatModel> groups = [];
  int topPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              "New Group",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Select Participant",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 26,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: groups.isNotEmpty ? 70 : 0),
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    final ChatModel currContact = contacts[index];
                    if (currContact.selected == false) {
                      setState(() {
                        currContact.selected = true;
                        groups.add(currContact);
                      });
                    } else {
                      setState(() {
                        currContact.selected = false;
                        groups.remove(currContact);
                      });
                    }
                  },
                  child: ContactCard(
                    contact: contacts[index],
                  ),
                );
              },
            ),
          ),
          groups.isNotEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: groups.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            final ChatModel currContact = groups[index];
                            setState(() {
                              currContact.selected = false;
                              groups.remove(currContact);
                            });
                          },
                          child: AvatarCard(
                            name: groups[index].name,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 4,
                      color: Colors.amber,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
