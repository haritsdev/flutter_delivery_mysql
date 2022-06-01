import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/kurir/orders/list/kurir_order_list_controller.dart';

class KurirOrderListPage extends StatelessWidget {
  KurirOrdersListController con = Get.put(KurirOrdersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Kurir orders list')),
    );
  }
}
