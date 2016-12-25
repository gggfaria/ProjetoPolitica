package politica

class Pergunta {

    //static hasOne = [pessoa: Pessoa, proposta: Proposta];

    static belongsTo = [Proposta, Pessoa];

    Pessoa pessoa
    Proposta proposta
    Resposta resposta
    String descricao
    Date data
    boolean isAtivada
    boolean isRespondida

    static constraints = {
        resposta nullable: true
        descricao (nullable:false, blank:false)

    }


    static mapping = {
        table data :"data_hora"
    }

}
