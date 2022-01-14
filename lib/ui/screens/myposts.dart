/* import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';  

}


import '../pallete.dart';

class Myposts extends StatefulWidget {
  @override
  _MypostsState createState() => new _MypostsState();
}

class _MypostsState extends State<Myposts> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
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
              'Mis publicaciones',
              style: kBodyText,
            ),
            centerTitle: true,
            backgroundColor: kOrange,
          ),
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

  




class ListViewProduct extends StatefulWidget {
  @override
  _ListViewProductState createState() => _ListViewProductState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _ListViewProductState extends State<ListViewProduct> {
  List<Product> items;
  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangedSubscription;

  @override
  void initState() {
    super.initState();
    items = new List();
    _onProductAddedSubscription =
        productReference.onChildAdded.listen(_onProductAdded);
    _onProductChangedSubscription =
        productReference.onChildChanged.listen(_onProductUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    _onProductAddedSubscription.cancel();
    _onProductChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Products List'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,          
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 3.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 1.0,
                    ),                    
                    Container(
                      padding: new EdgeInsets.all(3.0),
                      child: Card(                      
                        child: Row(
                          children: <Widget>[
                            //nuevo imagen
                             new Container( 
                              padding: new EdgeInsets.all(5.0),                          
                              child: '${items[position].productImage}' == ''
                                  ? Text('No image')
                                  : Image.network(
                                      '${items[position].productImage}' +
                                          '?alt=media',
                                          fit: BoxFit.fill,
                                      height: 57.0,
                                      width: 57.0,
                                    ),
                            ),
                            Expanded(
                              child: ListTile(
                                  title: Text(
                                    '${items[position].name}',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${items[position].description}',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  onTap: () => _navigateToProductInformation(
                                      context, items[position])),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => _showDialog(context, position),
                                ),
                                
                            //onPressed: () => _deleteProduct(context, items[position],position)),
                            IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () =>
                                    _navigateToProduct(context, items[position])),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.pinkAccent,
          onPressed: () => _createNewProduct(context),
        ),
      ),
    );
  }

  //nuevo para que pregunte antes de eliminar un registro
  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.purple,
                ),
                onPressed: () =>
                  _deleteProduct(context, items[position], position,),                                        
                    ),                   
            new FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onProductAdded(Event event) {
    setState(() {
      items.add(new Product.fromSnapShot(event.snapshot));
    });
  }

  void _onProductUpdate(Event event) {
    var oldProductValue =
        items.singleWhere((product) => product.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldProductValue)] =
          new Product.fromSnapShot(event.snapshot);
    });
  }

  void _deleteProduct(
      BuildContext context, Product product, int position) async {
    await productReference.child(product.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }

  void _navigateToProductInformation(
      BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductScreen(product)),
    );
  }

  void _navigateToProduct(BuildContext context, Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductInformation(product)),
    );
  }

  void _createNewProduct(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ProductScreen(Product(null, '', '', '', '', '', ''))),
    );
  }

  
}




            )
          ]),
        )
      ],
    );
  }
}
 */

/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Myposts extends StatefulWidget {
  const Myposts({Key? key}) : super(key: key);

  @override
  _MypostsState createState() => _MypostsState();
}

class _MypostsState extends State<Myposts> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _aniversarioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  CollectionReference _pessoas =
      FirebaseFirestore.instance.collection("pessoa");

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nomeController.text = documentSnapshot['nome'];
      _aniversarioController.text = documentSnapshot['aniversario'];
      _emailController.text = documentSnapshot['email'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  controller: _aniversarioController,
                  decoration: InputDecoration(
                    labelText: 'Data de Aniversário',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Criar' : 'Alterar'),
                  onPressed: () async {
                    final String nome = _nomeController.text;
                    final String data = _aniversarioController.text;
                    final String email = _emailController.text;
                    if (nome != null && data != null && email != null) {
                      if (action == 'create') {
                        await _pessoas.add({
                          "nome": nome,
                          "aniversario": data,
                          "email": email
                        });
                      }

                      if (action == 'update') {
                        await _pessoas.doc(documentSnapshot?.id).update({
                          "nome": nome,
                          "aniversario": data,
                          "email": email
                        });
                      }

                      _nomeController.text = '';
                      _aniversarioController.text = '';
                      _emailController.text = '';

                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _deletePerson(String pessoaId) async {
    await _pessoas.doc(pessoaId).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Pessoa excluída com sucesso!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD Básico')),
      body: StreamBuilder<dynamic>(
        stream: _pessoas.snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data.docs[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['nome']),
                    subtitle: Text(documentSnapshot['email']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _createOrUpdate(documentSnapshot),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deletePerson(documentSnapshot.id),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: Icon(Icons.add),
      ),
    );
  }
}
 */