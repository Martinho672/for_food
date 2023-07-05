class UsuarioModelo {
  final String? id;
  final String nome;
  final String senha;
  final String tipoUsuario;

  const UsuarioModelo({
    this.id,
    required this.nome,
    required this.senha,
    required this.tipoUsuario,
  });

  toJson() => {
        'usuarioId': id,
        'nome': nome,
        'senha': senha,
        'tipo': tipoUsuario,
      };
}
