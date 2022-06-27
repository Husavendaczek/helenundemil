import 'dart:convert';

import 'package:helenundemil/usecases/get_own_guest_data_usecase.dart';

class GenerateQRCodeUseCase {
  Future<String> getOwnQRCodeData() async {
    GetOwnGuestDataUseCase getOwnGuestDataUseCase = GetOwnGuestDataUseCase();

    var guest = await getOwnGuestDataUseCase.getOwnGuestData();
    String myJson = json.encode(guest);
    return myJson;
  }
}
