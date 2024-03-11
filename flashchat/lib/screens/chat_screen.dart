import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = FirebaseFirestore.instance;
final msgcontroller = TextEditingController();
final _auth = FirebaseAuth.instance;
late User loggedInUser;
late String messageText;

class ChatScreen extends StatefulWidget {

  static const String id = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser()
  {
    try{
      final user  = _auth.currentUser!;
      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch(e){
      print("chatscreen");
      print(e);

    }
  }
  void getMessageStream() async {
    await for (var snapshot in _firebase.collection('messages').orderBy('timestamp').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
               getMessageStream();

                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: msgcontroller,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      msgcontroller.clear();
                      _firebase.collection('messages').doc(DateTime.now().millisecondsSinceEpoch.toString()).set({'msg': messageText, 'user': loggedInUser.email, 'timestamp': FieldValue.serverTimestamp()});

                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MessageStream extends StatelessWidget {
  const MessageStream({Key? key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebase.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data?.docs.reversed;
          List<MessageBubble> messagesBubbles = [];
          final currentuser = loggedInUser.email;
          for (var message in messages!) {
            final messageSender = message['user'];
            final messageText = message['msg'];
            final isMe = currentuser.toString() == messageSender.toString(); // Explicit comparison

            final messageBubble = MessageBubble(text: messageText, sender: messageSender, isMe: isMe);
            messagesBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              children: messagesBubbles,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
class MessageBubble extends StatelessWidget {
  MessageBubble({required this.text,required this.sender,required this.isMe});
  late String text;
  late String sender;
  bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(sender,style: TextStyle(color: Colors.black),),
          Material(
            elevation: 20,
            borderRadius: isMe?BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)):
            BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),

            color:isMe?Colors.lightBlueAccent:Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text('$text',style: TextStyle(fontSize: 20,color:isMe?Colors.white:Colors.black),),
              )),
        ],
      ),
    );
  }
}

