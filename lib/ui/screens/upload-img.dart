/* import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renthouse/models/post-details.dart';
import '../pallete.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'ImageUploadModel.dart';
//typedef OnSaveCallBack = Function();

class UploadImg extends StatefulWidget {
//final OnSaveCallBack onSave;

  //const UploadImg({Key key, @required this.onSave}) : super(key: key);

  @override
  _UploadImgState createState() => _UploadImgState();
}

class _UploadImgState extends State<UploadImg> {
  List<Home> homes = List();
  Home home;

  dynamic pickImageError;
  String _retrieveDataError;
  final ImagePicker _picker = ImagePicker();
  /* static const menuItems = <String>[
    '1',
    '2'
        '3'
        '4+'
  ];
  final List<DropdownMenuItem<String>> _opciones =
      menuItems.map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ));
  String _btn1SelectedVal = '1'; */

  @override
  void initState() {
    super.initState();
    try {
      home = Home(
          price: 0,
          address: '',
          bedrooms: 0,
          bathrooms: 0,
          garages: 0,
          description: '',
          phone: '',
          title: '');
    } catch (e) {
      print(e);
    }
  }

  List<Object> images = [];
  File sampleImg;
  String title;
  String description;
  String place;
  int phone;
  String price;
  File _imageFile;
  //final formKey = GlobalKey<FormState>();
  String _error = '';
  //final _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  bool _numberInputIsValid = true;
/*   @override
  void initState() {
    super.initState();
    setState(() {
      images.add("Add image");
      images.add("Add image");
      images.add("Add image");
      images.add("Add image");
    });
  }
 */
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kOrange,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kwhite,
            ),
          ),
          title: Text(
            'Describe tu inmueble',
            style: kBodyText,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  FormBuilder(
                    key: formKey,
                    //autovalidate: true,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          name: "phone",
                          initialValue: null,
                          decoration: InputDecoration(
                            labelText: "Telefono",
                            icon: new Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            // border: InputBorder.none,
                          ),
                          onChanged: (val) => home.phone = val,
                          validator: FormBuilderValidators.required(context),
                        ),
                        FormBuilderTextField(
                          name: "address",
                          initialValue: null,
                          decoration: InputDecoration(
                            labelText: "Direccion",
                            icon: new Icon(
                              Icons.house,
                              color: Colors.grey,
                            ),
                            // border: InputBorder.none,
                          ),
                          onChanged: (val) => home.address = val,
                          validator: FormBuilderValidators.required(context),
                        ),
                        FormBuilderTextField(
                          maxLines: 1,
                          autofocus: false,
                          name: "price",
                          initialValue: null,
                          decoration: InputDecoration(
                            labelText: "Precio",
                            icon: new Icon(
                              Icons.attach_money,
                              color: Colors.grey,
                            ),
                            // border: InputBorder.none,
                          ),
                          onChanged: (val) => home.price = int.parse(val),
                          validator: FormBuilderValidators.required(context),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: FormBuilderDropdown(
                                autofocus: false,
                                name: "bedrooms",
                                decoration: InputDecoration(
                                  labelText: "Bedrooms",
                                  icon: new Icon(
                                    Icons.bed,
                                    color: Colors.grey,
                                  ),
                                  // border: InputBorder.none,
                                ),
                                onChanged: (val) => home.bedrooms = val,
                                hint: Text('-'),
                                validator:
                                    FormBuilderValidators.required(context),
                                items: [0, 1, 2, 3, 4, 5, 6]
                                    .map((bedrooms) => DropdownMenuItem(
                                        value: bedrooms,
                                        child: Text("$bedrooms")))
                                    .toList(),
                              ),
                            ),
                            Expanded(
                              child: FormBuilderDropdown(
                                autofocus: false,
                                name: "bathrooms",
                                decoration: InputDecoration(
                                  labelText: "Bathrooms",
                                  icon: new Icon(
                                    Icons.bathtub,
                                    color: Colors.grey,
                                  ),
                                  // border: InputBorder.none,
                                ),
                                onChanged: (val) => home.bathrooms = val,
                                hint: Text('-'),
                                validator:
                                    FormBuilderValidators.required(context),
                                items: [0, 1, 2, 3, 4, 5, 6]
                                    .map((bathrooms) => DropdownMenuItem(
                                        value: bathrooms,
                                        child: Text("$bathrooms")))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "garages",
                            decoration: InputDecoration(
                              labelText: "Garajes",
                              icon: new Icon(
                                Icons.garage,
                                color: Colors.grey,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => home.garages = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4, 5, 6]
                                .map((garages) => DropdownMenuItem(
                                    value: garages, child: Text("$garages")))
                                .toList(),
                          ),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        FormBuilderTextField(
                          name: "description",
                          initialValue: null,
                          decoration: InputDecoration(
                            labelText: "Description",
                            icon: new Icon(
                              Icons.description,
                              color: Colors.grey,
                            ),
                            // border: InputBorder.none,
                          ),
                          onChanged: (val) => home.description = val,
                          validator: FormBuilderValidators.required(context),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        FloatingActionButton(
                          onPressed: getImage,
                          tooltip: 'Add Image',
                          child: Icon(Icons.add_a_photo),
                        ),
                        Text(
                          _error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),

                        // shape: new RoundedRectangleBorder(
                        //     borderRadius:
                        //         new BorderRadius.circular(30.0)),

                        RaisedButton(
                          elevation: 10.0,
                          child: Text("Publicar"),
                          onPressed: uploadPost,
                        ),

                        //uploadPost
                        /* onPressed: () {
                              _formKey.currentState.save();
                              if (_formKey.currentState.validate()) {
                                print(_formKey.currentState.value);
                              } else {
                                print("validation failed");
                              }
                            }, */
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )

        /* Center(
        child:
            sampleImg == null ? Text('Selecciona una imagen') : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: Icon(Icons.add_a_photo),
        backgroundColor: kOrange,
      ), */

        );
  }

  Future getImage() async {
    var tempImg = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImg = tempImg;
    });
  }
