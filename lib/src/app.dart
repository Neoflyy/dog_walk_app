import 'package:dog_walk_app/src/cubit/pets_cubit/pets_cubit.dart';
import 'package:dog_walk_app/src/data/data_sources/pets_local_data_source.dart';
import 'package:dog_walk_app/src/data/repositories/pets_repository.dart';
import 'package:dog_walk_app/src/data/repositories/pets_repository_impl.dart';
import 'package:dog_walk_app/src/ui/app_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/pages/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PetsLocalDataSource>(
          create: (context) => PetsLocalDataSourceImpl(),
        ),
        RepositoryProvider<PetsRepository>(
          create: (context) =>
              PetsRepositoryImpl(context.read<PetsLocalDataSource>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PetsCubit>(
            create: (context) =>
                PetsCubit(petsRepository: context.read<PetsRepository>()),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Quicksand'),
          initialRoute: AppView.path,
          onGenerateRoute: (settings) {
            Widget page = const _ErrorPage('Unknown Route');

            try {
              switch (settings.name) {
                case AppView.path:
                  page = const AppView();
                  break;
                case DetailPage.path:
                  final args = settings.arguments as Map<String, dynamic>;
                  page = DetailPage(
                    pet: args['pet'],
                  );
                  break;
                case RequestPage.path:
                  final args = settings.arguments as Map<String, dynamic>;
                  page = RequestPage(
                    pet: args['pet'],
                  );
                  break;
              }
            } catch (e) {
              debugPrint('Error in route generation: $e');
              page = _ErrorPage('Navigation error occurred: $e');
            }

            return CupertinoPageRoute<dynamic>(
              builder: (context) => page,
              settings: settings,
            );
          },
        ),
      ),
    );
  }
}

class _ErrorPage extends StatelessWidget {
  final String message;

  const _ErrorPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}
