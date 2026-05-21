import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/presentation/controller/shipment_controller.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {

  final controller =
  Get.find<ShipmentController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Shipments"),
      ),

      body: Obx(() {

        if (controller.loading.value) {
          return const Center(
            child:
            CircularProgressIndicator(),
          );
        }

        return ListView.builder(

          itemCount:
          controller.shipments.length,

          itemBuilder: (context, index) {

            final shipment =
            controller.shipments[index];

            return Card(

              child: ListTile(

                title:
                Text(shipment.name),

                subtitle:
                Text("ID: ${shipment.id}"),

                onTap: () {

                  Get.to(
                        () => DetailsPage(
                      shipment,
                    ),
                  );

                },

              ),
            );
          },
        );
      }),
    );
  }
}