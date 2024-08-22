import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      
        // boxShadow: const [
        //   BoxShadow(
        //     color: Color.fromRGBO(0, 0, 0, 0.259),
        //     blurRadius: 2,
        //     offset: Offset(1, 1),
        //   ),
        // ],
      ),
    //   child:  ClipRRect(  
    //   borderRadius: BorderRadius.circular(25.0), // Adjust radius for curve
    //   child: Container(
    //     padding: const EdgeInsets.all(10),
    //     margin: const EdgeInsets.only(top: 10),
    //     child: Image.asset(
    //       'assets/library_logo.jpg',
    //       width: 150,  
    //       height: 150, 
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // ),
    );
  }
}
