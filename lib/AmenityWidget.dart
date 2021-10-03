import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmenityWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const AmenityWidget(this.title, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[400].withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(this.icon, color: Colors.grey),
          Text(
            this.title,
            style: GoogleFonts.notoSans(
                color: Colors.grey[800],
                fontWeight: FontWeight.w600,
                fontSize: 11),
          )
        ],
      ),
    );
  }
}
