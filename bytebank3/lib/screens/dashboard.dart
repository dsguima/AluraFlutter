import 'package:bytebank3/screens/contatos/lista.dart';
import 'package:flutter/material.dart';

import 'feed/list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(save(Contact('Maria', 1234)));
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Image.network('');
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/bytebank_logo.png'),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              _FeatureItem('Transfer', Icons.monetization_on,
                  onClick: () => _navigatorListContacts(context)),
              _FeatureItem('Transaction feed', Icons.description,
                  onClick: () => _navigatorListTransaction(context)),
            ],
          ),
        )
      ],
    );
  }

  _navigatorListContacts(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListaContacts()));
  }

  _navigatorListTransaction(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ListaTransacionFeed()));
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: onClick,
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 32.0,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
