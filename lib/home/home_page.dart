import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tiles = [
    ColorTile(key: UniqueKey()),
    ColorTile(key: UniqueKey()),
  ];

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}

class ColorTile extends StatefulWidget {
  const ColorTile({super.key});

  @override
  State<ColorTile> createState() => _ColorTileState();
}

class _ColorTileState extends State<ColorTile> {
  final Color myColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor,
    );
  }
}
