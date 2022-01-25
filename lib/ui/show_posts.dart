import 'package:RentHouse/models/post-details.dart';
import 'package:flutter/material.dart';

class ShowPosts extends StatefulWidget {
  ShowPosts({Key key, @required this.post}) : super(key: key);
  final House post;

  @override
  _ShowPostsState createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShowPosts"),
      ),
      body: Card(
        color: Colors.cyan[50],
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          title: Text(
            "Title : ${widget.post.title}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Content: ${widget.post.address}",
          ),
        ),
      ),
    );
  }
}
