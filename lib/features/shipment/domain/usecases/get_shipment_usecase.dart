import 'package:logistics_shipment_tracker_day9/features/shipment/domain/repositories/shipment_repository.dart';

class GetShipmentUseCase {
  final ShipmentRepository repository;
  GetShipmentUseCase(this.repository);
  execute() {
    return repository.getShipment();
  }
}
