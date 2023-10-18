import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teste/shared/imc_object.dart';

class HiveManager {
  //inicia o hive
  Future<void> openBox(String boxName) async {
    await Hive.initFlutter();
    //cria ou abre a caixa
    await Hive.openBox(boxName);
  }

  //recupera os dados da caixa
  Box getBox(String boxName) {
    return Hive.box(boxName);
  }

  //adiciona dados à caixa
  Future<void> addData({
    required String boxName,
    required ImcObject imcObject,
  }) async {
    Box hiveBox = Hive.box(boxName);
    hiveBox.put(
      imcObject.id,
      {
        "id": imcObject.id,
        "altura": imcObject.altura,
        "peso": imcObject.peso,
        "imc": imcObject.imc,
        "classificacaoImc": imcObject.classificacaoImc,
      },
    );
  }

  //deleta uma chave da lista
  Future<void> deleteName(String boxName, String id) async {
    final Box box = getBox(boxName);
    box.delete(id);
  }

  //Limpa a lista
  Future<void> clearBox(String boxName) async {
    final Box box = getBox(boxName);
    box.clear();
  }
}
