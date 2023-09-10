import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;
  late TextEditingController cProgramStudi;
  late TextEditingController cJk;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String nama, String npm, String alamat, String programStudi,
      String jk) async {
    CollectionReference mahasiswaCollection = firestore.collection("mahasiswa");

    try {
      await mahasiswaCollection.add({
        "nama": nama,
        "npm": npm,
        "alamat": alamat,
        "programstudi": programStudi,
        "jk": jk,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data mahasiswa",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cAlamat.clear();
          cProgramStudi.clear();
          cJk.clear();
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
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();
    cProgramStudi = TextEditingController();
    cJk = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNama.dispose();
    cNpm.dispose();
    cAlamat.dispose();
    cProgramStudi.dispose();
    cJk.dispose();
    super.onClose();
  }
}
