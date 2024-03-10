import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'SettingsScreen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 46, horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF5D9CEC),width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('English',style: TextStyle(fontSize: 16,color: Color(0xff5D9CEC)),),
                InkWell(
                    onTap: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return Container();
                      },);
                    },

                    child: Icon(Icons.keyboard_arrow_down,color: Color(0xFF5D9CEC),))
              ],
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Text(
            'Mood',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF5D9CEC),width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Light',style: TextStyle(fontSize: 16,color: Color(0xff5D9CEC)),),
                Icon(Icons.keyboard_arrow_down,color: Color(0xFF5D9CEC),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
