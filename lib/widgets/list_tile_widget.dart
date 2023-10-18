import 'package:flutter/material.dart';
import 'package:teste/data/hive_manager.dart';
import 'package:teste/widgets/icon_tile_widget.dart';
import 'package:teste/widgets/text_tile_widget.dart';

class ListViewWidget extends StatelessWidget {
  final List<dynamic> imcData;
  final HiveManager hiveManager;
  final String boxName;
  const ListViewWidget({
    required this.imcData,
    required this.hiveManager,
    required this.boxName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: imcData.map((data) {
        String id = data['id'];
        String altura = data['altura'];
        String peso = data['peso'];
        String classificacaoImc = data['classificacaoImc'];
        // Você pode adicionar mais campos aqui
        // Para acessar outros campos, você pode usar data['campo']

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: Colors.blue,
            leading: const IconTileWidget(icon: Icons.person, size: 35),
            title: TextTileWidget(
              text: classificacaoImc,
            ),
            subtitle: TextTileWidget(text: "Altura: $altura, Peso: $peso"),
            trailing: InkWell(
              onTap: () {
                hiveManager.deleteName(boxName, id);
              },
              child: const IconTileWidget(
                icon: Icons.delete_forever_outlined,
                size: 30,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
