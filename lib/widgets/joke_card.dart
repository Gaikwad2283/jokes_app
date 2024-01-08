import 'package:flutter/material.dart';
import 'package:jokes_app/models/joke.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({super.key, required this.joke});

  final Joke joke;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        title: Text(joke.value),
        subtitle: Text(
          joke.createdAt,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
