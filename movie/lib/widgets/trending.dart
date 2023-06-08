import 'package:flutter/material.dart';
import 'package:movie/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ('Trending Movies'),
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
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: trending[index]['title'],
                                description: trending[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launch_on: trending[index]['release_date'])));
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
                                        trending[index]['poster_path'],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                              trending[index]['title'] != null
                                  ? trending[index]['title']
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
