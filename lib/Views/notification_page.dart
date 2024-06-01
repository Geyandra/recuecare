import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/Models/pengaduan_model.dart';
import 'package:resquecare/View-Model/admin_pengaduan_provider.dart';
import 'package:resquecare/View-Model/enum.dart';
import 'package:resquecare/Views/Features/Pengaduan/status_pengaduan.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Notifikasi"),
      ),
      body: Consumer<AdminPengaduanProvider>(builder: (context, value, child) {
        switch (value.state) {
          case ViewState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ViewState.none:
            return ListView.separated(
              itemCount: value.getDataPengaduan.length,
              separatorBuilder: (context, index) => const Gap(10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, createRoute(StatusPengaduanPage(dataPengaduan: value.getDataPengaduan[index],)));
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
                        title: Text(
                          "Aduan ${index+1}",
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.getDataPengaduan[index].tanggalKejadian,
                              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                            ),
                            const Row(
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
                );
              },
            );
          default:
            return Container();
        }
      }),
    );
  }
}
