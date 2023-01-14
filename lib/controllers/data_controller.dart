import 'package:get/get.dart';
import 'package:payment_app/services/data_getter.dart';

class DataController extends GetxController {
  var list = [].obs;
  var dataGetter = DataGetter();

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  get getSelectedBills {
    return list
        .where((element) => element["isSelected"])
        .map((e) => e)
        .toList();
  }

  _loadData() async {
    var data = dataGetter.getUser();
    list.addAll(await data);
  }
}
