import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cFakultas;
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cProdi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(
      String fakultas, String nama, String npm, String prodi) async {
    CollectionReference mahasiswaCollection =
        firestore.collection("mahasiswa_21312128");

    try {
      await mahasiswaCollection.add({
        "fakultas_21312128": fakultas,
        "nama_21312128": nama,
        "npm_21312128": npm,
        "prodi_21312128": prodi,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data mahasiswa",
        onConfirm: () {
          cFakultas.clear();
          cNama.clear();
          cNpm.clear();
          cProdi.clear();
          Get.back();
        },
      );
    } catch (e) {
      // Handle any potential errors here
      print("Error: $e");
    }
  }

  @override
  void onInit() {
    cFakultas = TextEditingController();
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cProdi = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cFakultas.dispose();
    cNama.dispose();
    cNpm.dispose();
    cProdi.dispose();
    super.onClose();
  }
}
