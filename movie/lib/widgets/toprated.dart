import 'package:flutter/material.dart';
import 'package:movie/description.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ('TopRated Movies'),
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: toprated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: toprated[index]['title'],
                                description: toprated[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                                vote:
                                    toprated[index]['vote_average'].toString(),
                                launch_on: toprated[index]['release_date'])));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        toprated[index]['poster_path'],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                              toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : 'Loading',
                              style: TextStyle(fontSize: 15)),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
