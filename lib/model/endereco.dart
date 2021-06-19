class Endereco {
  int id;
  String cep;
  String logradouro;
  String bairro;
  String numero;
  String complemento;
  String localidade;
  String uf;
  String ibge;

  Endereco(
      {this.bairro,
      this.cep,
      this.complemento,
      this.logradouro,
      this.numero,
      this.localidade,
      this.uf,
      this.id,
      this.ibge});

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
        id: json['id'],
        bairro: json['bairro'],
        cep: json['cep'],
        complemento: json['complemento'],
        logradouro: json['logradouro'],
        numero: json['numero'],
        localidade: json['localidade'],
        uf: json['uf'],
        ibge: json['ibge']);
  }
}
