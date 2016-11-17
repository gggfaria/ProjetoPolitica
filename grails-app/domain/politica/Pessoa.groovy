package politica

public class Pessoa {

    String nome;
    Date dataNascimento;
    String email;
    String senha;
    boolean isAtivado;
    politica.EnumSexo sexo;

    static hasMany = [perguntas: Pergunta];

    static constraints = {
        nome size: 5..300, blank: false, nullable: false
        senha size: 5..200, blank: false, nullable: false
        email email: true, blank: false, unique: true
        dataNascimento date: true, nullable: false
        sexo nullable: false
    };

    static mapping = {
        discriminator column: "tipo", value: "GERAL" //TODO: não insere perguntas em função desta linha
        perguntas cascade: "all-delete-orphan"
    };
}