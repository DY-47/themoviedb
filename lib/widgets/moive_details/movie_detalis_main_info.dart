import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetMainInfo extends StatelessWidget {
  const MovieDetMainInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: _MovieNamedWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Overview',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Коллеги и жена Джона Келли убиты. Чудом оставшийся в живых мужчина решает найти преступников и отомстить.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 15),
        _TextOfFilms(),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage(AppImages.tomClanTopHead)),
        Positioned(
          bottom: 20,
          top: 20,
          left: 20,
          child: Image(
            image: AssetImage(AppImages.tomTopHeaderSub),
          ),
        ),
      ],
    );
  }
}

class _MovieNamedWidget extends StatelessWidget {
  const _MovieNamedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Tom Clancy`s Without Remorse',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: ' (2021)',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          'R 29/04/2021 (US) боевик, триллер 1h 49m',
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _TextOfFilms extends StatelessWidget {
  const _TextOfFilms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const styleName = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.white,
    );
    const styleTwo = TextStyle(
      fontSize: 14,
      color: Colors.white,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Директор',
                  style: styleName,
                ),
                Text(
                  'Stefano Solima',
                  style: styleTwo,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Режиссер',
                  style: styleName,
                ),
                Text(
                  'Tne Poul',
                  style: styleTwo,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Сценарист',
                  style: styleName,
                ),
                Text(
                  'Max Solima',
                  style: styleTwo,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Музыкант',
                  style: styleName,
                ),
                Text(
                  'Solima Rlle',
                  style: styleTwo,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              Icon(
                Icons.download_outlined,
              ),
              Text('Download'),
            ],
          ),
        ),
        Container(
          width: 1,
          height: 15,
          color: Colors.white,
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              Icon(Icons.play_arrow_outlined),
              Text('Play'),
            ],
          ),
        ),
      ],
    );
  }
}
