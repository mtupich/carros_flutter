import 'package:carros_app_flutter/pages/carro/carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final List<Carro> carros = [];

    carros.add(Carro(nome: "carro1", urlFoto: "https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/09-images/onix-hatch-showroom-1920x960.jpg?imwidth=960"));
    carros.add(Carro(nome: "carro2", urlFoto: "https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/09-images/onix-hatch-showroom-1920x960.jpg?imwidth=960"));
    carros.add(Carro(nome: "carro3", urlFoto: "https://www.chevrolet.com.br/content/dam/chevrolet/mercosur/brazil/portuguese/index/cars/cars-subcontent/09-images/onix-hatch-showroom-1920x960.jpg?imwidth=960"));

    return carros;
  }
}