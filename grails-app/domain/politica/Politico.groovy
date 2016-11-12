package politica

class Politico {

    static hasMany = [propostas: Proposta, respostas: Resposta]
    boolean isCandidato
    static hasOne = [partido: Partido, pessoa: Pessoa]
    static belongsTo = [Pessoa]
    static constraints = {
    }
}
