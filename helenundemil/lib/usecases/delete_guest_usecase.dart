import 'package:shared_preferences/shared_preferences.dart';

class DeleteGuestDataUseCase {
  Future<void> deleteOwnGuestData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
