import 'package:flutter/material.dart';
import 'package:yallah_farha/model/home/suppliers_model.dart';
import 'package:yallah_farha/network/home/suppliers.dart';

class SuppliersController {
  static SuppliersModel? suppliersModel;
  static late Future<SuppliersModel?> suppliersData;
  static int page = 1;
  static final scrollCtrl = ScrollController();

  static Future<SuppliersModel?> fetchSuppliersData() async {
    suppliersModel = await SuppliersApi.data(page.toString());
    return suppliersModel;
  }
}
