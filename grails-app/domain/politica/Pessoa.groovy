package politica

public class Pessoa {

    String nome
    Date dataNascimento
    String email
    Usuario usuario
    boolean isAtivada
    politica.EnumSexo sexo

    static hasMany = [perguntas: Pergunta, notificacoes: Notificacao]

    static constraints = {
        nome size: 5..300, blank: false, nullable: false
        email email: true, blank: false, unique: true
        dataNascimento date: true, nullable: false
        sexo nullable: false

    };

    static mapping = {
        discriminator column: "tipo", value: "GERAL"
        perguntas cascade: "all-delete-orphan"
    };
}