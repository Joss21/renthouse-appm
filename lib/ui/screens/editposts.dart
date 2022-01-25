/* import 'package:RentHouse/models/post-details.dart';
import 'package:RentHouse/repository/notif.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPost extends StatefulWidget {
  EditPost({Key key, @required this.post}) : super(key: key);
  final House post;
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final _postEditFormKey = GlobalKey<FormState>();
  final titleInputController = TextEditingController();
  final contentInputController = TextEditingController();

  bool _isSubmitting = false;

  get kOrange => null;

  @override
  initState() {
    titleInputController.text = widget.post.title;
    contentInputController.text = widget.post.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("EditPost"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _postEditFormKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    labelText: "Título",
                    icon: new Icon(
                      Icons.edit_attributes,
                      color: kOrange,
                    ),
                    // border: InputBorder.none,
                  ),
                  controller: titleInputController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "eeee";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    labelText: "dirrecion",
                    icon: new Icon(
                      Icons.place,
                      color: kOrange,
                    ),
                    // border: InputBorder.none,
                  ),
                  controller: contentInputController,
                ),
                SizedBox(height: 20),
                _isSubmitting
                    ? Center(child: CircularProgressIndicator())
                    : RaisedButton(
                        child: Text("Update Post"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () async {
                          if (_postEditFormKey.currentState.validate()) {
                            try {
                              setState(() {
                                _isSubmitting = true;
                              });
                              await DatabaseService(uid: user.uid).editPost(
                                widget.post.key,
                                titleInputController.text,
                                contentInputController.text,
                              );
                              Navigator.pop(context);
                            } catch (e) {
                              print('Error Happened!!!: $e');
                              setState(() {
                                _isSubmitting = false;
                              });
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */