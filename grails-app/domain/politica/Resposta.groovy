package politica

class Resposta {

    //static hasOne = [politico: Politico]
    Politico politico
    String descricao
    boolean  isAtivada
    Pergunta pergunta
    Date data

    static belongsTo = [Pergunta, Politico]
    static constraints = {
        pergunta nullable: false
        descricao nullable: false
    }
}
