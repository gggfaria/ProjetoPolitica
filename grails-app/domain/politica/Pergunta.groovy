package politica

class Pergunta {

    //static hasOne = [pessoa: Pessoa, proposta: Proposta];

    static belongsTo = [Proposta, Pessoa];

    Pessoa pessoa
    Proposta proposta
    Resposta resposta
    String descricao;
    boolean isResposta;
    Date date;
    boolean isAtivada;

    static constraints = {
    };
}
