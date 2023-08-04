import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando películas...',
      'Comprando palomitas de maíz...',
      'Cargando populares...',
      'Ya mero...',
      'Esto está tardando más de lo esperado :(',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Espere por favor ...',
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          const CircularProgressIndicator(
            strokeWidth: 2,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Cargando...');

                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}
