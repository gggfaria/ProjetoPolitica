package politica

abstract class Pessoa {

    String nome
    Date dataNascimento
    String email
    String senha
    boolean isAtivado
    String sexo
    static hasOne = [politico: Politico, eleitor: Eleitor]

    static constraints = {
        sexo inList:["MASCULINO", "FEMININO", "OUTROS"]
        politico nullable: true
        eleitor nullable: true
    }
}
