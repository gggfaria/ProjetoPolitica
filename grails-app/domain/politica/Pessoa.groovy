
package politica


public class Pessoa {

    String nome
    Date dataNascimento
    String email
    String senha
    boolean isAtivado
    politica.EnumSexo sexo
    Politico politico
    Eleitor eleitor

    static hasOne = [politico: Politico, eleitor: Eleitor]


    static constraints = {
        nome size: 5..300, blank: false, nullable: false
        senha size: 5..200, blank: false, nullable: false
        email email: true, blank: false, unique: true
        dataNascimento date: true, nullable: true
        sexo nullable: false
        politico nullable: true
        eleitor nullable: true
    }

    static mapping ={
        //discriminator column: "tipo", value: "GERAL"
    }

}