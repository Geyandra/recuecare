import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:resquecare/Widgets/button_purple.dart";
import "package:resquecare/Widgets/button_white.dart";
import "package:resquecare/Widgets/custom_text_form_field.dart";
import "package:resquecare/colors.dart";

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  // final String statusPengaduan = 'Accepted';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWhite(
            buttonText: "Tolak",
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
                          Image.asset("assets/icons/reject.png"),
                          const Gap(20),
                          const Text(
                            "Konfirmasi ditolak",
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
            buttonText: "Konfirmasi",
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
                            "Konfirmasi berhasil",
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
        title: const Text("Pengaduan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/odgj.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Deskripsi  :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    readOnly: true,
                    hintText: "ODGJ mengancam di sekitar jalan kalimantan jember dengan membawa tongkat",
                    maxLine: 3,
                  ),
                  const Gap(20),
                  const Text(
                    "Tanggal :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.date_range_rounded),
                    readOnly: true,
                    hintText: "Sabtu, 27 April 2024",
                  ),
                  const Gap(20),
                  const Text(
                    "Lokasi Kejadian :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    readOnly: true,
                    prefixIcon: const Icon(
                      Icons.location_on,
                    ),
                    hintText: "Jl. Kalimantan",
                  ),
                  const Gap(20),
                  const Text(
                    "Keterangan :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    readOnly: true,
                    hintText: "Depan double w",
                  ),
                  const Gap(100)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
