import 'package:flutter/material.dart';
import 'package:movies/models/news.dart';
import 'package:movies/newsapp/Screen2.dart';



class NewsApp extends StatelessWidget {
  List<News> news = [
    new News(
      imagePath:
          'https://cdn.cnn.com/cnnnext/dam/assets/220225095200-ukraine-russia-conflict-022522-super-tease.jpg',
      text: 'Fly Your Name for Free Around the Moon on NASA',
    ),
    new News(
      imagePath:
          'https://cdn.cnn.com/cnnnext/dam/assets/220225180808-kyiv-explosion-0226-super-tease.jpg',
      text: 'Videos show explosions and gunfire around Ukrainian capital - CNN',
    ),
    new News(
      imagePath:
          'https://imagez.tmz.com/image/2b/16by9/2022/02/25/2b31d8b0925b400882e2a4bf7e0c3f23_xl.jpg',
      text: 'Kylie Jenner Back in Action Just 3 Weeks After Giving Birth - TMZ',
    ),
    new News(
      imagePath:
          'https://cdn.cnn.com/cnnnext/dam/assets/220225095200-ukraine-russia-conflict-022522-super-tease.jpg',
      text: 'Fly Your Name for Free Around the Moon on NASA',
    ),
    new News(
      imagePath:
          'https://cdn.cnn.com/cnnnext/dam/assets/220225095200-ukraine-russia-conflict-022522-super-tease.jpg',
      text: 'Fly Your Name for Free Around the Moon on NASA',
    ),
    new News(
      imagePath:
          'https://cdn.cnn.com/cnnnext/dam/assets/220225180808-kyiv-explosion-0226-super-tease.jpg',
      text: 'Videos show explosions and gunfire around Ukrainian capital - CNN',
    ),
    new News(
      imagePath:
          'https://imagez.tmz.com/image/2b/16by9/2022/02/25/2b31d8b0925b400882e2a4bf7e0c3f23_xl.jpg',
      text: 'Kylie Jenner Back in Action Just 3 Weeks After Giving Birth - TMZ',
    ),
    new News(
      imagePath:
          'https://cdn.cnn.com/cnnnext/dam/assets/220225095200-ukraine-russia-conflict-022522-super-tease.jpg',
      text: 'Fly Your Name for Free Around the Moon on NASA',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'News',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: ListView.separated(
                itemCount: news.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailsScreen(
                            news[index].image, news[index].text);
                      }));
                    },
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                            height: 100,
                            image: NetworkImage(news[index].image),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(news[index].text),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, index) => SizedBox(
                      height: 10,
                    ))));
  }
}
