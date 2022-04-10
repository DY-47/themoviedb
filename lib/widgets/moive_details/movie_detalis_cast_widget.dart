import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetCastWidget extends StatelessWidget {
  const MovieDetCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Series Cast',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: Scrollbar(
            child: ListView.builder(
              itemCount: 10,
              itemExtent: 120,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 2)),
                    ],
                  ),
                  child: Column(children: const [
                    Image(image: AssetImage(AppImages.actor)),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Michael Bakari Jordan'),
                    ),
                  ]),
                );
              },
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Full Cast Crew',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ]),
    );
  }
}
