import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('trying'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      //this is to create an instance so that after login goes here
      //body: StreamBuilder(
      //stream: Firestore.instance
      //  .collection('chats/BLEMtcOexKb9nlqIUVo9YwhMsGp2/messages')
      //  .snapshots(),
      // builder: (ctx, streamSnapshot) {
      // if (streamSnapshot.connectionState == ConnectionState.waiting) {
      //  return Center(
      //    child: CircularProgressIndicator(),
      // );
      //}
      // return ListView.builder(
      //   itemCount: documents.length,
      //  itemBuilder: (ctx, index) => Container(
      //    padding: EdgeInsets.all(8),
      //    child: Text(documents[index]['text']),
    );
    //    );
    //   },
    //  ),
    // floatingActionButton: FloatingActionButton(
    //     child: Icon(Icons.add),
    // onPressed: () {
    //  Firestore.instance
    //    .collection('chats/BLEMtcOexKb9nlqIUVo9YwhMsGp2/messages')
    //    .add({'text': 'trial'});
    // }),
    // );
  }
}
