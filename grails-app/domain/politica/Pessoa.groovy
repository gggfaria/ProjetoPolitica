package politica

abstract class Pessoa {

    String nome
    Date dataNascimento
    String email
    String senha
    boolean isAtivado
    String sexo


    static constraints = {
        sexo inList:["MASCULINO", "FEMININO", "OUTROS"]
    }
}
