package politica

class Pergunta {


    static hasOne = [pessoa: Pessoa, proposta: Proposta]
    static hasMany = [respostas: Resposta]
    static belongsTo = [Proposta, Pessoa]
    String descricao
    boolean isResposta
    Date date
    boolean isAtivo

    static constraints = {
    }
}
