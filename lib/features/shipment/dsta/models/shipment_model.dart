import 'package:logistics_shipment_tracker_day9/features/shipment/domain/entities/shipment_entity.dart';

class ShipmentModel extends ShipmentEntity {
  ShipmentModel({required String id, required String name})
    : super(id: id, name: name);

  factory ShipmentModel.fromJson(Map<String, dynamic> json) {
    return ShipmentModel(id: json['id'], name: json['name']);
  }
}
