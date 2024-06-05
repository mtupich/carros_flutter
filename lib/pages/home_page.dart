// import 'package:carros_app_flutter/drawer_list.dart';
// import 'package:carros_app_flutter/pages/carro/carro.dart';
// import 'package:carros_app_flutter/pages/carro/carros_api.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text("Carros"),
//       ),
//       body: _body(),
//       drawer: DrawerList(),
//     );
//   }

//   _body() {

//     List<Carro> carros = CarrosApi.getCarros();

//     return ListView.builder(
//       itemBuilder: (context, index),
//       itemCount: carros.lenght,
//       );
//   }
// }


import 'package:carros_app_flutter/drawer_list.dart';
import 'package:carros_app_flutter/pages/carro/carro.dart';
import 'package:carros_app_flutter/pages/carro/carros_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Carros"),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();

    return ListView.builder(
      itemCount: carros.length,  // Corrigido de 'lenght' para 'length'
      itemBuilder: (context, index) {  // Corrigido o parâmetro itemBuilder
        Carro carro = carros[index];
        return ListTile(
          title: Text(carro.nome ?? 'Nome não disponível'),
          subtitle: Text(carro.tipo ?? 'Tipo não disponível'),
          // Adicione outros widgets ou detalhes que deseja exibir
        );
      },
    );
  }
}
