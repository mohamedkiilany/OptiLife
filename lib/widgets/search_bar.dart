
import 'package:flutter/material.dart';

class IngredientSearchBar extends StatelessWidget {
  const IngredientSearchBar({super.key, required this.onChanged});
 
  final ValueChanged<String> onChanged;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x0F000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Color(0xFF1F2933), fontSize: 15),
        decoration: const InputDecoration(
          hintText: 'Search staple ingredients...',
          hintStyle: TextStyle(color: Color(0xFF7B8794)),
          prefixIcon: Icon(Icons.search, color: Color(0xFF7B8794)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}