import 'package:bytebank4/components/centered_message.dart';
import 'package:bytebank4/components/prgress.dart';
import 'package:bytebank4/database/dao/contato_dao.dart';
import 'package:bytebank4/models/contato_bean.dart';
import 'package:bytebank4/screens/contatos/cadastro.dart';
import 'package:bytebank4/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ListaContacts extends StatefulWidget {
  @override
  _ListaContactsState createState() => _ListaContactsState();
}

class _ListaContactsState extends State<ListaContacts> {
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    //Contacts.add(Contact('daniele', 12134, id:0));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
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
      future:
          Future.delayed(Duration(seconds: 1)).then((value) => _dao.findAll()),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return Progress(texto: 'Carregando lista de contatos');
            break;
          case ConnectionState.active:
            // usar para stream
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              final List<Contact> contacts = snapshot.data;
              return _listView(contacts);
            }
            return CenteredMessage('Você não tem contatos!',
                icon: Icons.warning);
            break;
        }
        return Text('Erro desconhecido');
      },
    );
  }

  ListView _listView(List<Contact> contacts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Contact contact = contacts[index];
        return ItemContact(contact, onclick: (){
          Navigator.of((context)).push(MaterialPageRoute(builder: (context)=>TransactionForm(contact)));
        },);
      },
      itemCount: contacts.length,

    );
  }

  _cadastrarContact(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CadastroContact()));
  }
}

class ItemContact extends StatelessWidget {
  final Contact contact;
final Function onclick;

  ItemContact(this.contact, {@required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onclick,
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
