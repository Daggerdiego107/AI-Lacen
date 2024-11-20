import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              backgroundColor: const Color(0xFFC1C1C1),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(Icons.list, color: Colors.white, size: 24.0),
                onPressed: () {
                  Navigator.pushNamed(context, '/sidemnu'); // Navigate to Side Menu
                },
              ),
              title: const Text(
                'AI-Lacena',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Noto Sans JP',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_active, color: Color(0xFFC1C1C1), size: 24.0),
                  onPressed: () {},
                ),
              ],
              centerTitle: true,
              elevation: 5.0,
            ),
          ],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text('Ingredientes:', style: TextStyle(fontFamily: 'Noto Sans JP', fontSize: 24.0)),
                  ),
                  _buildIngredientCard('https://picsum.photos/seed/512/600', 'Ingrediente 1'),
                  _buildIngredientCard('https://picsum.photos/seed/107/600', 'Ingrediente 2'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientCard(String imageUrl, String ingredientName) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black.withOpacity(0.2), offset: const Offset(0, 2))],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(imageUrl, width: 100.0, height: 100.0, fit: BoxFit.cover),
            ),
            const SizedBox(width: 15.0),
            Text(
              ingredientName,
              style: const TextStyle(fontFamily: 'Noto Sans JP', fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
