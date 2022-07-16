import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_game_reward/services/giveawaysServices.dart';

class GiveAwaysList extends StatelessWidget {
  const GiveAwaysList({Key? key, required this.giveAways}) : super(key: key);

  final GiveAways giveAways;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(giveAways.title),
        Text(giveAways.id.toString()),
        Image.network(
          giveAways.thumbnail,
        )
      ],
    );
  }
}
