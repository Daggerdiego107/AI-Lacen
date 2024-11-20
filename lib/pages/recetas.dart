import 'package:flutter/material.dart';

class RecetasWidget extends StatefulWidget {
  const RecetasWidget({super.key});

  @override
  State<RecetasWidget> createState() => _RecetasWidgetState();
}

class _RecetasWidgetState extends State<RecetasWidget> {
  bool isFavorite1 = false;
  bool isFavorite2 = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: const Color(0xFFC1C1C1),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ),
          title: const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: Text(
              'Recetas',
              style: TextStyle(
                fontFamily: 'Noto Sans JP',
                color: Colors.white,
                fontSize: 22.0,
                letterSpacing: 0.0,
              ),
            ),
          ),
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildRecipeCard(
                    imageUrl: 'https://picsum.photos/seed/322/600',
                    title: 'Receta 1',
                    description: 'Descripción corta',
                    isFavorite: isFavorite1,
                    onFavoriteToggle: () {
                      setState(() {
                        isFavorite1 = !isFavorite1;
                      });
                    },
                  ),
                  _buildRecipeCard(
                    imageUrl: 'https://picsum.photos/seed/706/600',
                    title: 'Receta 2',
                    description: 'Descripción corta',
                    isFavorite: isFavorite2,
                    onFavoriteToggle: () {
                      setState(() {
                        isFavorite2 = !isFavorite2;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeCard({
    required String imageUrl,
    required String title,
    required String description,
    required bool isFavorite,
    required VoidCallback onFavoriteToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: Colors.transparent,
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Container(
          width: 380.0,
          height: 125.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0.0, 2.0),
              ),
            ],
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  imageUrl,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Noto Sans JP',
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Noto Sans JP',
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: onFavoriteToggle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}