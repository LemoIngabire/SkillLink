import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/database_services.dart';
import '../widgets/message_tile.dart';

class ChatPage extends StatefulWidget {
  final String uid;
  final String userName;
  const ChatPage({super.key,
    required this.uid,
    required this.userName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream<QuerySnapshot>? chats;
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    getChat();
    super.initState();
  }

  getChat() {
    DatabaseService().getChats(widget.uid).then((val) {
      setState(() {
        chats = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.userName),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         nextScreen(
        //             context,
        //             GroupInfo(
        //               groupId: widget.uid,
        //               groupName: widget.userName,
        //               adminName: admin,
        //             ));
        //       },
        //       icon: const Icon(Icons.info))
        // ],
      ),
      body: Stack(
        children: <Widget>[
          // chat messages here
          chatMessages(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.grey[700],
              child: Row(children: [
                Expanded(
                    child: TextFormField(
                      controller: messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Send a message...",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    sendMessage();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            return MessageTile(
                message: snapshot.data.docs[index]['message'],
                sender: snapshot.data.docs[index]['sender'],
                sentByMe: widget.userName ==
                    snapshot.data.docs[index]['sender']);
          },
        ) : Container();
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": messageController.text,
        "sender": widget.userName,
        "time": DateTime
            .now()
            .millisecondsSinceEpoch,
      };

      DatabaseService().sendMessage(widget.uid, chatMessageMap);
      setState(() {
        messageController.clear();
      }
      );
    }
  }
}





































// import 'package:flutter/material.dart';
// import 'package:skill_link/widgets/groupchat_widget.dart';
// import 'package:skill_link/widgets/personalchat_widget.dart';
//
// class ChatPage extends StatefulWidget {
//   @override
//   State<ChatPage> createState() => _ChatPage();
// }
//
// class _ChatPage extends State<ChatPage> {
//   int _buttonIndex = 0;
//   final _chatWidgets = [
//     PersonalChat(),
//     GroupChat(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 40, left: 15),
//             child: Text(
//               'Chats',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           SizedBox(height: 5),
//           Container(
//             padding: EdgeInsets.all(5),
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       _buttonIndex = 0;
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
//                     decoration: BoxDecoration(
//                       color: _buttonIndex == 0 ? Colors.deepOrange : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       'Personal',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 10,
//                         color: _buttonIndex == 0 ? Colors.white : Colors.black38,
//                       ),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       _buttonIndex = 1;
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
//                     decoration: BoxDecoration(
//                       color: _buttonIndex == 1 ? Colors.deepOrange : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       'Groups',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 10,
//                         color: _buttonIndex == 1 ? Colors.white : Colors.black38,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//           Expanded(
//             child: SingleChildScrollView(
//               child: _chatWidgets[_buttonIndex],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
