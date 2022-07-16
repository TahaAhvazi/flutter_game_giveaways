import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GiveAwayDetailRoute extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String instructions;
  final String open_giveaway_url;
  final String published_date;
  final String type;
  final String platforms;
  final String end_date;
  final String users;
  final String status;
  final String gamerpower_url;
  final String open_giveaway;

  const GiveAwayDetailRoute({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.instructions,
    required this.open_giveaway_url,
    required this.published_date,
    required this.type,
    required this.platforms,
    required this.end_date,
    required this.users,
    required this.status,
    required this.gamerpower_url,
    required this.open_giveaway,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
