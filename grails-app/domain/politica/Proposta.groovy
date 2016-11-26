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
        descricao size: 100-7500, nullable: false
        resumo size : 50-1500, nullable: false
    }
}
