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
        descricao (nullable:false, blank:false, size: 20..5000)
        resumo (nullable:false, blank:false, size: 10..255)
    }
}
