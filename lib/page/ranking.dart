import 'package:flutter/material.dart';
import 'package:street__report/config/app_colors.dart';
import 'package:street__report/config/app_font.dart';
import 'package:street__report/config/app_icons.dart';
import 'package:street__report/page/reward.dart';

class Rangking extends StatefulWidget {
  const Rangking({super.key});

  @override
  State<Rangking> createState() => _RangkingState();
}

class _RangkingState extends State<Rangking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.bgPrimary,
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            AppIcons.arrowNarrowLeft,
            color: AppColors.base500,
          ),
        ),
        title: Text(
          "Ranking",
          style: AppFont().b900s20w700,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Reward(),
                    ));
              },
              child: const Icon(
                AppIcons.coinsHand,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white, // Warna latar belakang putih
          //       borderRadius: BorderRadius.circular(15.0), // Border radius
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5), // Warna bayangan
          //           spreadRadius: 5,
          //           blurRadius: 7,
          //           offset: Offset(0, 3), // Perpindahan bayangan
          //         ),
          //       ],
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: TextField(
          //         // onChanged: (value) => _runFilter(value),
          //         decoration: InputDecoration(
          //           labelText: 'Search',
          //           suffixIcon: Icon(Icons.search),
          //           border: InputBorder.none, // Menghilangkan border default
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListValidation(),
          ),
        ],
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
        'image': 'assets/image/profilvalidator.png',
        'tps': 'Rangking 1',
        'suara': 'Finish',
        'saksi': 'Rahmat HM',
      },
      {
        'image': 'assets/image/profilvalidator.png',
        'tps': 'Rangking 2',
        'suara': 'Finish',
        'saksi': 'Rahmat HM',
      },
      {
        'image': 'assets/image/profilvalidator.png',
        'tps': 'Ranking 3',
        'suara': 'Finish',
        'saksi': 'Rahmat HM',
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
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // Nav.push(context, const Detail());
                              },
                              child: Container(
                                height: 104,
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
