import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:street__report/config/app_colors.dart';
import 'package:street__report/config/app_icons.dart';
import 'package:street__report/page/beranda.dart';
import 'package:street__report/page/message.dart';
import 'package:svg_flutter/svg_flutter.dart';

class TambahLaporan extends StatefulWidget {
  const TambahLaporan({super.key});

  @override
  State<TambahLaporan> createState() => _TambahLaporanState();
}

class _TambahLaporanState extends State<TambahLaporan> {
  File? _image;

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        ('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E7EB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Beranda(),
                ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Laporan 2",
          style: TextStyle(color: AppColors.base900),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Message(),
                    ));
              },
              child: const Icon(
                AppIcons.messageCircle01,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Container(
              width: 358,
              height: 272,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.base200,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      left: 16,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Jenis Laporan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 90,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E7EB),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Center(
                            child: Text(
                              "Trotoar",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0x000ffe5e),
                    thickness: 7.0,
                  ),
                  _image == null
                      ? InkWell(
                          onTap: () {
                            _getImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: Container(
                              width: 326,
                              height: 184,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4F6),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(
                                  color: const Color(0xFFE5E7EB),
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    'assets/image/galeri.svg',
                                    width: 44,
                                    height: 44,
                                  ),
                                  const Column(
                                    children: [
                                      Text(
                                        "Unggah gambar sesuai dengan",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "hasil suara pada TPS",
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 90,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE5E7EB),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Maks. 2 MB",
                                        style: TextStyle(
                                          color: Color(0xFFB9CA3AF),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F4F6),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB),
                                    width: 2.0,
                                  ),
                                ),
                                child: Image.file(
                                  _image!,
                                  width: 326,
                                  height: 184,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16, right: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/image/reacly.svg',
                                      width: 26,
                                      height: 26,
                                    ),
                                    SvgPicture.asset(
                                      'assets/image/delete.svg',
                                      width: 26,
                                      height: 26,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: Container(
              width: 358,
              height: 498,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      left: 16,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Sampaikan Keluhanmu",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const Divider(
                  //   color: Color(0x000ffe5e),
                  //   thickness: 7.0,
                  // ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Container(
                          width: 326,
                          height: 150,
                          decoration: BoxDecoration(
                            // color: const Color(0xFFF3F4F6),
                            color: Color.fromARGB(255, 8, 139, 4),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              color: const Color(0xFFE5E7EB),
                              width: 2.0,
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          bottom: 6,
                        ),
                        child: Text(
                          "Tingkat Kerusakan",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.amberAccent,
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //Suara Batal
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          bottom: 6,
                        ),
                        child: Text(
                          "Suara Sah",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      width: 326,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.base100,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: AppColors.base200,
                          width: 2.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 8.0),
                            child: SvgPicture.asset(
                              'assets/image/suaraSah.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "1.587",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String svgPath; // Path to your SVG asset
  final String hintText;
  // final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    required this.svgPath,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Container(
        width: 326,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: const Color(0xFFE5E7EB),
            width: 2.0,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8.0),
              child: SvgPicture.asset(
                svgPath,
                width: 24,
                height: 24,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
