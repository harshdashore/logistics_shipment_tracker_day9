import 'package:get/get.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/domain/entities/shipment_entity.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/domain/usecases/get_shipment_usecase.dart';

class ShipmentController extends GetxController {
  final GetShipmentUseCase useCase;

  ShipmentController(this.useCase);

  RxBool loading = false.obs;

  RxList<ShipmentEntity> shipments = <ShipmentEntity>[].obs;
  @override
  void onInit() {
    super.onInit();
    getShipment();
  }
  Future<void> getShipment() async {
    loading(true);
    shipments.value = await useCase.execute();
    loading(false);
  }
}
