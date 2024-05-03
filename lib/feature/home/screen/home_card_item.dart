import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCardItem extends StatelessWidget {
  final dynamic albumId;
  final dynamic id;
  final dynamic title;
  final dynamic url;
  final dynamic thumbnailUrl;

  const HomeCardItem(
      this.albumId, this.id, this.title, this.url, this.thumbnailUrl,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 160,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                image: thumbnailUrl != null
                    ? DecorationImage(
                        image: NetworkImage(
                          thumbnailUrl,
                        ),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: AssetImage(
                          "assets/picture_not_found.png",
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
