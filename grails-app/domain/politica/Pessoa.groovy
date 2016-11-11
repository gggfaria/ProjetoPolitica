

abstract class Pessoa {

    String nome
    Date dataNascimento
    String email
    String senha
    boolean isAtivado
    EnumSexo sexo



    static constraints = {
        nome size: 5..300, blank: false, nullable: false
        senha size: 5..200, blank: false, nullable: false
        email email: true, blank: false, unique: true
        dataNascimento date: true, nullable: true
        sexo nullable: false
    }
}
