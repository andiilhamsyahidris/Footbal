import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footbal/common/constant.dart';
import 'package:footbal/common/custom_information.dart';
import 'package:footbal/domain/entities/standings.dart';
import 'package:footbal/presentation/bloc/standings_bloc/standings_bloc.dart';

class StandingsList extends StatelessWidget {
  final List<Standings> standings;
  late int seasonId;
  StandingsList(this.standings, this.seasonId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandingsBloc, StandingsState>(
      builder: (context, state) {
        if (state is StandingsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is StandingsHasData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final standing = standings[index];
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      color: kMainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: kSecondaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: kBgColor,
                                  blurRadius: 10.0,
                                  spreadRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Text(
                              '${standing.position}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is StandingsError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CustomInformation(
                assets: 'assets/search.svg',
                title: 'Data tidak ditemukan',
                subtitle: 'Silahkan coba lagi ya!'),
          );
        }
      },
    );
  }
}
