import 'package:flutter/material.dart';
import 'package:flutter/services.dart'  show rootBundle;
import 'dart:convert';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Mission01Adv());
}

class Mission01Adv extends StatefulWidget {
  const Mission01Adv({super.key});

  @override
  Mission01AdvState createState() => Mission01AdvState();
}

class Mission01AdvState extends State<Mission01Adv> {
  late List<Books> books;

  Future<void> loadJson() async {
    final String jsonString = await rootBundle.loadString('assets/Aiffel_05/mission_1_adv.json');
    final dynamic jsonResponse = json.decode(jsonString);
    books = <Books>[];

    for (int i = 0; i < jsonResponse['books'].length; i++) {
      final Books book = Books();
      book.fromJson(jsonResponse, i);
      books.add(book);
      debugPrint(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mission01Adv'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("There are ${books.length} books."),
            Expanded(
              child: FutureBuilder<void>(
                future: loadJson(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && books.isNotEmpty) {
                    return ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("${index+1}: ${books[index].title[0]}"),
                          subtitle: Text("Written by ${books[index].authors[0]}"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(book: books[index]),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            )
          ]
        ),
      ),
    );
  }  
}

class DetailPage extends StatelessWidget {
  final Books book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title[0]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Authors: ${book.authors[0]}'),
          Text('Publisher: ${book.publisher[0]}'),
          Text('Genres: ${book.genres[0]}'),
          if (book.reviews != null)
            for (var review in book.reviews!)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text('Reviewer: ${review.reviewerName}'),
                  Text('Rating: ${review.rating}'),
                  Text('Comment: ${review.comment}'),
                ],
              ),
        ],
      ),
    );
  }
}

class Books {
  List<String> title;
  List<String> authors;
  List<String> publisher;
  List<String> genres;
  List<Review>? reviews;

  Books ({
    this.title = const ["DefaultTitle"],
    this.authors = const ["DefaultAuthor"],
    this.publisher = const ["DefaultPublisher"],
    this.genres = const ["DefaultGenre"],
    this.reviews,
  });

  void fromJson(Map<String, dynamic> json, int index) {
    json = json['books'][index];
    title = <String>[json['title']];
    authors = List<String>.from(json['authors']);
    publisher = <String>[json['publisher']];
    genres = List<String>.from(json['genres']);

    if (json['reviews'] != null) {
      reviews = <Review>[];
      json['reviews'].forEach((dynamic review) {
        reviews!.add(Review(
          reviewerName: review['reviewerName'],
          rating: review['rating'],
          comment: review['comment'],
        ));
      });
    }
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    json['title'] = title;
    json['authoers'] = authors;
    json['publisher'] = publisher;
    json['genres'] = genres;

    if (reviews != null) {
      for (var review in reviews!) {
        json['reviews'].add(<String, dynamic>{
          'reviewerName': review.reviewerName,
          'rating': review.rating,
          'comment': review.comment,
        });
      }
    }

    return json;
  }
}

class Review {
  String reviewerName;
  int rating;
  String comment;

  Review({
    this.reviewerName = "DefaultReviewer",
    this.rating = 0,
    this.comment = "DefaultComment"
  });
}