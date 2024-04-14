// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:emoji_selector/emoji_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back_sharp,
                size: 25,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? "assets/group.svg"
                      : "assets/person.svg",
                  color: Colors.white,
                  height: 28,
                  width: 20,
                ),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(7.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: const TextStyle(
                      fontSize: 18.5, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Last Seen 12 minutes ago!",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "View Content",
                child: Text("View Content"),
              ),
              const PopupMenuItem(
                value: "Media, Links and Docs",
                child: Text("Media, Links and Docs"),
              ),
              const PopupMenuItem(
                value: "Whatsap Web",
                child: Text("Whatsap Web"),
              ),
              const PopupMenuItem(
                value: "Search",
                child: Text("Search"),
              ),
              const PopupMenuItem(
                value: "Mute Notification",
                child: Text("Mute Notification"),
              ),
              const PopupMenuItem(
                value: "Wall Paper",
                child: Text("Wall Paper"),
              ),
            ];
          })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 55,
                          child: Card(
                            margin: const EdgeInsets.only(
                                left: 10, right: 2, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'typing',
                                contentPadding: const EdgeInsets.all(8),
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.emoji_emotions,
                                    color: Colors.red,
                                  ),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) =>
                                                bottomSheet());
                                      },
                                      icon: const Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.camera_alt))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            right: 2,
                          ),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF128C7E),
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    show ? emojiSelector() : Container()
                  ],
                ),
              ),
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget emojiSelector() {
    return EmojiSelector(
      onSelected: (EmojiData) {
        setState(() {
          _controller.text = _controller.text + EmojiData.char;
        });
      },
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, "Document", Colors.indigo),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, "Camera", Colors.pink),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, "Gallery", Colors.purple)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, "Audio", Colors.orange),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, "Location", Colors.teal),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, "Contact", Colors.blue)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData ic, String st, Color cl) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: cl,
            radius: 30,
            child: Icon(
              ic,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            st,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
          )
        ],
      ),
    );
  }
}
