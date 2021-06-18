class Endereco {
  final String cep;
  final String logradouro;
  final String bairro;
  final String numero;
  final String complemento;
  final String localidade;
  final String uf;

  Endereco({
    this.bairro,
    this.cep,
    this.complemento,
    this.logradouro,
    this.numero,
    this.localidade,
    this.uf,
  });

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
      bairro: json['bairro'],
      cep: json['cep'],
      complemento: json['complemento'],
      logradouro: json['logradouro'],
      numero: json['numero'],
      localidade: json['localidade'],
      uf: json['uf'],
    );
  }
}
