import 'package:flutter/material.dart';
import 'package:porra_dam/features/resultados/pantalla_resultados.dart'; 
import 'package:porra_dam/features/clasificacion/pantalla_clasificacion.dart';

class PantallaJornada extends StatefulWidget {
  const PantallaJornada({super.key});

  @override
  State<PantallaJornada> createState() => _PantallaJornadaState();
}

class _PantallaJornadaState extends State<PantallaJornada> {
  int _selectedIndex = 0;

  // Simulación de los goles de cada partido 
  final Map<int, List<int>> _goles = {
    0: [2, 1], // Atlético - Real Madrid
    1: [3, 0], // Barcelona - Villarreal
    2: [1, 1], // Sevilla - Real Sociedad
  };

  @override
  Widget build(BuildContext context) {
    // Lista de pantallas para cada pestaña de la barra inferior
    final List<Widget> _pantallas = [
      _buildVistaJornada(context),    
      const PantallaResultados(),       
      const PantallaClasificacion(),   
      _buildVistaTemporal('Mi Perfil'),     
    ];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      // IndexedStack mantiene vivas las pantallas al cambiar de pestaña
      body: IndexedStack(
        index: _selectedIndex,
        children: _pantallas,
      ),

      // Barra de navegación inferior conectada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Jornada'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Resultados'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_vert), label: 'Clasificación'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }

  // Vista de la jornada
  Widget _buildVistaJornada(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/fondo_estadio.png',
          fit: BoxFit.cover,
        ),
        const DecoratedBox(
          decoration: BoxDecoration(color: Colors.black54),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
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
                        'Jornada 1',
                        style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Tu porra para esta jornada',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.calendar_today, color: Colors.white70, size: 16),
                            SizedBox(width: 8),
                            Text(
                              'Se cierra el: Sáb 12 oct - 16:00',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            _buildPartidoItem(0, 'Atlético Madrid', 'Real Madrid'),
                            const Divider(height: 24),
                            _buildPartidoItem(1, 'FC Barcelona', 'Villarreal CF'),
                            const Divider(height: 24),
                            _buildPartidoItem(2, 'Sevilla FC', 'Real Sociedad'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('¡Pronósticos guardados con éxito!')),
                            );
                          },
                          child: const Text(
                            'Guardar pronósticos',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Vista temporal para las pantallas de Clasificación y Perfil
  Widget _buildVistaTemporal(String titulo) {
    return Center(
      child: Text(
        'Pantalla de $titulo en construcción',
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  // Widget personalizado para cada partido
  Widget _buildPartidoItem(int index, String local, String visitante) {
    _goles.putIfAbsent(index, () => [0, 0]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        _buildContadorGoles(index, 0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text('-', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        _buildContadorGoles(index, 1),
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

  // Selector numérico con flechas
  Widget _buildContadorGoles(int partidoIndex, int equipoIndex) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${_goles[partidoIndex]![equipoIndex]}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(width: 2),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _goles[partidoIndex]![equipoIndex]++;
                  });
                },
                child: const Icon(Icons.keyboard_arrow_up, size: 14, color: Colors.grey),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (_goles[partidoIndex]![equipoIndex] > 0) {
                      _goles[partidoIndex]![equipoIndex]--;
                    }
                  });
                },
                child: const Icon(Icons.keyboard_arrow_down, size: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}