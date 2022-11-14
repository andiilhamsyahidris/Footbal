import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:footbal/common/constant.dart';
import 'package:footbal/domain/entities/teams.dart';

class TeamList extends StatelessWidget {
  final List<Teams> teams;
  const TeamList(this.teams, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final team = teams[index];
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Card(
                color: kMainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kMainColor,
                      ),
                      child: Column(
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
                            child: CachedNetworkImage(
                              imageUrl: team.logo,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            team.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }
}
