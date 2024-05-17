import 'package:flutter/material.dart';
import 'package:resquecare/Views/Admin/Nomor%20Panggilan%20Darurat/edit_nomor_page.dart';
import 'package:resquecare/Views/Admin/Nomor%20Panggilan%20Darurat/tambah_nomor_page.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

class NomorPanggilanDaruratPage extends StatelessWidget {
  const NomorPanggilanDaruratPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> phoneNumber = [
      "085 423 798 061",
      "082 354 675 125",
      "085 980 765 379",
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          Navigator.push(context, createRoute(const TambahNomorPage()));
        },
        backgroundColor: AppColors.purpleAppbar,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Panggilan Darurat"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 3,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: AppColors.purpleButton),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(context, createRoute(const EditNomorPage()));
                },
                leading: const SizedBox(
                  width: 50,
                  child: CircleAvatar(
                    radius: 47,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 47,
                    ),
                  ),
                ),
                title: Text("Panggilan Darurat ${index + 1}"),
                subtitle: Text(
                  phoneNumber[index],
                  style: const TextStyle(color: Colors.black87),
                ),
                trailing: const Icon(Icons.mode),
              ),
            ),
          );
        },
      ),
    );
  }
}
