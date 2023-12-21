import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rap_generator/app/Local/model/data_model.dart';

void localDb() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());

  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox<DataModel>('songs');
}
