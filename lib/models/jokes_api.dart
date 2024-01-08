import 'package:jokes_app/models/joke.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JokesApi{

  static Future<List<Joke>> getJokes() async {
    const String baseUrl = "https://api.chucknorris.io";

    var data = await http.get(Uri.parse('$baseUrl/jokes/search?query=cats'));
    
    var jsonData = json.decode(data.body);

    List<Joke> jokes = [];

    for (var joke in jsonData["result"]) {
      Joke newJoke = Joke(joke["created_at"], joke["id"],
          joke["url"], joke["value"]);
      jokes.add(newJoke);
    }

    return jokes;
  }
}