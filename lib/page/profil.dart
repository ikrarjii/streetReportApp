import 'package:flutter/material.dart';
import 'package:street__report/config/app_colors.dart';
import 'package:street__report/config/app_font.dart';
import 'package:street__report/config/app_icons.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 100)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 100)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfilState();
}

class _ProfilState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            AppIcons.arrowNarrowLeft,
            color: AppColors.base0,
          ),
        ),
        backgroundColor: AppColors.primary500,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Text(
              "Ikrar",
              style: AppFont().b0s16w700,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: BottomCurveClipper(),
                child: Container(
                  width: double.infinity,
                  height: 110,
                  decoration: const BoxDecoration(
                    color: AppColors.primary500,
                  ),
                ),
              ),
              Positioned(
                top: 0, // Adjust the top position as needed
                left: 0,
                right: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: AppColors.bgSecondary,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                              'assets/image/sample_big_prof_pic.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                "IKRAR RESTU GIBRANI",
                style: AppFont().b900s20w700,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "7371040109021117",
                style: AppFont().b500s14w400,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "INFORMASI AKUN",
                      style: AppFont().b400s12w700,
                      textAlign: TextAlign.left,
                    ),
                    const RowIdentityItem(
                      iconLeft: AppIcons.phone,
                      title: 'Nomor Telepon',
                      subtitle: '+62 812 3456 7890',
                    ),
                    const RowIdentityItem(
                      iconLeft: AppIcons.calendar,
                      title: 'Tempat, Tanggal Lahir',
                      subtitle: 'Gowa, 1 Januari 1998',
                    ),
                    const RowIdentityItem(
                      iconLeft: AppIcons.home03,
                      title: 'Alamat',
                      subtitle:
                          'Jl. Lorem Ipsum, Kel. Dolor Sit Amet, Kec. Consectetur, Indonesia',
                    ),
                    const RowIdentityItem(
                      iconLeft: AppIcons.hearts,
                      title: 'Jenis Kelamin',
                      subtitle: 'Laki-Laki',
                    ),
                    const RowIdentityItem(
                      iconLeft: AppIcons.briefcase02,
                      title: 'Pekerjaan',
                      subtitle: 'Wiraswasta',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        // Nav.push(context, const Login());
                      },
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(builder: (_) => const Login()));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              AppIcons.logOut01,
                              color: AppColors.redBase,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Keluar',
                              style: AppFont().r500s16w700,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RowIdentityItem extends StatelessWidget {
  final IconData iconLeft;
  final String title;
  final String subtitle;
  const RowIdentityItem({
    super.key,
    required this.iconLeft,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconLeft,
            color: AppColors.base500,
          ),
          const SizedBox(
            width: 12,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFont().b500s12w400,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  subtitle,
                  style: AppFont().b900s16w700,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
