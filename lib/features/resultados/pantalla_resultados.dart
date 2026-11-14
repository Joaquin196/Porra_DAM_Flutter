import 'package:flutter/material.dart';

class PantallaResultados extends StatelessWidget {
  const PantallaResultados({super.key});

  @override
  Widget build(BuildContext context) {
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
                          'Resultados',
                          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Jornada 1 - Finalizada',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 16),

                        // Tarjeta blanca con los resultados oficiales
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              _buildResultadoItem('Atlético Madrid', '2', '1', 'Real Madrid', '+3 pts'),
                              const Divider(height: 24),
                              _buildResultadoItem('FC Barcelona', '3', '0', 'Villarreal CF', '+1 pt'),
                              const Divider(height: 24),
                              _buildResultadoItem('Sevilla FC', '1', '1', 'Real Sociedad', '+0 pts'),
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

  // Widget auxiliar para cada línea de resultado con sus puntos conseguidos
  Widget _buildResultadoItem(String local, String golesLocal, String golesVisitante, String visitante, String puntos) {
    bool esAcierto = puntos.contains('+3') || puntos.contains('+1');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Equipo Local
        Expanded(
          flex: 4,
          child: Row(
            children: [
              const Icon(Icons.shield, color: Colors.blueGrey, size: 26),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  local,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        // Marcador oficial fijo
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            '$golesLocal - $golesVisitante',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),

        // Equipo Visitante y Puntos
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  visitante,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.shield, color: Colors.amber, size: 26),
            ],
          ),
        ),
      ],
    );
  }
}