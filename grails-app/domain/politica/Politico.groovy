package politica

class Politico extends Pessoa {

    String foto
    int numero
    static hasMany = [propostas: Proposta, respostas: Resposta]
    boolean isCandidato
    boolean isEleito
    politica.EnumCargo cargo
    static hasOne = [partido: Partido]
    Politico vice

    static constraints = {
        vice nullable: true
        cargo nullable: true
    }

    static mapping ={
        discriminator value: "POLITICO"
    }

}
