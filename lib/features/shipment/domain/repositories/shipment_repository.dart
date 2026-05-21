import 'package:logistics_shipment_tracker_day9/features/shipment/domain/entities/shipment_entity.dart';

abstract class ShipmentRepository {
  Future<List<ShipmentEntity>> getShipment();
}
