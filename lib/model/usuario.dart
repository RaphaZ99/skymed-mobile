class Usuario {
  final bool ehPaciente;
  final bool ehAdmin;
  final bool ehHospital;
  final bool ehMedico;
  final bool ehAutenticado;
  final String email;
  final String senha;

  Usuario(
      {this.ehAdmin,
      this.ehAutenticado,
      this.ehHospital,
      this.ehMedico,
      this.ehPaciente,
      this.email,
      this.senha});
}
