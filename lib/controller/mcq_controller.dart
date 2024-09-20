import 'package:get/get.dart';
import 'package:mcqly/model/field.dart';
import 'package:mcqly/service/mcq_service.dart';
class McqController extends GetxController{
  final McqService mcqService;
  McqController({required this.mcqService});
  late List<Field> fields;

  @override
  void onInit() {
    getFields();
    super.onInit();
  }
  Future<void> getFields() async{
    fields = await mcqService.getAllFields();
    update();
  }
}