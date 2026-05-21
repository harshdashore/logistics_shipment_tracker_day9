class ShipmentRemoteDS {
  Future<List> getShipment() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      {"id": "1", "name": "Container A"},

      {"id": "2", "name": "Container B"},
    ];
  }
}
