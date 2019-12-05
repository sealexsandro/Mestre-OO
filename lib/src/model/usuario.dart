class Usuario {
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  String senha;
  List<String> roles;

  Usuario(
      {this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles,
      this.senha
      });

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome}';
  }
}
