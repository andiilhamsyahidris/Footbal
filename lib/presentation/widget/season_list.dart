import 'package:flutter/material.dart';
import 'package:footbal/common/constant.dart';
import 'package:footbal/domain/entities/seasons.dart';

class SeasonList extends StatelessWidget {
  final List<Seasons> seasons;

  const SeasonList(this.seasons, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final season = seasons[index];
          return InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            child: Card(
              color: kYellowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      season.name ?? '',
                      style: const TextStyle(color: kMainColor),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: seasons.length,
      ),
    );
  }
}
