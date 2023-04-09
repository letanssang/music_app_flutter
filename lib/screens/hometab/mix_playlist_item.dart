import 'package:flutter/material.dart';

class MixPlaylistItem extends StatelessWidget {
  const MixPlaylistItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage('assets/images/queen.jpg'),
              fit: BoxFit.cover,
            ),
          ),
    );
  }
}
