import 'package:flutter/material.dart';
import 'package:resquecare/colors.dart';

class PanggilanDaruratPage extends StatelessWidget {
  const PanggilanDaruratPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> phoneNumber = [
      "085 423 798 061",
      "082 354 675 125",
      "085 980 765 379",
    ];
    return Scaffold(
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
                trailing: Image.asset(
                  "assets/icons/WA.png",
                  width: 26,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
