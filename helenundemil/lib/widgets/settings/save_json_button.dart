import 'package:flutter/material.dart';
import 'package:helenundemil/usecases/export_json_usecase.dart';
import 'package:helenundemil/widgets/general/my_icon.dart';

class SaveJsonButton extends StatefulWidget {
  const SaveJsonButton({Key? key}) : super(key: key);

  @override
  _SaveAsJsonState createState() => _SaveAsJsonState();
}

class _SaveAsJsonState extends State<SaveJsonButton> {
  final ExportJsonUseCase _exportJsonUseCase = ExportJsonUseCase();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        IconButton(
          onPressed: export,
          icon: MyIcon(iconData: Icons.share),
        ),
      ]),
    );
  }

  Future<void> export() async {
    _exportJsonUseCase.exportJson();
  }
}
