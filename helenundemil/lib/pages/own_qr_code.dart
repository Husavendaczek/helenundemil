import 'package:flutter/material.dart';
import 'package:helenundemil/usecases/generate_qr_code_usecase.dart';
import 'package:helenundemil/utils/styling.dart';
import 'package:helenundemil/utils/utils.dart';
import 'package:helenundemil/widgets/general/my_text.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OwnQRCode extends StatefulWidget {
  const OwnQRCode({Key? key}) : super(key: key);

  @override
  _OwnQRCodeState createState() => _OwnQRCodeState();
}

class _OwnQRCodeState extends State<OwnQRCode> {
  final GenerateQRCodeUseCase _generateQRCodeUseCase = GenerateQRCodeUseCase();
  String qrData = "";

  @override
  void initState() {
    super.initState();
    _getGuestQrCode();
  }

  void _getGuestQrCode() async {
    var data = await _generateQRCodeUseCase.getOwnQRCodeData();
    setState(() {
      qrData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            text: translate("qrCode.own_qr_code"),
            color: AppColors.Accent,
          ),
          MyText(
            text: translate("qrCode.description"),
          ),
          QrImage(
            data: qrData,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ],
      ),
    );
  }
}
