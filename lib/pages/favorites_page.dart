import 'package:flutter/material.dart';
import '../services/db_service.dart';
import '../models/book.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() {
    setState(() {
      futureBooks = DBService.getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Books')),
      body: FutureBuilder<List<Book>>(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text('No favorites yet.'));

          final books = snapshot.data!;
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (_, i) {
              final book = books[i];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await DBService.deleteItem(book.id);
                    refresh();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
