import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footbal/common/constant.dart';
import 'package:footbal/common/custom_information.dart';
import 'package:footbal/presentation/bloc/season_bloc/seasons_bloc.dart';
import 'package:footbal/presentation/bloc/standings_bloc/standings_bloc.dart';
import 'package:footbal/presentation/bloc/team_list_bloc/team_list_bloc.dart';
import 'package:footbal/presentation/provider/season_provider.dart';
import 'package:footbal/presentation/widget/season_list.dart';
import 'package:footbal/presentation/widget/standing_list.dart';
import 'package:footbal/presentation/widget/team_list.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TeamListBloc>().add(FetchTeamList());
      context.read<SeasonsBloc>().add(FetchSeasons());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildMainScreen(),
      ),
    );
  }

  NestedScrollView _buildMainScreen() {
    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) {
        return [
          SliverAppBar(
            forceElevated: isScrolled,
            pinned: true,
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      'assets/dashboard.jpg',
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        color: kThirdColor.withOpacity(0.9),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Indonesian',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          color: kYellowColor,
                                          fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Football Team',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  height: 1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Let\'s know about Indonesian Teams',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kYellowColor,
                                      ),
                                      child: const Text('Teams'),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(title: 'Teams', onTap: () {}),
              BlocBuilder<TeamListBloc, TeamListState>(
                builder: (context, state) {
                  if (state is TeamListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TeamListHasData) {
                    return TeamList(state.teams);
                  } else if (state is TeamListError) {
                    return Expanded(
                      child: Center(
                        child: Text(state.message),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CustomInformation(
                          assets: 'assets/search.svg',
                          title: 'Data tidak ditemukan',
                          subtitle: 'Silahkan tunggu sebentar ya!'),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<SeasonsBloc, SeasonsState>(
                builder: (context, state) {
                  if (state is SeasonsLoading) {
                    return Container();
                  } else if (state is SeasonsHasData) {
                    return SeasonList(state.seasons);
                  } else if (state is SeasonsError) {
                    return Expanded(
                      child: Center(
                        child: Text(state.message),
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              _buildSubHeading(title: 'Season', onTap: () {}),
              const SizedBox(
                height: 15,
              ),
              Consumer<SeasonProvider>(
                builder: (context, seasonProvider, child) {
                  return _buildStandingList(seasonProvider.seasonId);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Builder _buildStandingList(int seasonId) {
    context.read<StandingsBloc>().add(FetchStandings(seasonId));
    return Builder(
      builder: (context) {
        return BlocBuilder<StandingsBloc, StandingsState>(
          builder: (context, state) {
            if (state is StandingsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StandingsHasData) {
              return StandingList(state.standings);
            } else if (state is StandingsError) {
              return Center(
                child: Text(
                  state.message,
                ),
              );
            } else {
              return const Center(
                child: CustomInformation(
                  assets: 'assets/search.svg',
                  title: 'Data tidak ditemukan',
                  subtitle: 'Silahkan coba lagi ya',
                ),
              );
            }
          },
        );
      },
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: const [
                Text(
                  'See More',
                  style: TextStyle(color: kYellowColor),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kYellowColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
