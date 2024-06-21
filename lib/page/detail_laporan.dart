import 'package:flutter/material.dart';
import 'package:street__report/config/app_colors.dart';
import 'package:street__report/config/app_font.dart';
import 'package:street__report/config/app_icons.dart';

class DetailReportPage extends StatelessWidget {
  const DetailReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String status = 'Diterima'; // Menunggu | Diterima | Direvisi | Ditolak
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
          "Detail Laporan",
          style: AppFont().b900s20w700,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/pemilu.png',
            width: screenWidth,
            height: 260,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: status == 'Diterima'
                  ? AppColors.greenLight
                  : status == 'Direvisi'
                      ? AppColors.secondary100
                      : status == 'Menunggu'
                          ? AppColors.base200
                          : AppColors.redLight,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  child: Center(
                      child: Icon(
                    status == 'Diterima'
                        ? AppIcons.checkCircle
                        : status == 'Direvisi'
                            ? AppIcons.checkCircle
                            : status == 'Menunggu'
                                ? AppIcons.infoCircle
                                : AppIcons.alertCircle,
                    color: status == 'Diterima'
                        ? AppColors.greenBase
                        : status == 'Direvisi'
                            ? AppColors.secondary500
                            : status == 'Menunggu'
                                ? AppColors.base700
                                : AppColors.redBase,
                    size: 14,
                  )),
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      status == 'Ditolak'
                          ? Text(
                              'Kesalahan dalam perhitungan suara',
                              style: AppFont().r900s16w700,
                            )
                          : const SizedBox(),
                      Text(
                        status == 'Menunggu'
                            ? 'Laporan ini masih dalam proses validasi oleh validator, mohon menunggu'
                            : "Laporan ini telah ${status.toLowerCase()} pada Rabu, 14 Februari 2024 · 19:00",
                        style: status == 'Diterima'
                            ? AppFont().g900s14w400
                            : status == 'Direvisi'
                                ? AppFont().o900s14w400
                                : status == 'Menunggu'
                                    ? AppFont().b500s14w400
                                    : AppFont().r900s14w400,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Jalan Andi Pettarni ",
                              style: AppFont().b900s18w700,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 8),
                              decoration: const BoxDecoration(
                                color: AppColors.secondary500,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              child: Text(
                                "Saksi",
                                style: AppFont().b0s12w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "14 Februari 2023 · 11:00",
                          style: AppFont().b500s12w400,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
