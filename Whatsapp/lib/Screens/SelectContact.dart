import 'package:flutter/material.dart';
import 'package:practice/Model/ChatModel.dart';
import 'package:practice/Screens/CreateGroup.dart';
import 'package:practice/UI/ButtonCard.dart';
import 'package:practice/UI/ContactCard.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: 'Gizaw', status: 'turing fullstack python developer'),
      ChatModel(name: 'Dagne', status: 'lead start-up at NY'),
      ChatModel(name: 'zeberga', status: 'a2sv head of education'),
      ChatModel(name: 'Ensana', status: 'strange employee')
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "212 Contact",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 26,
            ),
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "Invite a friend",
                child: Text("Invite a friend"),
              ),
              const PopupMenuItem(
                value: "Contact",
                child: Text("Contact"),
              ),
              const PopupMenuItem(
                value: "Refresh",
                child: Text("Refresh"),
              ),
              const PopupMenuItem(
                value: "Help",
                child: Text("Help"),
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const CreateGroup()),
                  );
                },
                child: const ButtonCard(
                  name: 'New Group',
                  icon: Icons.group,
                ),
              );
            } else if (index == 1) {
              return const ButtonCard(
                name: 'New Contact',
                icon: Icons.person,
              );
            }
            return ContactCard(contact: contacts[index - 2]);
          }),
    );
  }
}
