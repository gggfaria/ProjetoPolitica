package politica

class Politico {

    static hasMany = [propostas: Proposta, respostas: Resposta]
    boolean isCandidato
    static hasOne = [partido: Partido]

    static constraints = {
    }


    static mapping ={
        discriminator value: "POLITICO"
    }
}
