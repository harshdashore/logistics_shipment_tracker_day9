import 'package:logistics_shipment_tracker_day9/features/shipment/domain/entities/shipment_entity.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/domain/repositories/shipment_repository.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/dsta/datasource/shipment_remote_ds.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/dsta/models/shipment_model.dart';

class ShipmentRepoImpl implements ShipmentRepository {
  final ShipmentRemoteDS remoteDS;

  ShipmentRepoImpl(this.remoteDS);

  @override
  Future<List<ShipmentEntity>> getShipment() async {
    final response = await remoteDS.getShipment();

    return response
        .map<ShipmentModel>((e) => ShipmentModel.fromJson(e))
        .toList();
  }
}
