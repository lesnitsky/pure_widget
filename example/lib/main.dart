import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pure_widget/pure_widget.dart';

void main() {
  runApp(App());
}

class TileProps {
  final int value;

  TileProps(this.value);
}

class Tile extends PureWidget<TileProps> {
  final TileProps props;

  const Tile({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild with new value ${props.value}');

    return Card(
      child: Center(
        child: Text(
          props.value.toString(),
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<TileProps> values = [TileProps(0), TileProps(0), TileProps(0)];
  final r = Random();

  update() {
    setState(() {
      final index = r.nextInt(3);
      final oldValue = values[index].value;

      values[index] = TileProps(oldValue + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ...[
              Tile(props: values[0]),
              Tile(props: values[1]),
              Tile(props: values[2]),
            ].map((e) => Expanded(child: e))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: update,
        ),
      ),
    );
  }
}
