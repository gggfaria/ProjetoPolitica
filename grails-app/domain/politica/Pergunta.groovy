package politica

class Pergunta {


    static hasOne = [eleitor: Eleitor, proposta: Proposta]
    static hasMany = [respostas: Resposta]
    static belongsTo = [Proposta, Eleitor]
    String descricao
    boolean isResposta
    Date date
    boolean isAtivo

    static constraints = {
    }
}
