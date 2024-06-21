import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:street__report/config/app_colors.dart';
import 'package:street__report/config/app_font.dart';
import 'package:street__report/config/app_icons.dart';
import 'package:street__report/page/beranda.dart';
import 'package:street__report/service/api_service_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService(baseUrl: "");

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final response = await _apiService.login(email, password);
      //Mengambil uid
      // final uin = response['uin']; // Sesuaikan dengan kunci yang digunakan di respons API
      // // Simpan UIN ke dalam SharedPreferences
      // await _saveUin(uin);
      // Handle successful login
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Beranda(),));
      print('Login successful: $response');
    } catch (e) {
      // Handle login error
      print('Login failed: $e');
    }
  }
   Future<void> _saveUin(String uin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uin', uin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/image/back_login.png',
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang, ",
                  style: AppFont().headerLogin,
                ),
                Text(
                  "Senang Bisa Bertemu!",
                  style: AppFont().headerLogin,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Masukkan informasi akun anda",
                  style: AppFont().b500s16w400,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  // controller: _usernameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    labelText: "Nama Pengguna",
                    prefixIcon: const Icon(AppIcons.user03),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.base300, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primary500, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  // controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    labelText: "Kata Sandi",
                    prefixIcon: const Icon(AppIcons.lock01),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.base300, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primary500, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  //onTap: _login,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Beranda(),
                        ));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          AppColors.primary500, // Warna latar belakang tombol
                      borderRadius:
                          BorderRadius.circular(10), // Sudut tombol yang bulat
                    ),
                    child: Center(
                      child: Text(
                        "Masuk",
                        style: AppFont().b0s16w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const Spacer(),
        ],
      )),
    );
  }
}
