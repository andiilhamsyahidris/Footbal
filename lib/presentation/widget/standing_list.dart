import 'package:flutter/material.dart';
import 'package:footbal/common/constant.dart';
import 'package:footbal/domain/entities/standings.dart';

class StandingList extends StatelessWidget {
  final List<Standings> standings;

  const StandingList(this.standings, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final standing = standings[index];
          return ListTile(
            leading: Text(
              '${standing.position}',
              style: const TextStyle(color: Colors.white),
            ),
            title: Text('${standing.teamId}'),
            tileColor: kMainColor,
          );
        },
        itemCount: standings.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 8,
        ),
      ),
    );
  }
}
