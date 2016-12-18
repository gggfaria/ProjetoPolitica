package politica

class Proposta {

    String titulo
    String descricao
    String resumo
    Date dataPublicacao
    Area area
    Politico politico

    static hasMany = [perguntas: Pergunta, notas: Nota]
    static belongsTo = [Politico]
    static constraints = {
        descricao size: 50..7500, nullable: false
        resumo size : 20..1500, nullable: false
    }
}
