class Carro {
  int? id;
  String? tipo;
  String? nome;
  String? desc;
  String? urlFoto;

  Carro({this.id, this.tipo, this.nome, this.desc, this.urlFoto});

  Carro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'];
    nome = json['nome'];
    desc = json['desc'];
    urlFoto = json['urlFoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipo'] = this.tipo;
    data['nome'] = this.nome;
    data['desc'] = this.desc;
    data['urlFoto'] = this.urlFoto;
    return data;
  }
}
