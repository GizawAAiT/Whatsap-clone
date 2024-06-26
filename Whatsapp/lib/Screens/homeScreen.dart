// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:practice/Pages/ChatPage.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        backgroundColor: Color(0xFF128C7E),
        // foregroundColor: Color(0xFF075E54),
        title: Text('WhatsApp Clone'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: "New Group",
                child: Text("New Group"),
              ),
              PopupMenuItem(
                value: "New Broadcast",
                child: Text("New Broadcast"),
              ),
              PopupMenuItem(
                value: "Whatsap Web",
                child: Text("Whatsap Web"),
              ),
              PopupMenuItem(
                value: "Starred Messages",
                child: Text("Starred Messages"),
              ),
              PopupMenuItem(
                value: "Settings",
                child: Text("Settings"),
              ),
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Color.fromARGB(255, 1, 125, 156),
          controller: _controller,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(text: "CHAT"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: const [
        Text("Camera Opened!"),
        ChatPage(),
        Text("Status Opened!"),
        Text("Call Opened!"),
      ]),
    );
  }
}
