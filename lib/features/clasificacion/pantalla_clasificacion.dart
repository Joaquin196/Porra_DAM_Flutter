import 'package:flutter/material.dart';

class PantallaClasificacion extends StatelessWidget {
  const PantallaClasificacion({super.key});

  @override
  Widget build(BuildContext context) {
    final ranking = [
      {'pos': 1, 'nombre': 'Joaquín', 'puntos': 38, 'pleno': 4},
      {'pos': 2, 'nombre': 'Nicolás', 'puntos': 34, 'pleno': 2},
      {'pos': 3, 'nombre': 'Cristian', 'puntos': 29, 'pleno': 1},
      {'pos': 4, 'nombre': 'Javier', 'puntos': 25, 'pleno': 1},
      {'pos': 5, 'nombre': 'Gonzalo', 'puntos': 20, 'pleno': 0},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo de estadio
          Image.asset(
            'assets/images/fondo_estadio.png',
            fit: BoxFit.cover,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(color: Colors.black54),
          ),

          // Contenido principal
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabecera superior
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Porra DAM',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '38 pts',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Clasificación',
                          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Ranking general de la clase - 1º DAM',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 16),

                        // Tarjeta blanca con la tabla de clasificación
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              // Cabecera de la tabla
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Pos', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                                    Text('Participante', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                                    Text('Puntos', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                                  ],
                                ),
                              ),
                              const Divider(),

                              // Filas del ranking
                              ...ranking.map((usuario) => _buildFilaRanking(
                                usuario['pos'] as int,
                                usuario['nombre'] as String,
                                usuario['puntos'] as int,
                                usuario['pos'] == 1,
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para cada fila de la tabla
  Widget _buildFilaRanking(int pos, String nombre, int puntos, bool esUsuarioActual) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: esUsuarioActual ? Colors.green.withValues(alpha: 0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                alignment: Alignment.center,
                child: Text(
                  '$posº',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: pos == 1 ? Colors.amber[800] : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                nombre,
                style: TextStyle(
                  fontWeight: esUsuarioActual ? FontWeight.bold : FontWeight.normal,
                  color: esUsuarioActual ? Colors.green[800] : Colors.black87,
                ),
              ),
            ],
          ),
          Text(
            '$puntos pts',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}