package politica

class Politico extends Pessoa {

    String foto
    int numero
    static hasMany = [propostas: Proposta, respostas: Resposta]
    boolean isCandidato
    static hasOne = [partido: Partido]

    static constraints = {
    }


    static mapping ={
        discriminator value: "POLITICO"
    }
}
