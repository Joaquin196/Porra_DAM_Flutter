import 'package:flutter/material.dart';
import 'package:porra_dam/features/jornada/pantalla_jornada.dart';

class PantallaBienvenida extends StatefulWidget {
  const PantallaBienvenida({super.key});

  @override
  State<PantallaBienvenida> createState() => _PantallaBienvenidaState();
}

class _PantallaBienvenidaState extends State<PantallaBienvenida> {
  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();

  @override
  void dispose() {
    _aliasController.dispose();
    _codigoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.asset(
            'assets/images/fondo_estadio.png',
            fit: BoxFit.cover,
          ),

          // Capa semitransparente
          const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black54,
            ),
          ),

          // Contenido perfectamente centrado y con scroll de respaldo
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Porra DAM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Pronostica los partidos de cada jornada y compite con tu clase.\n¿Quién acertará más?',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    
                    // Tarjeta blanca con los campos de formulario
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'TU ALIAS',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          TextField(
                            controller: _aliasController,
                            decoration: const InputDecoration(
                              hintText: 'Escribe tu nombre o alias',
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'CÓDIGO DEL GRUPO',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          TextField(
                            controller: _codigoController,
                            decoration: const InputDecoration(
                              hintText: 'p. ej. 1A-DAM-2026',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Botón de entrada con Navigator.push a PantallaJornada
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          final alias = _aliasController.text.trim();
                          final codigo = _codigoController.text.trim();

                          // Validación sencilla
                          if (alias.isEmpty || codigo.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Por favor, escribe tu alias y el código del grupo'),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                            return;
                          }

                          // Navegación a la pantalla de la jornada
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PantallaJornada(),
                            ),
                          );
                        },
                        child: const Text(
                          'Entrar en la porra →',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}