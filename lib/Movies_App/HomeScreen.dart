import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies/Movies_App/Movies_app.dart';
import 'package:http/http.dart' as http;
import 'package:movies/Movies_App/class_model.dart';
import 'package:movies/Movies_App/global.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int selctedindex = 0;

  Future<List<Movie>> fetchAllMovies() async {
    final url = Uri.http(API_URL, All_Movies, API_KEY);
    try {
      var response = await http.get(
        url,
        headers: {'Content-type': 'application/json'},
      );
      var extractedData = json.decode(response.body);
      print(extractedData);

      if (extractedData == null) {
        return [];
      }
      final List<Movie> loadedMovies = [];
      extractedData['results'].forEach((movieData) {
        //print(movieData);
        loadedMovies.add(Movie.fromJson(movieData));
      });
      return loadedMovies;
    } catch (err) {
      throw err;
    }
  }

  Future<List<Movie>> fetchTrendingToday() async {
    final url = Uri.http(API_URL, TRENDING_TODAY, API_KEY);
    try {
      var response = await http.get(
        url,
        headers: {'Content-type': 'application/json'},
      );
      var extractedData = json.decode(response.body);
      print(extractedData);

      if (extractedData == null) {
        return [];
      }
      final List<Movie> loadedMovies = [];
      extractedData['results'].forEach((movieData) {
        //print(movieData);
        loadedMovies.add(Movie.fromJson(movieData));
      });
      return loadedMovies;
    } catch (err) {
      throw err;
    }
  }

  Future<List<Movie>> fetchTrendingThisWeek() async {
    final url = Uri.http(API_URL, TRENDING_WEEK, API_KEY);
    try {
      var response = await http.get(
        url,
        headers: {'Content-type': 'application/json'},
      );
      var extractedData = json.decode(response.body);
      print(extractedData);

      if (extractedData == null) {
        return [];
      }
      final List<Movie> loadedMovies = [];
      extractedData['results'].forEach((movieData) {
        loadedMovies.add(Movie.fromJson(movieData));
      });
      return loadedMovies;
    } catch (err) {
      throw err;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView(
          children: [
            // All Movies
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'All',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'MOVIES',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_tab,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: FutureBuilder<List<Movie>>(
                future: fetchAllMovies(),
                builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Movies(
                                          movie: snapshot.data![index],
                                        )));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 120,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/ripple.gif',
                                    image:
                                        'https://image.tmdb.org/t/p/original${snapshot.data![index].posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 140,
                                  child: Text(
                                    snapshot.data![index].originalTitle!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No Data Found'),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Trending Today
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Trending',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'TODAY',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_tab,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: FutureBuilder<List<Movie>>(
                future: fetchTrendingToday(),
                builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Movies(
                                          movie: snapshot.data![index],
                                        )));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 120,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/ripple.gif',
                                    image:
                                        'https://image.tmdb.org/t/p/original${snapshot.data![index].posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 140,
                                  child: Text(
                                    snapshot.data![index].originalTitle!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No Data Found'),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Trending this week
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Trending',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'WEEK',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_tab,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,
            ),
            SizedBox(
              height: 200,
              child: FutureBuilder<List<Movie>>(
                  future: fetchTrendingThisWeek(),
                  builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Movies(
                                            movie: snapshot.data![index],
                                          )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  width: 120,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/images/ripple.gif',
                                      image:
                                          'https://image.tmdb.org/t/p/original${snapshot.data![index].posterPath}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: 140,
                                    child: Text(
                                      snapshot.data![index].originalTitle!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('No Data Found'),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selctedindex,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            selctedindex = index;
            print(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: '',
            icon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.label_important_outline,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.account_box_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
