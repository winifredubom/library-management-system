import 'package:flutter/material.dart';


class UserCard extends StatelessWidget {
 final String name;
  final String email;
  final VoidCallback onTap;

  const UserCard({
    required this.email,
    required this.name,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 400, height: 60,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5),
                Text( email,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 10),
        
                // Borrowed Books Section
                const Text(
                  "Borrowed Books:",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
        
                // Borrowed History Section
                const Text(
                  "Borrowed History:",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
        
                // View Details Button
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(const Size(150, double.infinity)),
                    backgroundColor: WidgetStateProperty.all(Colors.grey[300]),
                  ),
                  onPressed: (){
                    onTap;
                  }, // Call onTap when the button is pressed
                  child: const Text(
                    "View Details",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
