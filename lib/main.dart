import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'movies.dart';
import 'dart:core';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: MoviesPage(),
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
  List<String> posters = [];

  Widget build(BuildContext context) {
   // int a = 0;
  /*  void changemovie(){
      setState(() {
        a= Random().nextInt(30);
      }
      );*/
    for (int i = 0; i < movies.length; i++) {
      posters.add(movies[i]['poster']);
    }
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text(
            'Movies Poster',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellow,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                height: 400,
                aspectRatio: 16 / 9,
//                autoPlay: true,
//                autoPlayInterval: Duration(seconds: 3),
//                autoPlayAnimationDuration: Duration(milliseconds: 800),
 //               pauseAutoPlayOnTouch: Duration(seconds: 10),
                //               enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                items: posters.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          constraints: BoxConstraints.expand(),
                          color: Colors.yellow,
                          child: Image(
                            image: NetworkImage(i),
                          ));
                    },
                  );
                }).toList(),
              ),
            ],
        ),
    );
  }

/*  void movie() {
    List movies = jsonDecode(MoviesList.moviesJsonList);
    for (var x in movies)
    print(x['poster']);
    }*/
}

