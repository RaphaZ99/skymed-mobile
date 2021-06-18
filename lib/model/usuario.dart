class Usuario {
  bool ehPaciente;
  bool ehAdmin;
  bool ehHospital;
  bool ehMedico;
  bool ehAutenticado;
  String email;
  String senha;

  Usuario(
      {this.ehAdmin,
      this.ehAutenticado,
      this.ehHospital,
      this.ehMedico,
      this.ehPaciente,
      this.email,
      this.senha});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      ehAdmin: json['ehAdmin'],
      ehAutenticado: json['ehAutenticado'],
      ehHospital: json['ehHospital'],
      ehMedico: json['ehMedico'],
      ehPaciente: json['ehPaciente'],
      email: json['email'],
      senha: json['senha'],
    );
  }
}
