import 'package:flutter/material.dart';
import 'package:street__report/config/app_colors.dart';
import 'package:street__report/config/app_font.dart';
import 'package:street__report/config/app_icons.dart';
import 'package:street__report/page/detail_laporan.dart';
import 'package:street__report/page/maps.dart';
import 'package:street__report/page/profil.dart';
import 'package:street__report/page/ranking.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.base100,
      appBar: AppBar(
        backgroundColor: AppColors.primary500,
        leadingWidth: 52,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Profile();
                },
              ));
            },
            child: Image.asset(
              "assets/image/profilValidatorSmall.png",
              width: 40,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Datang",
              style: AppFont().b0s16w700,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              "Ikrar",
              style: AppFont().b0s16w700,
            ),
          ],
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(
                  width: 18,
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    AppIcons.bell01,
                    color: AppColors.base0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                width: double.infinity,
                height: 110,
                decoration: const BoxDecoration(
                  color: AppColors.primary500,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 4, left: 16, right: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.base0,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.base400.withOpacity(0.5),
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(1600),
                      ),
                      border: Border.all(color: AppColors.base200)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/image/reward3.png",
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Anda Memiliki 2000 Points",
                                  style: AppFont().b900s16w700),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Rangking(),
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 7, left: 10, right: 10, bottom: 9),
                          decoration: BoxDecoration(
                              color: AppColors.base0,
                              border: Border.all(color: AppColors.base300),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              '03',
                              style: AppFont().b500s16w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 16,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(children: [ListValidation()]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //Lansung ke Maps dulu
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Maps(),
              ));
        },
      ),
    );
  }
}

class ListValidation extends StatelessWidget {
  const ListValidation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List validasiList = [
      {
        'image': 'assets/image/sample_img_suara.png',
        'tps': 'Nama Jalan',
        'tgl': '24 Juni 2002',
        'suara': 'Finish',
        'saksi': 'Trotoar',
      },
      {
        'image': 'assets/image/sample_img_suara.png',
        'tps': 'Nama Jalan',
        'tgl': '24 Juni 2002',
        'suara': 'Finish',
        'saksi': 'Drainase',
      },
      {
        'image': 'assets/image/sample_img_suara.png',
        'tps': 'Nama Jalan',
        'tgl': '24 Juni 2002',
        'suara': 'Finish',
        'saksi': 'Drainase',
      },
      {
        'image': 'assets/image/sample_img_suara.png',
        'tps': 'Nama Jalan',
        'tgl': '24 Juni 2002',
        'suara': 'Finish',
        'saksi': 'Drainase',
      },
      {
        'image': 'assets/image/sample_img_suara.png',
        'tps': 'Nama Jalan',
        'tgl': '24 Juni 2002',
        'suara': 'Finish',
        'saksi': 'Drainase',
      },
    ];
    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          bool dataShow = true;
          // ignore: unnecessary_null_comparison
          if (snapshot == null) {
            return const CircularProgressIndicator();
          } else {
            return dataShow
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daftar Laporan Anda',
                            style: AppFont().b900s20w700,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2 Laporan ',
                            style: AppFont().b500s14w400,
                          ),
                          InkWell(
                            onTap: () {
                              // Nav.push(context, const ListTps());
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 14),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.base300),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                'Lihat Semua',
                                style: AppFont().b500s14w700,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailReportPage(
                                        // imageData: validasiList[index]['image'],
                                        // tpsData: validasiList[index]['tps'],
                                        // tglData: validasiList[index]['tgl'],
                                        // suaraData: validasiList[index]['suara'],
                                        // saksiData: validasiList[index]['saksi'],
                                      ),
                                    ));
                              },
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                    color: AppColors.bgPrimary,
                                    border:
                                        Border.all(color: AppColors.base200),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Stack(children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        'assets/image/bg_box_gradation.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          validasiList[index]['image'],
                                          width: 72,
                                          height: 72,
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              validasiList[index]['tps'],
                                              style: AppFont().b900s18w700,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              validasiList[index]['tgl'],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .base300),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4,
                                                          left: 4,
                                                          right: 10,
                                                          bottom: 4),
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              AppColors
                                                                  .primary100,
                                                          child: Center(
                                                            child: Icon(
                                                              AppIcons
                                                                  .fileCheck01,
                                                              color: AppColors
                                                                  .primary500,
                                                              size: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Text(
                                                        "${validasiList[index]['suara']} ",
                                                        style: AppFont()
                                                            .b500s12w700,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .base300),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4,
                                                          left: 4,
                                                          right: 10,
                                                          bottom: 4),
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              AppColors
                                                                  .secondary100,
                                                          child: Center(
                                                            child: Icon(
                                                              AppIcons.user03,
                                                              color: AppColors
                                                                  .secondary500,
                                                              size: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 6,
                                                      ),
                                                      Text(
                                                        "${validasiList[index]['saksi']}",
                                                        style: AppFont()
                                                            .b500s12w700,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: validasiList.length)
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                        color: AppColors.bgPrimary,
                        border: Border.all(color: AppColors.base200),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 124,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/bg_box_gradation.png'),
                                    fit: BoxFit.cover),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, top: 35),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Laporan belum tersedia",
                                          textAlign: TextAlign.right,
                                          style: AppFont().b900s20w700,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          "Akan ditampilkan untuk proses\nvalidasi setelah tersedia",
                                          textAlign: TextAlign.right,
                                          style: AppFont().b500s14w400,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: Image.asset(
                                  'assets/image/p.png',
                                  height: 134,
                                )),
                          ],
                        ),
                      ],
                    ),
                  );
          }
        });
  }
}
