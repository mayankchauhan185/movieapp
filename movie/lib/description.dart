import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Text(
                  '⭐ Average Rating - ' + vote,
                  style: TextStyle(fontSize: 18),
                ),
                bottom: 10,
              ),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              name != null ? name : 'Not Loaded',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('Releasing on - ' + launch_on,
                style: TextStyle(fontSize: 14)),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Text(description, style: TextStyle(fontSize: 18)),
              )),
            ],
          )
        ]),
      ),
    );
  }
}
