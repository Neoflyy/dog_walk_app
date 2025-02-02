import 'package:dog_walk_app/src/cubit/pets_cubit/pets_cubit.dart';
import 'package:dog_walk_app/src/data/data_sources/pets_local_data_source.dart';
import 'package:dog_walk_app/src/data/repositories/pets_repository.dart';
import 'package:dog_walk_app/src/data/repositories/pets_repository_impl.dart';
import 'package:dog_walk_app/src/ui/app_view.dart';
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
          routes: {
            RequestPage.path: (context) => const RequestPage(),
            DetailPage.path: (context) => const DetailPage(),
            AppView.path: (context) => const AppView(),
          },
          initialRoute: AppView.path,
        ),
      ),
    );
  }
}
