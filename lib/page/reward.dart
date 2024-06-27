import 'package:flutter/material.dart';
import 'package:street__report/config/app_colors.dart';
import 'package:street__report/config/app_font.dart';
import 'package:street__report/config/app_icons.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
          "Reward",
          style: AppFont().b900s20w700,
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot == 0) {
            return const CircularProgressIndicator();
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/empty_notification.png",
                      width: screenWidth - (32 * 2),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Tidak Ada Pemberitahuan",
                      style: AppFont().b900s20w700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "Kami akan memberi tahu Anda ketika ada sesuatu yang baru",
                        style: AppFont().b500s14w400,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
