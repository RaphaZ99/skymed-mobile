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
}
