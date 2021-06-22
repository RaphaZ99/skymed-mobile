class Usuario {
  int id;
  bool ehPaciente;
  bool ehAdmin;
  bool ehHospital;
  bool ehMedico;
  bool ehAutenticado;
  String tokenRedefinicaoSenha;
  String tokenAutenticacaoEmail;
  String email;
  String senha;
  String novaSenha;
  String tokenAutenticacao;

  Usuario(
      {this.id,
      this.ehAdmin,
      this.ehAutenticado,
      this.ehHospital,
      this.ehMedico,
      this.ehPaciente,
      this.email,
      this.senha,
      this.tokenRedefinicaoSenha,
      this.novaSenha,
      this.tokenAutenticacaoEmail,
      this.tokenAutenticacao});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['id'],
        ehAdmin: json['ehAdmin'],
        ehAutenticado: json['ehAutenticado'],
        ehHospital: json['ehHospital'],
        ehMedico: json['ehMedico'],
        ehPaciente: json['ehPaciente'],
        email: json['email'],
        senha: json['senha'],
        tokenRedefinicaoSenha: json['tokenRedefinicaoSenha'],
        novaSenha: json['novaSenha'],
        tokenAutenticacaoEmail: json['tokenAutenticacaoEmail'],
        tokenAutenticacao: json['tokenAutenticacao']);
  }

  Map<String, dynamic> toJson() {
    return {
      if (this.id != null) 'id': this.id,
      'ehAdmin': ehAdmin,
      'ehAutenticado': ehAutenticado,
      'ehHospital': ehHospital,
      'ehMedico': ehMedico,
      'ehPaciente': ehPaciente,
      'email': email,
      'senha': senha,
    };
  }
}
