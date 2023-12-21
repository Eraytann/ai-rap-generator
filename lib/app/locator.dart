import 'package:get_it/get_it.dart';
import 'package:rap_generator/app/Features/premium_check/premium_check.dart';
import 'package:rap_generator/app/Model/Song/model_song.dart';
import 'package:rap_generator/app/Screens/beats/viewmodel/beats_view_model.dart';
import 'package:rap_generator/app/Screens/song/viewmodel/song_view_model.dart';
import 'package:rap_generator/app/Widgets/Music%20Player/store/click_store.dart';

import 'ApiService/api_service.dart';
import 'Model/GptResponse/viewmodel/gpt_response_view_model.dart';
import 'Screens/prompts_page/viewmodel/store/page_store.dart';
import 'Screens/rapper/viewmodel/rapper_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerLazySingleton(() => GPTResponseViewModel());
  locator.registerLazySingleton(() => BeatsViewModel());
  locator.registerLazySingleton(() => RapperViewModel());
  locator.registerLazySingleton(() => PageStore());
  locator.registerLazySingleton(() => SongViewModel());
  locator.registerLazySingleton(() => SongModel());
  locator.registerLazySingleton(() => ClickStore());
  locator.registerLazySingleton(() => CounterStore());
}
