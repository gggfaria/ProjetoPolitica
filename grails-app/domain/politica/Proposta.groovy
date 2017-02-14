package politica

class Proposta {

    String titulo
    String descricao
    String resumo
    Date dataPublicacao
    Area area
    Politico politico
    politica.EnumStatus status

    static hasMany = [perguntas: Pergunta, notas: Nota]
    static belongsTo = [Politico]
    static constraints = {
        descricao (nullable:false, blank:false, size: 80..5000)
        resumo (nullable:false, blank:false, size: 50..1000)
        titulo (nullable:false, blank:false, size: 5..150)
        status nullable: false
    }
}
