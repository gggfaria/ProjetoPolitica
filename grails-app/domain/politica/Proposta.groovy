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
        descricao size: 50..7500, nullable: false
        resumo size : 20..280, nullable: false
    }
}
