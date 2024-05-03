import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mora_technical_test/feature/home/screen/home_page.dart';
import 'package:mora_technical_test/feature/profile/screen/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static Route route() => MaterialPageRoute(builder: (_) => const MainPage());

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    onPop() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Keluar dari Mora Telekomunikasi Indonesia?'),
          content: const Text('Apakah Anda yakin ingin keluar aplikasi ?'),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text(
                      'Iya',
                      style: GoogleFonts.rubik(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      'Tidak',
                      style: GoogleFonts.rubik(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        onPop();
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffDEE2E6),
                offset: Offset(0, 0),
                blurRadius: 3,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navBarItem(
                0,
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      currentIndex == 0
                          ? Flex(
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 3,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Icon(
                                  Icons.home,
                                  size: 25,
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Home',
                                  style: GoogleFonts.rubik(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          : Flex(
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 3,
                                  width: 36,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                const Icon(
                                  Icons.home_outlined,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Home',
                                  style: GoogleFonts.rubik(
                                    color: const Color(0xffCED4DA),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              navBarItem(
                1,
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      currentIndex == 1
                          ? Flex(
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 3,
                                  width: 36,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blueAccent),
                                ),
                                const SizedBox(height: 8),
                                const Icon(
                                  Icons.person,
                                  size: 25,
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Profil',
                                  style: GoogleFonts.rubik(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          : Flex(
                              direction: Axis.vertical,
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 3,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Icon(
                                  Icons.person_outline,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Profil',
                                  style: GoogleFonts.rubik(
                                    color: const Color(0xffCED4DA),
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: body(),
      ),
    );
  }

  Widget navBarItem(
    int index,
    Container container,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 64,
        width: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: container,
      ),
    );
  }
}
