import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footbal/common/constant.dart';
import 'package:footbal/common/custom_information.dart';
import 'package:footbal/common/utils.dart';
import 'package:footbal/presentation/bloc/season_bloc/seasons_bloc.dart';
import 'package:footbal/presentation/bloc/standings_bloc/standings_bloc.dart';
import 'package:footbal/presentation/bloc/team_by_id_bloc/team_by_id_bloc.dart';
import 'package:footbal/presentation/bloc/team_list_bloc/team_list_bloc.dart';
import 'package:footbal/presentation/pages/homepage.dart';
import 'package:footbal/presentation/pages/splash_screen.dart';
import 'package:footbal/injection.dart' as di;
import 'package:footbal/presentation/provider/season_provider.dart';
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<TeamListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SeasonsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<StandingsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TeamByIdBloc>(),
        ),
        ChangeNotifierProvider<SeasonProvider>(
          create: (_) => SeasonProvider(),
        ),
        // ChangeNotifierProvider<StandingsProvider>(
        //   create: (_) => StandingsProvider(
        //     foo=:
        //         FootballRemoteDatasourcesImpl(client: http.Client()),
        //   ),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            primaryColor: kMainColor,
            scaffoldBackgroundColor: kBgColor),
        home: const SplashScreen(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(
                builder: (_) => const Homepage(),
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: CustomInformation(
                        assets: 'assets/search.svg',
                        title: 'Halaman tidak ditemukan',
                        subtitle: ''),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
