import 'package:flutter/material.dart';
import 'quote.dart';
import 'quoteCard.dart';

main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(author: "ሃይሌ ሩትስ", text: "ጨው ፡ ለራስህ ስትል ጣፍጥ"),
    Quote(author: "ህዝብ", text: "ያረጀ አንበሳ የዝንብ መጫወቻ ይሆናል"),
    Quote(
        author: "አንዷ",
        text: "ጨዋ ልጅ ነው ብዬ ጭኔን ባንተራሰው ፣ እግሮቼ ውስጥ ገብቶ አንጀቴን አራሰው "),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
