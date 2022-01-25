import 'package:RentHouse/models/post-details.dart';
import 'package:RentHouse/repository/loading.dart';
import 'package:RentHouse/repository/notif.dart';
import 'package:RentHouse/ui/screens/editposts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pallete.dart';
import '../show_posts.dart';

class MyPosts extends StatefulWidget {
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Publicaciones"),
      ),
      /* body: StreamBuilder<List<House>>(
        stream: DatabaseService(uid: user.uid).individualPosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<House> posts = snapshot.data;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    posts[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(posts[index].address),
                  trailing: PopupMenuButton(
                    onSelected: (result) async {
                      final type = result["type"];
                      final post = result["value"];
                      switch (type) {
                        case 'edit':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditPost(post: posts[index]),
                            ),
                          );
                          break;
                        case 'delete':
                          DatabaseService(uid: user.uid).deletePost(post.id);
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        value: {"type": "edit", "value": posts[index]},
                        child: Text('Edit'),
                      ),
                      PopupMenuItem(
                        value: {"type": "delete", "value": posts[index]},
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowPosts(post: posts[index]),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Loading();
          }
        },
      ), */
      body: Column(children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                width: size.width * 0.8,
                child: Text(
                  '... ',
                  style: kBodyText,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
