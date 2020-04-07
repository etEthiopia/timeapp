import 'package:flutter/material.dart';

import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Column(children: <Widget>[
              Text(quote.text, style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 6.0),
              Row(children: <Widget>[
                Text(quote.author,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    )),
                IconButton(
                    alignment: Alignment.bottomRight,
                    color: Colors.red,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      delete();
                    })
              ], mainAxisAlignment: MainAxisAlignment.spaceBetween)
            ], crossAxisAlignment: CrossAxisAlignment.stretch)));
  }
}
