// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DrawerTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  _DrawerTileState createState() => _DrawerTileState();
}

class _DrawerTileState extends State<DrawerTile> {
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(widget.icon, color: Colors.redAccent),
          ),
          
            Text(
              widget.text,
              style: const TextStyle(color: Colors.black),
            ),
        ],
      ),
    );
  }
}

