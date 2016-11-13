package politica

class Resposta {

    static hasOne = [politico: Politico]
    String descricao
    boolean  isAtivo
    static belongsTo = [Pergunta, Politico]
    static constraints = {
    }
}
