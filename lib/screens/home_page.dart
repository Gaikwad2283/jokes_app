import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/models/jokes_api.dart';
import 'package:jokes_app/widgets/joke_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Joke> jokes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getJokes();
  }

  Future<void> getJokes() async {
    jokes = await JokesApi.getJokes();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sentiment_satisfied),
            SizedBox(width: 10),
            Text(widget.title),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (ctx, index) {
                return JokeCard(joke: jokes[index]);
              },
            ),
    );
  }
}
