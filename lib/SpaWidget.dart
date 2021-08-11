import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaWidget extends StatelessWidget {
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
          Icon(Icons.spa_outlined, color: Colors.grey),
          Text(
            'Spa',
            style: GoogleFonts.notoSans(
                color: Colors.grey[800], fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