/* 
  Widget enableUpload() {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
         /*  child: Form(
            key: formKey, */
            child: Column(
              children: <Widget>[
                FormBuilder(
                key: formKey,
              //autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                        name: "phone",
                        initialValue: null,
                        decoration: InputDecoration(
                          labelText: "Telefono",
                          icon: new Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          // border: InputBorder.none,
                        ),
                        onChanged: (val) => home.phone = val,
                        validator: FormBuilderValidators.required(context),),
                    FormBuilderTextField(
                        name: "address",
                        initialValue: null,
                        decoration: InputDecoration(
                          labelText: "Direccion",
                          icon: new Icon(
                            Icons.house,
                            color: Colors.grey,
                          ),
                          // border: InputBorder.none,
                        ),
                        onChanged: (val) => home.address = val,
                        validator: FormBuilderValidators.required(context),),
                    FormBuilderTextField(
                      maxLines: 1,
                      autofocus: false,
                      name: "price",
                      initialValue: null,
                      decoration: InputDecoration(
                        labelText: "Precio",
                        icon: new Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                        ),
                        // border: InputBorder.none,
                      ),
                      onChanged: (val) => home.price = int.parse(val),
                      validator: FormBuilderValidators.required(context),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "bedrooms",
                            decoration: InputDecoration(
                              labelText: "Bedrooms",
                              icon: new Icon(
                                Icons.bed,
                                color: Colors.grey,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => home.bedrooms = val,
                            hint: Text('-'),
                           validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4, 5, 6]
                                .map((bedrooms) => DropdownMenuItem(
                                    value: bedrooms, child: Text("$bedrooms")))
                                .toList(),
                          ),
                        ),
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "bathrooms",
                            decoration: InputDecoration(
                              labelText: "Bathrooms",
                              icon: new Icon(
                                Icons.bathtub,
                                color: Colors.grey,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => home.bathrooms = val,
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
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "garages",
                            decoration: InputDecoration(
                              labelText: "Garajes",
                              icon: new Icon(
                                Icons.garage,
                                color: Colors.grey,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => home.garages = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4, 5, 6]
                                .map((garages) => DropdownMenuItem(
                                    value: garages, child: Text("$garages")))
                                .toList(),
                          ),
                        ),
                      
                    SizedBox(
                      height: 10.0,
                    ),
                    FormBuilderTextField(
                      name: "description",
                      initialValue: null,
                      decoration: InputDecoration(
                        labelText: "Description",
                        icon: new Icon(
                          Icons.description,
                          color: Colors.grey,
                        ),
                        // border: InputBorder.none,
                      ),
                      onChanged: (val) => home.description = val,
                      validator: FormBuilderValidators.required(context),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      _error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    
                            // shape: new RoundedRectangleBorder(
                            //     borderRadius:
                            //         new BorderRadius.circular(30.0)),
                            
                      RaisedButton(
                  elevation: 10.0,
                  child: Text("Publicar"),
                  onPressed: uploadPost,
                ),
                             
                            //uploadPost
                            /* onPressed: () {
                              _formKey.currentState.save();
                              if (_formKey.currentState.validate()) {
                                print(_formKey.currentState.value);
                              } else {
                                print("validation failed");
                              }
                            }, */
                          
                        
                  ],
                ),
              ),
              ],
              
 */

  /* children: <Widget>[
                Image.file(
                  sampleImg,
                  height: 300.0,
                  width: 600.0,
                ),
                Center(
                    child: Container(
                  width: 150,
                  height: 150.0,
                  child: buildGridView(),
                )),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Titulo",
                      border: UnderlineInputBorder(),
                      errorBorder: UnderlineInputBorder()),
                  validator: (value) {
                    return value.isEmpty ? "El campo es requerido" : null;
                  },
                  onSaved: (value) {
                    return title = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Descripcion",
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    return value.isEmpty ? "El campo es requerido" : null;
                  },
                  onSaved: (value) {
                    return description = value;
                  },
                ),
               /*  ListTile(
                  title: const Text('Baños'),
                  trailing: DropdownButton<String>(
                    value: _btn1SelectedVal,
                    onChanged: (String newValue) {
                      setState(() {
                        _btn1SelectedVal = newValue;
                      });
                    },
                    items: this._opciones,
                  ),
                ), */

                
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Direccion",
                    icon: new Icon(
                            Icons.house,
                            color: Colors.grey,
                          ),
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    return value.isEmpty ? "El campo es requerido" : null;
                  },
                  onSaved: (value) {
                    return place = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Precio",
                      errorText: _numberInputIsValid
                          ? null
                          : 'Please enter an integer!',
                      prefixText: '\$',
                      suffixText: 'USD',
                      suffixStyle: TextStyle(color: Colors.green)),
                  validator: (value) {
                    return value.isEmpty ? "El campo es requerido" : null;
                  },
                  onSaved: (value) {
                    return price;
                  },
                ),
                Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "bedrooms",
                            decoration: InputDecoration(
                              labelText: "Dormitorios",
                              icon: new Icon(
                                Icons.room,
                                color: Colors.grey,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => home.bedrooms = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4, 5, 6]
                                .map((bedrooms) => DropdownMenuItem(
                                    value: bedrooms, child: Text("$bedrooms")))
                                .toList(),
                          ),
                        ),
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "bathrooms",
                            decoration: InputDecoration(
                              labelText: "Banos",
                              icon: new Icon(
                                Icons.room,
                                color: Colors.grey,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => home.bathrooms = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3, 4]
                                .map((bathrooms) => DropdownMenuItem(
                                    value: bathrooms,
                                    child: Text("$bathrooms")))
                                .toList(),
                          ),
                        ),
                        Expanded(
                          child: FormBuilderDropdown(
                            autofocus: false,
                            name: "garages",
                            decoration: InputDecoration(
                              labelText: "Garajes",
                              icon: new Icon(
                                Icons.garage,
                                color: Colors.grey,
                              ),
                              // border: InputBorder.none,
                            ),
                            onChanged: (val) => home.garages = val,
                            hint: Text('-'),
                            validator: FormBuilderValidators.required(context),
                            items: [0, 1, 2, 3]
                                .map((garages) => DropdownMenuItem(
                                    value: garages, child: Text("$garages")))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Telefono",
                     // attribute: "phone",
                      icon: new Icon(
                            Icons.phone,color: Colors.grey,
                          ),
                      border: UnderlineInputBorder(),
                      errorText: _numberInputIsValid
                          ? null
                          : 'Please enter an integer!',
                      prefixText: "+593   "),
                  validator: (value) {
                    return value.isEmpty ? "titulo is required" : null;
                  },
                  onSaved: (value) {
                    return phone;
                  },
                ),
                RaisedButton(
                  elevation: 10.0,
                  child: Text("Publicar"),
                  onPressed: () {
                                if (formKey.currentState.saveAndValidate()) {
                                  // uploadFile(mediaInfo, 'House images',
                                  //     mediaInfo.fileName);
                                  uploadImage();
                                }
                              }
                  //onPressed: uploadPost,
                ),
                SizedBox(
                  height: 15.0,
                ),
              ], */
  /*     ),
          ),
        ),
     
    ); */

  void uploadPost() async {
    if (validateAndSave()) {
      //widget.onSave(sampleImg, title, price);
      Navigator.pop(context);
    }
  }

  bool validateAndSave() {
    final FormBuilderState form = formKey.currentState;
    //final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

/* 

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index] as ImageUploadModel;
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Image.file(
                  File(uploadModel.imageFile.path),
                  width: 300,
                  height: 300,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(() {
                        images.replaceRange(index, index + 1, ['Add Image']);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //_onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  } 
   */

// Future _onAddImageClick(int index) async {
//   PickedFile? pickedFile = await _picker.getImage(
//     source: ImageSource.gallery,
//     imageQuality: 50,
//   );
//   if (pickedFile != null) {
//     File pFile = File(pickedFile.path);
//     int fileSize = await pFile.length();
//     if(fileSize > 1024 * 1024) { //1MB
//       print("file path : " + pFile.path + "file Size : " + fileSize.toString());
//       final snackBar = SnackBar(content: Text("이미지의 사이즈가 너무 큽니다."));
//       ScaffoldMessenger.of(this.context).showSnackBar(snackBar);
//       return;
//     }
//     _imageFile = File(pickedFile.path);
//   }
//   else
//     return;
//   setState(() {
//     getFileImage(index);
//   });
// }

// void getFileImage(int index) async {
//   setState(() {
//     ImageUploadModel imageUpload = new ImageUploadModel();
//     imageUpload.isUploaded = false;
//     imageUpload.uploading = false;
//     imageUpload.imageFile = _imageFile;
//     imageUpload.imageUrl = '';
//     images.replaceRange(index, index + 1, [imageUpload]);
//   });
// }

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}
 */


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../pallete.dart';
//import 'ImageUploadModel.dart';

