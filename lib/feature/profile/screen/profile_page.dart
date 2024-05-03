import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mora_technical_test/constant/helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final MySharedPreferences preferences = MySharedPreferences();
  bool byGoogle = false;
  String locationMessage = "No location yet";
  File? image;
  final picker = ImagePicker();

  @override
  void initState() {
    getByGoogle();
    getCurrentLocation();
    super.initState();
  }

  getByGoogle() async {
    byGoogle = await preferences.getBool("byGoogle");
  }

  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationMessage = "Location services are disabled.";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationMessage = "Location permissions are denied";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationMessage =
            "Location permissions are permanently denied, we cannot request permissions.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      locationMessage =
          "Lat: ${position.latitude}, Long: ${position.longitude}";
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget loginDefault() => Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image == null)
                SvgPicture.asset(
                  'assets/ic_profile.svg',
                  width: 60,
                  height: 60,
                ),
              if (image != null)
                Image.file(
                  image!,
                  width: 60,
                  height: 60,
                ),
              const SizedBox(height: 16),
              Text(
                "moratel@gmail.com",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                locationMessage,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 32),
              InkWell(
                onTap: () => getImageFromCamera,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueAccent),
                  child: Text(
                    "Change Image From Camera",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => getImageFromGallery,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueAccent),
                  child: Text(
                    "Change Image From Gallery",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget loginByGoogle() => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/ic_profile.svg',
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 16),
            Text(
              "moratel@gmail.com",
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              locationMessage,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: byGoogle ? loginByGoogle() : loginDefault(),
      ),
    );
  }
}
