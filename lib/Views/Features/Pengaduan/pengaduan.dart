import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:resquecare/Views/home_page.dart';
import 'package:resquecare/Widgets/button_purple.dart';
import 'package:resquecare/Widgets/custom_text_form_field.dart';
import 'package:resquecare/Widgets/transition.dart';
import 'package:resquecare/colors.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  final descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final locationController = TextEditingController();
  final locationDescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Uint8List? _image;
  File? selectedIMage;
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please select date";
                    }
                    return null;
                  },
                  controller: dateController,
                  onTap: () async {
                    final selectDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(DateTime.now().year + 3),
                      initialDate: DateTime.now(),
                    );
                    setState(() {
                      if (selectDate != null) {
                        dateController.text = DateFormat('EEEE, dd MMMM yyyy').format(selectDate);
                      }
                    });
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Location cannot be empty";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Location description cannot be empty";
                    }
                    return null;
                  },
                  hintText: "Tambahkan  Keterangan Lokasi",
                ),
                const Gap(20),
                const Text(
                  "Tambahkan Bukti Kejadian  :",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const Gap(5),
                _image != null
                    ? Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(image: DecorationImage(image: MemoryImage(_image!), fit: BoxFit.contain), borderRadius: BorderRadius.circular(5), border: Border.all(color: AppColors.purpleButton)),
                      )
                    : Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.purpleButton),
                        ),
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: AppColors.purpleRandom,
                                  context: context,
                                  builder: (builder) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height / 4.5,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  _pickImageFromCamera(context);
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: AppColors.purpleAppbar,
                                                          width: 3,
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: const Icon(
                                                        Icons.camera_alt,
                                                        size: 28,
                                                      ),
                                                    ),
                                                    const Text("Kamera")
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  _pickImageFromGallery(context);
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: AppColors.purpleAppbar,
                                                          width: 3,
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: const Icon(
                                                        Icons.image,
                                                        size: 28,
                                                      ),
                                                    ),
                                                    const Text("Gallery")
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 40,
                            )),
                      ),
                const Gap(40),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: ButtonPurple(
                    fixedSize: const Size(200, 46),
                    buttonText: "Ajukan Pengaduan",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            Future.delayed(const Duration(seconds: 3), () {
                              Navigator.push(context, createRoute(const HomePage()));
                            });
                            return AlertDialog(
                              content: SizedBox(
                                height: 192,
                                width: 252,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/icons/done.png"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Aduan berhasil",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.purpleAppbar),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        descController.clear();
                        dateController.clear();
                        locationController.clear();
                        locationDescController.clear();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Gallery
  Future _pickImageFromGallery(context) async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera(context) async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
