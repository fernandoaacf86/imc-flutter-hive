import 'package:flutter/material.dart';
import 'package:teste/data/hive_manager.dart';
import 'package:teste/my_app.dart';

void main() async {
  //não é mais necessária
  WidgetsFlutterBinding.ensureInitialized();
  //iniciando o hive
  HiveManager hiveManager = HiveManager();
  await hiveManager.openBox("imcBox");
  runApp(const MyApp());
}
