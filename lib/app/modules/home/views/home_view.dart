import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_get/app/controllers/auth_controller.dart';
import 'package:projek_get/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.toNamed(
                Routes.UPDATE_PRODUCT,
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.deleteProduct(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemograman Mobile 2'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => cAuth.logut(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          // Welcome message
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selamat Datang di Universitas Teknokrat Indonesia',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Google logo image
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/UNIVERSITASTEKNOKRAT.png/1024px-UNIVERSITASTEKNOKRAT.png',
            height: 100,
            width: 300,
          ),

          // Data display
          Expanded(
            child: StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.streamData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  // mengambil data
                  var listAllDocs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(
                          "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
                      subtitle: Text(
                          "${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}"),
                      trailing: IconButton(
                        onPressed: () => showOption(listAllDocs[index].id),
                        icon: Icon(Icons.more_vert),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}
