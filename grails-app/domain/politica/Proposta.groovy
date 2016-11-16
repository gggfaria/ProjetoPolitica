package politica

class Proposta {

    String titulo
    String descricao
    String resumo
    Area area
    Politico politico

    static hasMany = [perguntas: Pergunta, notas: Nota]
    static belongsTo = [Politico]
    static constraints = {
    }
}
