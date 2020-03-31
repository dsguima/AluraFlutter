import 'package:bytebank2/database/app_database.dart';
import 'package:bytebank2/models/contato_bean.dart';
import 'package:bytebank2/screens/contatos/cadastro.dart';
import 'package:flutter/material.dart';

class ListaContacts extends StatefulWidget {
  @override
  _ListaContactsState createState() => _ListaContactsState();
}

class _ListaContactsState extends State<ListaContacts> {
  @override
  Widget build(BuildContext context) {
    //Contacts.add(Contact('daniele', 12134, id:0));
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: _listaContatos(),
      //_list(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _cadastrarContact(context),
      ),
    );
  }

  FutureBuilder<List<Contact>> _listaContatos() {
    return FutureBuilder(
      initialData: List(),
      future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return _loading();
            break;
          case ConnectionState.active:
            // usar para stream
            break;
          case ConnectionState.done:
            final List<Contact> contacts = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];
                return ItemContact(contact);
              },
              itemCount: contacts.length,
            );
            break;
        }
        return Text('Erro desconhecido');
      },
    );
  }

  Center _loading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 20.0,),
          Text('Loading...'),
        ],
      ),
    );
  }

  _cadastrarContact(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CadastroContact()));
  }
}

class ItemContact extends StatelessWidget {
  final Contact contact;

  ItemContact(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),),
        subtitle: Text(contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),),
      ),
    );
  }
}

