import 'package:flutter/material.dart';
import 'package:footbal/common/constant.dart';
import 'package:footbal/domain/entities/seasons.dart';
import 'package:footbal/presentation/provider/season_provider.dart';
import 'package:provider/provider.dart';

class SeasonList extends StatefulWidget {
  final List<Seasons> seasons;

  const SeasonList(this.seasons, {super.key});

  @override
  State<SeasonList> createState() => _SeasonListState();
}

class _SeasonListState extends State<SeasonList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Standings',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: 9,
        ),
        _buildCardSeason(),
      ],
    );
  }

  SizedBox _buildCardSeason() {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final season = widget.seasons[index];
          return Consumer<SeasonProvider>(
            builder: (context, seasonProvider, child) {
              return RawChip(
                label: Text('${season.name}'),
                labelStyle: seasonProvider.index == index
                    ? const TextStyle(color: Colors.white)
                    : const TextStyle(color: kMainColor),
                backgroundColor: kYellowColor,
                selected: seasonProvider.index == index ? true : false,
                selectedColor: kMainColor,
                onSelected: (value) {
                  if (seasonProvider.index != index) {
                    seasonProvider.index = index;
                  }
                },
              );
            },
          );
        },
        itemCount: widget.seasons.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 6,
        ),
      ),
    );
  }
}
