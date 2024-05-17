import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:resquecare/Views/Admin/Pengaduan/pengaduan_page.dart';
import 'package:resquecare/Views/Features/Pengaduan/status_pengaduan.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

class LapporanPengaduanPage extends StatelessWidget {
  const LapporanPengaduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Laporan Pengaduan"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, createRoute(const PengaduanPage()));
            },
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.purpleButton),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  title: const Text(
                    "Aduan 1",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sabtu, 27 April 2024",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text(
                            "Rincian Aduan",
                            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffA367B1)),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffA367B1),
                          )
                        ],
                      ),
                    ],
                  ),
                  trailing: Image.asset(
                    "assets/images/odgj.png",
                    width: 50,
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
          Card(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.purpleButton),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                title: const Text(
                  "Aduan 1",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sabtu, 27 April 2024",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                    Row(
                      children: [
                        Text(
                          "Status Aduan",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xffA367B1)),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffA367B1),
                        )
                      ],
                    ),
                  ],
                ),
                trailing: Image.asset(
                  "assets/images/odgj.png",
                  width: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
