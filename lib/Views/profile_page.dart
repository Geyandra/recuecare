import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resquecare/Widgets/button_purple.dart';
import 'package:resquecare/Widgets/custom_text_form_field.dart';
import 'package:resquecare/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false; //untuk mengubah kondisi mengubah profile atau tidak
  Uint8List? _image; // menyimpan gambar
  File? selectedIMage; //mengambil gambar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //agar tidak overflow ketika keyboard muncul
      floatingActionButton: isEdit // tombol akan berubah sesuai dengan kondisi mengedit akun atau tidak
          ? ButtonPurple(
              buttonText: "Simpan",
              onPressed: () {
                setState(() {
                  isEdit = false;
                });
              },
            )
          : ButtonPurple(
              buttonText: "Logout",
              onPressed: () {},
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text("Akun"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -170,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.purpleRandom,
                borderRadius: BorderRadius.circular(70),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 100, 60, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isEdit
                    ? Stack(
                        children: [
                          _image != null //kondisi antara menyimpan gambar atau tidak
                              ? Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: MemoryImage(_image!),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.purpleRandom,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      // image: const DecorationImage(
                                      //   image: AssetImage("assets/images/acc.png"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.purpleRandom,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ),
                          Positioned(
                            bottom: -0,
                            left: 160,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
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
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/images/acc.png"),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.purpleRandom,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                isEdit
                    ? Container()
                    : Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isEdit = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/pencil.png"),
                              const Text(
                                "Edit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                const Text(
                  "Username :",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const Gap(5),
                CustomTextField(
                  readOnly: isEdit ? false : true,
                  hintText: 'Farhan',
                  filled: true,
                  fillColor: Colors.white,
                ),
                const Gap(20),
                const Text(
                  "Nama Lengkap :",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const Gap(5),
                CustomTextField(
                  readOnly: isEdit ? false : true,
                  hintText: 'muhammad farhan',
                  obsecureText: true,
                  filled: true,
                  fillColor: Colors.white,
                ),
                const Gap(20),
                const Text(
                  "No HP :",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const Gap(5),
                CustomTextField(
                  readOnly: isEdit ? false : true,
                  hintText: '085678456321',
                  obsecureText: true,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ],
            ),
          )
        ],
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
