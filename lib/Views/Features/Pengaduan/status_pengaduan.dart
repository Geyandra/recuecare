import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:resquecare/Widgets/custom_text_form_field.dart";
import "package:resquecare/colors.dart";

class StatusPengaduanPage extends StatefulWidget {
  const StatusPengaduanPage({super.key});

  @override
  State<StatusPengaduanPage> createState() => _StatusPengaduanPageState();
}

class _StatusPengaduanPageState extends State<StatusPengaduanPage> {
  final String statusPengaduan = 'Accepted'; //status pengaduan
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 46,
              color: statusPengaduan == "Accepted" ? const Color(0xff8DEC91) : const Color(0xffEC9E8D), //mengubah wanra sesuai dengan status pengaduan
              child: statusPengaduan == "Accepted" ? const Text("Laporan telah di Konfirmasi, ODGJ akan segera ditangani") : const Text("Laporan ditolak karena tidak valid"), //mengubah informais sesuai dengan status pengaduan
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
                    hintText: "Deskripsi",
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
                    hintText: "Klik Untuk Menambahkan Tanggal",
                  ),
                  const Gap(20),
                  const Text(
                    "Lokasi Kejadian :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    prefixIcon: const Icon(
                      Icons.location_on,
                    ),
                    hintText: "Klik Untuk Menambahkan Lokasi",
                  ),
                  const Gap(20),
                  const Text(
                    "Keterangan :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  CustomTextField(
                    hintText: "Tambahkan  Keterangan Lokasi",
                  ),
                  const Gap(20),
                  const Text(
                    "Tambahkan Bukti Kejadian  :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const Gap(5),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: AppColors.purpleButton),),
                    child: Image.asset("assets/images/odgj.png", fit: BoxFit.contain,)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
