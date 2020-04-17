import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Route {
  final String title;
  final Widget thumbnail;
  final String creator;
  final Duration time;
  final int distance;
  final int elevation;
  final int popularity;
  final int rating;

  Route(
    {this.title,
    this.thumbnail,
    this.creator,
    this.time,
    this.distance,
    this.elevation,
    this.popularity,
    this.rating});

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      title: json['title'],
      time: json['time'],
      distance: json['distance'],
      elevation: json['elevation'],
      popularity: json['popularity'],
      rating: json['rating']
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      home: Scaffold(
        body: DemoWidget()
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.route,
  });

  final Route route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: route.thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _RouteDescription(
              route: route,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

class _RouteDescription extends StatelessWidget {
  const _RouteDescription({
    Key key,
    this.route,
  }) : super(key: key);

  final Route route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.route.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            'by ${this.route.creator}',
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Column(
            // itemExtent: 10.0,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.access_time, size: 10),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text(
                    '${this.route.time.inHours}:${this.route.time.inMinutes.remainder(60)}',
                    style: const TextStyle(fontSize: 10.0)),
              ]),
              Row(children: <Widget>[
                Icon(Icons.directions_walk, size: 10),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text('${this.route.distance} m',
                    style: const TextStyle(fontSize: 10.0)),
              ]),
              Row(children: <Widget>[
                Icon(Icons.terrain, size: 10),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text('${this.route.elevation} m',
                    style: const TextStyle(fontSize: 10.0)),
              ]),
              Row(children: <Widget>[
                Icon(Icons.thumb_up, size: 10),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text('${this.route.popularity}',
                    style: const TextStyle(fontSize: 10.0)),
              ]),
              Row(children: <Widget>[
                Icon(Icons.star, size: 10),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text('${this.route.rating}',
                    style: const TextStyle(fontSize: 10.0)),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}


class DemoWidget extends StatelessWidget {
  final pleisenspitze = new Route(
      title: 'Pleisenspitze',
      thumbnail: Container(
        decoration: const BoxDecoration(color: Colors.blue),
      ),
      creator: 'allan',
      time: Duration(hours: 4, minutes: 23),
      distance: 19000,
      elevation: 1619,
      popularity: 7,
      rating: 1442);
  final hochmiesing = new Route(
      title: 'Hochmiesing',
      thumbnail: Container(
        decoration: const BoxDecoration(color: Colors.pink),
      ),
      creator: 'bethany',
      time: Duration(hours: 7, minutes: 26),
      distance: 17900,
      elevation: 1281,
      popularity: 8,
      rating: 1368);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 200.0,
      children: <CustomListItem>[
        CustomListItem(route: pleisenspitze,),
        CustomListItem(route: hochmiesing),
      ],
    );
  }
}
