import 'dart:io';

import 'package:RentHouse/models/post-details.dart';
import 'package:RentHouse/ui/screens/screens.dart';
import 'package:RentHouse/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../pallete.dart';
import 'home_page.dart';

// import 'dart:html';

// import 'package:mime_type/mime_type.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  List<House> houses = List();
  House house;
  File sampleImg;
  final firestoreInstance = Firestore.instance;

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  String _error = '';
  String url = '';
  var imageUri;
  var mediaInfo;
  io.File sampleImage;
  //final _picker = ImagePicker();
  File _imageFile;
  File imageFile;
  dynamic pickImageError;
  String _retrieveDataError;
  //final ImagePicker _picker = ImagePicker();
  final picker = ImagePicker();
  //File imageFile;
  //final imageFile = ImagePicker();

  @override
  void initState() {
    super.initState();
    try {
      house = House(
          price: 0,
          title: '',
          address: '',
          date: DateTime.now().toString(),
          bedrooms: 0,
          bathrooms: 0,
          garages: 0,
          kitchen: 0,
          description: '',
          phone: '');
    } catch (e) {
      print(e);
    }
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    await _displayPickImageDialog(context,
        (double maxWidth, double maxHeight, int quality) async {
      try {
        _imageFile = await ImagePicker.pickImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: quality,
        );
        setState(() {
          imageFile = _imageFile;
        });
      } catch (e) {
        setState(() {
          pickImageError = e;
        });
      }
    });
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        imageFile = response.file;
      });
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  void uploadImage() async {
    final StorageReference postImageRef =
        FirebaseStorage.instance.ref().child('House images');

    var timeKey = new DateTime.now();

    final StorageUploadTask uploadTask =
        postImageRef.child(timeKey.toString() + '.jpg').putFile(sampleImage);

    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    print(imageUrl);

    url = imageUrl.toString();
    // window.console.info(url);

    handleSubmit(url);
  }

  void handleSubmit(url) {
    try {
      house.imageUrl = url.toString();
      firestoreInstance
          .collection("houses")
          .add(house.toJson())
          .then((value) {});
      formKey.currentState.reset();
      Navigator.of(context).pop(false);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      Navigator.of(context).pop(false);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                ),
              ),
              FormBuilder(
                key: formKey,
                //autovalidate: true,
                child: Column(
                  children: <Widget>[
                    /* FormBuilderDateTimePicker(
                      maxLines: 1,
                      autofocus: false,
                      name: "date",
                      inputType: InputType.date,
                      format: DateFormat("yyyy-MM-dd"),
                      decoration: InputDecoration(
                        labelText: "Fecha",
                        icon: new Icon(
                          Icons.date_range,
                          color: kOrange,
                        ),
                        // border: InputBorder.none,
                      ),
                      onChanged: (val) {
                        // house.date = val.toString();
                      },
                      validator: FormBuilderValidators.required(context),
                    ), */
                    FormBuilderTextField(
                      name: "title",
                      initialValue: null,
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
                      onChanged: (val) => house.title = val,
                      validator: FormBuilderValidators.required(context),
                    ),
                    Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                    FormBuilderTextField(
                      name: "address",
                      initialValue: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        labelText: "Dirección",
                        icon: new Icon(
                          Icons.house,
                          color: kOrange,
                        ),
                        // border: InputBorder.none,
                      ),
                      onChanged: (val) => house.address = val,
                      validator: FormBuilderValidators.required(context),
                    ),
                    Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                    FormBuilderTextField(
                      name: "phone",
                      keyboardType: TextInputType.number,
                      initialValue: null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        labelText: "Número de celular",
                        icon: new Icon(
                          Icons.phone,
                          color: kOrange,
                        ),
                        // border: InputBorder.none,
                      ),
                      onChanged: (val) => house.phone = val,
                      validator: FormBuilderValidators.required(context),
                    ),
                    Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                    FormBuilderTextField(
                        maxLines: 1,
                        autofocus: false,
                        name: "price",
                        keyboardType: TextInputType.number,
                        initialValue: null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          labelText: "Precio",
                          icon: new Icon(
                            Icons.attach_money,
                            color: kOrange,
                          ),
                          // border: InputBorder.none,
                        ),
                        onChanged: (val) => house.price = int.parse(val),
                        validator: FormBuilderValidators.required(context)),
                    Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "bedrooms",
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              labelText: "Dormitorios",
                              icon: new Icon(
                                Icons.bed,
                                color: kOrange,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => house.bedrooms = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4, 5, 6]
                                .map((bedrooms) => DropdownMenuItem(
                                    value: bedrooms, child: Text("$bedrooms")))
                                .toList(),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "bathrooms",
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.0),
                                ),
                              ),
                              labelText: "Baños",
                              icon: new Icon(
                                Icons.bathtub,
                                color: kOrange,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => house.bathrooms = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4, 5, 6]
                                .map((bathrooms) => DropdownMenuItem(
                                    value: bathrooms,
                                    child: Text("$bathrooms")))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "garages",
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              labelText: "Garajes",
                              icon: new Icon(
                                Icons.garage,
                                color: kOrange,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => house.garages = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4, 5, 6]
                                .map((garages) => DropdownMenuItem(
                                    value: garages, child: Text("$garages")))
                                .toList(),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "kitchen",
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              labelText: "Cocina",
                              icon: new Icon(
                                Icons.kitchen,
                                color: kOrange,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => house.garages = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4, 5, 6]
                                .map((garages) => DropdownMenuItem(
                                    value: garages, child: Text("$garages")))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // imagePicker();
                        _onImageButtonPressed(ImageSource.gallery,
                            context: context);
                      },
                      //onPressed: getImage,
                      heroTag: 'image',
                      tooltip: 'Pick Image from gallery',
                      child: const Icon(Icons.photo_library),
                    ),
                    Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                    Center(
                      child: !kIsWeb &&
                              defaultTargetPlatform == TargetPlatform.android
                          ? FutureBuilder<void>(
                              future: retrieveLostData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<void> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                  case ConnectionState.waiting:
                                    return const Text(
                                      ' Subir fotos',
                                      textAlign: TextAlign.center,
                                    );
                                  case ConnectionState.done:
                                    return previewImage();
                                  default:
                                    if (snapshot.hasError) {
                                      return Text(
                                        'Pick image: ${snapshot.error}}',
                                        textAlign: TextAlign.center,
                                      );
                                    } else {
                                      return const Text(
                                        'Aún no has elegido una imagen.',
                                        textAlign: TextAlign.center,
                                      );
                                    }
                                }
                              },
                            )
                          : previewImage(),
                    ),
                    Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
                    FormBuilderTextField(
                        name: "description",
                        initialValue: null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          labelText: "Descripción",
                          icon: new Icon(
                            Icons.description,
                            color: kOrange,
                          ),
                          // border: InputBorder.none,
                        ),
                        maxLines: 5,
                        onChanged: (val) => house.description = val,
                        validator: FormBuilderValidators.required(context)),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      _error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        child: SizedBox(
                          height: 40.0,
                          width: 400.0,
                          child: new RaisedButton(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0))),
                              // shape: new RoundedRectangleBorder(
                              //   borderRadius:
                              //    new BorderRadius.circular(30.0)),
                              color: kOrange,
                              child: new Text('Publicar',
                                  style: new TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                              onPressed: () {
                                if (formKey.currentState.saveAndValidate()) {
                                  uploadImage();
                                }
                              }), 
                        )),
                    FlatButton(
                        child: new Text(
                          'Cancelar',
                        ),
                        onPressed: () {
                          formKey.currentState.reset();
                        }),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  /* Future getImage() async {
    var tempImg = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImg = tempImg;
    });
  } */

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Agregar Fotos'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                  child: const Text('Seleccionar'),
                  onPressed: () {
                    onPick(null, null, null);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  Widget previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (imageFile != null) {
      sampleImage = io.File(imageFile.path);
      if (kIsWeb) {
        return Image.network(imageFile.path);
      } else {
        return Image.file(io.File((imageFile.path)));
      }
      // sampleImage = File(imageFile.path);
      // return Image.file(File(imageFile.path));
    } else if (pickImageError != null) {
      return Text(
        'Pick image error: $pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'Aún no has elegido una imagen.',
        textAlign: TextAlign.center,
      );
    }
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);
