

import 'package:flutter/material.dart';
import 'package:library_system/presentation/Books/books_inventory.dart';
import 'package:library_system/presentation/Home/home.dart';
import 'package:library_system/presentation/Users/user_profile.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({super.key, required SidebarXController controller}) : _controller = controller;
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme:  const SidebarXTheme(
        decoration: BoxDecoration(
            color:Colors.blue,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
        ),
        iconTheme: IconThemeData( color: Colors.white,),
        selectedIconTheme: IconThemeData(color: Colors.black),
        textStyle: TextStyle(color: Colors.white),
        selectedTextStyle:  TextStyle(color: Colors.black),
        
      ),
      extendedTheme: const SidebarXTheme(
          width: 250
      ),
      footerDivider: Divider(color:  Colors.white.withOpacity(0.8), height: 1),
      headerBuilder: (context,extended){
        return   SizedBox(
          height: 100,
          child:Center(
            child: Text(
              extended ?  'Library Management System' : 'LMS',
              textAlign: TextAlign.center,
              style:const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ) ,
            ),
          ),
        );
      },
      items:  [
        SidebarXItem(icon: Icons.home, label: '  Home', onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: 
          (context) => const Home()));
        }),
        SidebarXItem(icon: Icons.library_books, label: '  Books',
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: 
          (context) => const BookInventory()));
        }),
        SidebarXItem(icon: Icons.person_3_rounded, label: '  Users',
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => const UserProfile()));
        }),
      ],
    );
  }
}