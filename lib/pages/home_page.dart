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
    Future<List<Carro>> future = CarrosApi.getCarros();

    return FutureBuilder<List<Carro>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Enquanto os dados estão sendo carregados, mostra um indicador de progresso

          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Se ocorreu um erro ao carregar os dados, exibe uma mensagem de erro

          return Center(child: Text('Erro ao carregar dados'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Se não há dados disponíveis, exibe uma mensagem apropriada

          return Center(child: Text('Nenhum carro encontrado'));
        } else {
          // Quando os dados são carregados com sucesso, exibe a lista

          List<Carro> carros = snapshot.data!;

          return _listView(carros);
        }
      },
    );
  }

  _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro carro = carros[index];

          return Card(
            color: Colors.grey[200],
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.network(
                          carro.urlFoto ?? 'url nao disponivel',
                          width: 150)),
                  Text(carro.nome ?? 'Nome não disponível'),
                  Text("descricao"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('DETALHES'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('SHARE'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
