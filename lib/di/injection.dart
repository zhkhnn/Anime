import 'package:get_it/get_it.dart';
import 'package:stream/bloc/app_blocs.dart';
import 'package:stream/repos/repositories.dart';

final getIt = GetIt.instance;

injectGetIt() {
  getIt.registerFactory(() => AnimeRepo());
  getIt.registerFactory(() => AnimeBloc(getIt.get()));
}
