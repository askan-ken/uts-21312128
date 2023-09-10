import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mahasiwa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNpm,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Npm"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cAlamat,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "alamat"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cProgramStudi,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "program studi"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cJk,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "jk"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => controller.addProduct(
                    controller.cNama.text,
                    controller.cNpm.text,
                    controller.cAlamat.text,
                    controller.cProgramStudi.text,
                    controller.cJk.text),
                child: Text("Simpan"))
          ],
        ),
      ),
    );
  }
}
