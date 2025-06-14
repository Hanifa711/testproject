import 'package:get_storage/get_storage.dart';
import 'package:myshop/data/model/user_model.dart';

class StorageService {
  final GetStorage box = GetStorage();

  void saveUser(UserModel user) {
    box.write(user.phone!, user.toJson());
  }

  UserModel? getUser(String phone) {
    final data = box.read(phone);
    return data != null ? UserModel.fromJson(data) : null;
  }

  bool userExists(String phone) => box.hasData(phone);
}
