import 'package:flutter/material.dart';
import 'package:yallah_farha/controller/home/suppliers.dart';
import 'package:yallah_farha/model/home/suppliers_model.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/image_box.dart';
import 'package:yallah_farha/utils/api_url.dart';

class ViewAllSuppliersScreen extends StatelessWidget {
  final int itemCount;
  final SuppliersModel? suppliersModel;

  const ViewAllSuppliersScreen({
    Key? key,
    required this.itemCount,
    required this.suppliersModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: GridView.builder(
        //TODO: check pagination later
        controller: SuppliersController.scrollCtrl,
        padding: const EdgeInsets.all(20),
        itemCount: itemCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ImageBox(
            image: "${ApiUrl.mainUrl}/storage/${suppliersModel!.suppliers!.data![index].logo}",
            onTap: () {},
            width: 150,
          );
        },
      ),
    );
  }
}
