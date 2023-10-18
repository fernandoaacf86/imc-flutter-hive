import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teste/data/hive_manager.dart';
import 'package:teste/shared/imc_object.dart';
import 'package:teste/widgets/textfield_widget.dart';
import 'package:teste/widgets/alert_dialog_widget.dart';
import 'package:teste/widgets/list_tile_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nome App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final HiveManager hiveManager = HiveManager();
  final String boxName = "imcBox";
  late Box imcBox;

  @override
  void initState() {
    super.initState();
    imcBox = hiveManager.getBox(boxName); // Inicialize a caixa
    imcBox.listenable().addListener(_onBoxChanged); // Adicione o listener
  }

  void _onBoxChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            TextFildWidget(
              string: "Altura",
              controller: alturaController,
              inputType: TextInputType.number,
            ),
            TextFildWidget(
              string: "Peso",
              controller: pesoController,
              inputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        if (pesoController.text.isEmpty ||
                            alturaController.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialogWidget();
                            },
                          );
                          return;
                        } else {
                          ImcObject imc = ImcObject(
                              peso: pesoController.text,
                              altura: alturaController.text);
                          hiveManager.addData(boxName: boxName, imcObject: imc);
                          alturaController.clear();
                          pesoController.clear();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: const Text('Adicionar'),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        hiveManager.clearBox(boxName);
                      },
                      child: const Text('Limpar dados'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: imcBox.listenable(),
                builder: (context, Box box, widget) {
                  final List<dynamic> imcData = box.values.toList();
                  return ListViewWidget(
                    imcData: imcData,
                    hiveManager: hiveManager,
                    boxName: boxName,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
