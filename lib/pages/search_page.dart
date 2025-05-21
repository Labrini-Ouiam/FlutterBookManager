import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/db_service.dart';
import '../models/book.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Book> books = [];
  String query = '';
  bool loading = false;

  void search() async {
    setState(() => loading = true);
    books = await ApiService.searchBooks(query);
    setState(() => loading = false);
  }

  Widget buildBookTile(Book book) {
    return FutureBuilder<bool>(
      future: DBService.isFavorite(book.id),
      builder: (context, snapshot) {
        final isFav = snapshot.data ?? false;
        return ListTile(
          title: Text(book.title),
          subtitle: Text(book.author),
          trailing: IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
            onPressed: () async {
              if (isFav) {
                await DBService.deleteItem(book.id);
              } else {
                await DBService.insertItem(book);
              }
              setState(() {});
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Books'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              onChanged: (val) => query = val,
              decoration: InputDecoration(
                hintText: 'Enter book keyword...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: search,
                ),
              ),
            ),
          ),
          Expanded(
            child: loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (_, i) => buildBookTile(books[i]),
                  ),
          ),
        ],
      ),
    );
  }
}
