import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:resquecare/Widgets/button_purple.dart';
import 'package:resquecare/Widgets/button_white.dart';
import 'package:resquecare/Widgets/custom_text_form_field.dart';
import 'package:resquecare/colors.dart';

class EditNomorPage extends StatelessWidget {
  const EditNomorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWhite(
            buttonText: "Hapus",
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context);
                  });
                  return AlertDialog(
                    content: SizedBox(
                      height: 192,
                      width: 252,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/done.png"),
                          const Gap(20),
                          const Text(
                            "Hapus nomor berhasil",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.purpleAppbar),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          ButtonPurple(
            buttonText: "Simpan",
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context);
                  });
                  return AlertDialog(
                    content: SizedBox(
                      height: 192,
                      width: 252,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/done.png"),
                          const Gap(20),
                          const Text(
                            "Edit nomor berhasil",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.purpleAppbar),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Panggilan Darurat"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nama :",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const Gap(5),
            CustomTextField(hintText: 'Panggila Darurat 1'),
            const Gap(20),
            const Text(
              "Nomor :",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const Gap(5),
            CustomTextField(
              hintText: '085 423 798 061',
              obsecureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
