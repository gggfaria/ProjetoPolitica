package politica

class Politico extends Pessoa {

    static hasMany = [propostas: Proposta, respostas: Resposta]
    boolean isCandidato
    static hasOne = [partido: Partido]

    static constraints = {
    }


    static mapping ={
        discriminator value: "POLITICO"
    }
}