typedef OnSaveCallBack = Function(File image, String title);

class UploadImg extends StatefulWidget {
  final OnSaveCallBack onSave;

  const UploadImg({Key key, @required this.onSave}) : super(key: key);

  @override
  _UploadImgState createState() => _UploadImgState();
}

class _UploadImgState extends State<UploadImg> {
  
  List<Object> images = [];
  File sampleImg;
  String title;
  String description;
  String place;
  int phone;
  String price;
  File _imageFile;
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  bool _numberInputIsValid = true;
  @override
  void initState() { 
    super.initState();
    setState((){
    images.add("Add image");
    images.add("Add image");
    images.add("Add image");
    images.add("Add image");
  });
    
  }
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrange,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kwhite,
          ),
        ),
        title: Text(
          'Describe tu inmueble',
          style: kBodyText,
        ),
        centerTitle: true,
      ),
      body: Center(
        child:
            sampleImg == null ? Text('Selecciona una imagen') : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: Icon(Icons.add_a_photo),
        backgroundColor: kOrange,
      ),
    );
  }

  Future getImage() async {
    var tempImg = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImg = tempImg;
    });
  } 

  Widget enableUpload() {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Image.file(
                  sampleImg,
                  height: 300.0,
                  width: 600.0,
                ),
                Center(
                child: Container(
              width: 150,
              height: 150.0,
              child: buildGridView(),
            )),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Titulo", 
                    border: UnderlineInputBorder(), 
                    errorBorder: UnderlineInputBorder()),
                  validator: (value) {
                    return value.isEmpty ? "El campo es requerido" : null;
                  },
                  onSaved: (value) {
                    return title = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Descripcion",
                    border: UnderlineInputBorder(), ),
                  validator: (value) {
                    return value.isEmpty ? "El campo es requerido" : null;
                  },
                  onSaved: (value) {
                    return description = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Direccion",
                    border: UnderlineInputBorder(), ),
                  validator: (value) {
                    return value.isEmpty ? "El campo es requerido" : null;
                  },
                  onSaved: (value) {
                    return place = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Precio",
                    errorText: _numberInputIsValid
                            ? null
                            : 'Please enter an integer!',
                        prefixText: '\$',
                        suffixText: 'USD',
                        suffixStyle: TextStyle(color: Colors.green)
                    ),
                  validator: (value) {
                    return value.isEmpty ? "El campo es requerido" : null;
                  },
                  onSaved: (value) {
                    return price;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Telefono",
                      border: UnderlineInputBorder(), 
                      errorText: _numberInputIsValid
                          ? null
                          : 'Please enter an integer!',
                      prefixText: "+593   "),
                  validator: (value) {
                    return value.isEmpty ? "titulo is required" : null;
                  },
                  onSaved: (value) {
                    return phone ;
                  },
                ),
                RaisedButton(
                  elevation: 10.0,
                  child: Text("Publicar"),
                  onPressed: uploadPost,
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadPost() async {
    if (validateAndSave()) {
      widget.onSave(sampleImg, title);
      Navigator.pop(context);
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index] as ImageUploadModel;
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Image.file(
                  File(uploadModel.imageFile.path),
                  width: 300,
                  height: 300,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(() {
                        images.replaceRange(index, index + 1, ['Add Image']);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //_onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  }

  // Future _onAddImageClick(int index) async {
  //   PickedFile? pickedFile = await _picker.getImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 50,
  //   );
  //   if (pickedFile != null) {
  //     File pFile = File(pickedFile.path);
  //     int fileSize = await pFile.length();
  //     if(fileSize > 1024 * 1024) { //1MB
  //       print("file path : " + pFile.path + "file Size : " + fileSize.toString());
  //       final snackBar = SnackBar(content: Text("이미지의 사이즈가 너무 큽니다."));
  //       ScaffoldMessenger.of(this.context).showSnackBar(snackBar);
  //       return;
  //     }
  //     _imageFile = File(pickedFile.path);
  //   }
  //   else
  //     return;
  //   setState(() {
  //     getFileImage(index);
  //   });
  // }

  // void getFileImage(int index) async {
  //   setState(() {
  //     ImageUploadModel imageUpload = new ImageUploadModel();
  //     imageUpload.isUploaded = false;
  //     imageUpload.uploading = false;
  //     imageUpload.imageFile = _imageFile;
  //     imageUpload.imageUrl = '';
  //     images.replaceRange(index, index + 1, [imageUpload]);
  //   });
  // }

}
class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}