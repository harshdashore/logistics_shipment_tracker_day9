import 'package:flutter/material.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/domain/entities/shipment_entity.dart';

class DetailsPage extends StatelessWidget {

  final ShipmentEntity shipment;

  const DetailsPage(
      this.shipment,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Shipment Details"),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Text(
              "Shipment ID",
              style:
              TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            Text(
              shipment.id,
              style:
              TextStyle(fontSize: 24),
            ),

            SizedBox(height: 30),

            Text(
              "Container Name",
              style:
              TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            Text(
              shipment.name,
              style:
              TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}