package politica

class Resposta {

    //static hasOne = [politico: Politico]
    Politico politico
    String descricao
    boolean  isAtivada
    Pergunta pergunta

    static belongsTo = [Pergunta, Politico]
    static constraints = {
    }
}
