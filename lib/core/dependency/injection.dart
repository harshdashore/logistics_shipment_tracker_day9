import 'package:get/get.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/domain/repositories/shipment_repository.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/domain/usecases/get_shipment_usecase.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/dsta/datasource/shipment_remote_ds.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/dsta/repositories/shipment_repo_impl.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/presentation/controller/auth_controller.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/presentation/controller/shipment_controller.dart';

class Injection {
  static void init() {

    /// Global controller
    Get.put(AuthController());

    /// Data source
    Get.lazyPut<ShipmentRemoteDS>(
          () => ShipmentRemoteDS(),
      fenix: true,
    );

    /// Repository registration
    Get.lazyPut<ShipmentRepository>(
          () => ShipmentRepoImpl(
        Get.find<ShipmentRemoteDS>(),
      ),
      fenix: true,
    );

    /// UseCase
    Get.lazyPut<GetShipmentUseCase>(
          () => GetShipmentUseCase(
        Get.find<ShipmentRepository>(),
      ),
      fenix: true,
    );

    /// Controller
    Get.put(
      ShipmentController(
        Get.find<GetShipmentUseCase>(),
      ),
    );
  }
}