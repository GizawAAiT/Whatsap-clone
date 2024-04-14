import "package:flutter/material.dart";
import "package:practice/Model/ChatModel.dart";
import "package:practice/Screens/SelectContact.dart";
import "package:practice/UI/CustomCard.dart";

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Gizaw D",
        // icon: "person.svg",
        isGroup: false,
        currentMessage: "Hello the gaddom button",
        time: "2:03"),
    ChatModel(
        name: "Grade 12th stud:",
        // icon: "person.svg",
        isGroup: true,
        currentMessage: "This is whatsapp channel for grade 12th.",
        time: "6:39"),
    ChatModel(
        name: "Ayantu Letta",
        // icon: "person.svg",
        isGroup: false,
        currentMessage: "This is Ayantu, and you!",
        time: "11:56"),
    ChatModel(
        name: "Kassu",
        // icon: "person.svg",
        isGroup: false,
        currentMessage: "Hello, my name is kassu",
        time: "5:03"),
    ChatModel(
        name: "Adama HC",
        // icon: "person.svg",
        isGroup: true,
        currentMessage: "Well come to Adama Heanth Center!",
        time: "12:08"),
    ChatModel(
        name: "Garment",
        // icon: "person.svg",
        isGroup: true,
        currentMessage: "This is Haile garment, welcome!",
        time: "24:34"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
