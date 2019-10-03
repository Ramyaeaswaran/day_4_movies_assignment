import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'movies.dart';
import 'dart:core';
import 'dart:math';


void main() {
  runApp(MaterialApp(
    home:MoviesPage() ,

  ),);
}

// You are given json string of movies list (see file movies.dart)
String moviesList = MoviesList.moviesJsonList;
List movies = jsonDecode(MoviesList.moviesJsonList);
// Hint:
// Convert the string to List of maps using jsonDecode and then use it



// Create a stateful widget called MoviesPage here
class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  int a=1;
  void changemovie(){
    setState(() {
     a= Random().nextInt(30);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    List movie=jsonDecode(moviesList);
    return Scaffold(
      backgroundColor: Colors.black ,
      appBar: AppBar(
        title: Text(
          'Movies Poster',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image(
                  image: NetworkImage(movie[a]['poster']),
                ),
              ),
              FlatButton(color: Colors.yellow,
                child: new Text('Next Movie', textAlign: TextAlign.center),
                onPressed: changemovie,
              ),
            ],
          ),
      ),

    );
  }

}
void movie()
{
  List movies = jsonDecode(MoviesList.moviesJsonList);
  for(var x in movies)
    print(x['poster']);
}