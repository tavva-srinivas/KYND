import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/plan_days_controller.dart';

class Plan_days_screen extends StatelessWidget {
  final ListController controller = Get.put(ListController(['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5']));

  static const route_name = '/plan_screen';

  Plan_days_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the top
        children: [
          // Non-reorderable list of days
          Expanded(
            child: Obx(() => Column(
              mainAxisSize: MainAxisSize.min, // Ensure the Column takes minimum space vertically
              children: List.generate(
                controller.items.length,
                    (index) {
                  return Container(
                    width: 50,
                    height: 60,
                    alignment: Alignment.center,
                    child: Text('Day ${index + 1}'),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                  );
                },
              ),
            )),
          ),
          // Reorderable list of items
          Expanded(
            flex: 2, // Adjust flex as needed
            child: Obx(() => ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                controller.reorder(oldIndex, newIndex);
              },
              children: controller.items.map((item) {
                return ListTile(
                  key: ValueKey(item),
                  title: Text(item),
                );
              }).toList(),
            )),
          ),
        ],
      ),
    );
  }
}
