import 'package:flutter/material.dart';

class SidemnuWidget extends StatefulWidget {
  const SidemnuWidget({super.key});

  @override
  State<SidemnuWidget> createState() => _SidemnuWidgetState();
}

class _SidemnuWidgetState extends State<SidemnuWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'AI-Lacena',
                    style: TextStyle(
                      fontFamily: 'Inter Tight',
                      fontSize: 24.0,
                      color: Color(0xFF747576),
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 350.0,
                  child: Divider(
                    thickness: 2.0,
                    color: Colors.grey, // Color personalizado
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildMenuButton(
                      icon: Icons.food_bank_rounded,
                      label: 'Ingredientes',
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                    _buildMenuButton(
                      icon: Icons.fastfood_rounded,
                      label: 'Recetas',
                      onTap: () {
                        Navigator.pushNamed(context, '/recetas');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Material(
        color: Colors.transparent,
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Container(
          width: 300.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0.0, 2.0),
              ),
            ],
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF858483),
                  size: 45.0,
                ),
                const SizedBox(width: 30.0),
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Inter Tight',
                    fontSize: 18.0,
                    color: Color(0xFF858483),
                    letterSpacing: 0.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
