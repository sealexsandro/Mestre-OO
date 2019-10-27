class Usuario {
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  Usuario(
      {this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});
}
