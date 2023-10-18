// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class ImcObject {
  String id = UniqueKey().toString();
  String peso;
  String altura;
  late String imc;
  late String classificacaoImc;

  ImcObject({
    required this.peso,
    required this.altura,
  }) {
    double alturaDouble = double.tryParse(altura) ?? 0.0;
    double pesoDouble = double.tryParse(peso) ?? 0.0;
    double valor = pesoDouble / pow((alturaDouble / 100), 2);
    imc = valor.toStringAsFixed(2);
    classificacaoImc = classificacao(valor);
  }

  static String classificacao(double imc) {
    String resposta = "";
    if (imc < 16) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Magreza grave.";
    } else if (imc >= 16 && imc < 17) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Magreza moderada.";
    } else if (imc >= 17 && imc < 18.5) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Magreza leve.";
    } else if (imc >= 18.5 && imc < 25) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Saudável.";
    } else if (imc >= 25 && imc < 30) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Sobrepeso.";
    } else if (imc >= 30 && imc < 35) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Obesidade grau 1.";
    } else if (imc >= 35 && imc < 40) {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Obesidade grau 2 (severa)";
    } else {
      resposta = "IMC: ${imc.toStringAsFixed(2)} - Obesidade grau 2 (mórbida)";
    }

    return resposta;
  }
}
