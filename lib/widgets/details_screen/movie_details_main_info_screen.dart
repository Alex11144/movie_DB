import 'package:flutter/material.dart';
import 'package:the_movie_db/elements/radial_percent_widget.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TopPosterImages(),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: _MovieNameWidget(),
        ),
        const _ScoreWidget(),
        const _SummaryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        const SizedBox(
          height: 20,
        ),
        _ActorsWidget()
      ],
    );
  }

  Text _OverviewWidget() {
    return const Text(
      'Overview',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  Text _DescriptionWidget() {
    return const Text(
      'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}

class _TopPosterImages extends StatelessWidget {
  const _TopPosterImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage('assets/images/tomClancy1.jpeg'),
        ),
        Positioned(
            top: 20,
            left: 10,
            bottom: 20,
            child: Image(
                width: 90,
                image: AssetImage('assets/images/tomClancyWall.jpg'))),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as Map;
    final rootTitle = title['details_info'];
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(
        children: [
          TextSpan(
              text: rootTitle.title,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          TextSpan(
            text: ' (2021)',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          )
        ],
      ),
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
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: RadialPercentWidget(
                    percent: 0.72,
                    fillColor: Color.fromARGB(255, 10, 23, 25),
                    lineColor: Color.fromARGB(255, 37, 203, 103),
                    freeColor: Color.fromARGB(255, 25, 54, 31),
                    lineWidth: 3,
                    child: Text('72'),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                const Text("User Score", style: TextStyle(color: Colors.white)),
              ],
            )),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                const Text(
                  "Play Trailer",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )),
      ],
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 12, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          '04/29/2021 (US) 1h49m Action, Adventure, Thriller, War',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _ActorsWidget extends StatelessWidget {
  final nameStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  final JobNameStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  _ActorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stefano Solimo',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: JobNameStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stefano Solimo',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: JobNameStyle,
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stefano Solimo',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: JobNameStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stefano Solimo',
                  style: nameStyle,
                ),
                Text(
                  'Director',
                  style: JobNameStyle,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
