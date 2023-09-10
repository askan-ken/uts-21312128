import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cHarga;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("product").doc(id);

    return docRef.get();
  }

  void updateproduct(String nama, String harga, String id) async {
    DocumentReference productByid = firestore.collection("product").doc(id);
    try {
      await productByid.update({
        "name": nama,
        "price": harga,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data product.",
        onConfirm: () {
          cNama.clear();
          cHarga.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal menambahkan product.",
        onConfirm: () {},
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cHarga = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cHarga.dispose();
    super.onClose();
  }
}
