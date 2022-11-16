import 'package:flutter/material.dart';
import 'package:footbal/common/constant.dart';
import 'package:footbal/domain/entities/standings.dart';
import 'package:footbal/domain/usecases/get_teams_by_id.dart';
import 'package:footbal/presentation/bloc/team_by_id_bloc/team_by_id_bloc.dart';
import 'package:provider/provider.dart';

class StandingList extends StatefulWidget {
  final List<Standings> standings;

  const StandingList(this.standings, {super.key});

  @override
  State<StandingList> createState() => _StandingListState();
}

class _StandingListState extends State<StandingList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: ScrollController(keepScrollOffset: false),
      itemBuilder: (context, index) {
        final standing = widget.standings[index];
        return Consumer<TeamByIdBloc>(
          builder: (context, teamByIdBloc, child) {
            return ListTile(
              leading: Text(
                '${standing.position}',
                style: const TextStyle(color: Colors.white),
              ),
              title: Text(
                '${standing.teamId}',
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Text(
                '${standing.points}',
                style: const TextStyle(color: Colors.white),
              ),
              tileColor: kMainColor,
            );
          },
        );
      },
      itemCount: 7,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
    );
  }

  Builder _getTeamById(int? teamId) {
    context.read<TeamByIdBloc>().add(FetchTeamById(teamId));
    return Builder(
      builder: (context) {
        return Text(
          '$teamId',
          style: const TextStyle(color: Colors.white),
        );
      },
    );
  }
}
