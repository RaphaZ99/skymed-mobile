class DTOFiltrosMedico {
  String nome;
  String especialidade;
  String cidade;
  String hospital;
  OrdemMedicos ordem;

  DTOFiltrosMedico({
    this.nome,
    this.especialidade,
    this.cidade,
    this.hospital,
    this.ordem,
  });
}

enum OrdemMedicos { nomeMedico, especialidade, cidade, hospital }
