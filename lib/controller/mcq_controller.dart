import 'package:get/get.dart';
import 'package:mcqly/model/field.dart';
import 'package:mcqly/service/mcq_service.dart';
class McqController extends GetxController{
  final McqService mcqService;
  McqController({required this.mcqService});
  List<Field> fields = [];
  bool isLoading = false;

  @override
  void onInit() {
    getFields();
    super.onInit();
  }
  Future<void> getFields() async{
    updateLoading();
    fields = await mcqService.getAllFields();
    updateLoading();
  }

  updateLoading(){
    isLoading = !isLoading;
    update();
  }
}