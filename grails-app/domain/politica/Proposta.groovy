package politica

class Proposta {

    String titulo
    String descricao
    String resumo
    static hasOne = [area: Area, politico: Politico]
    static hasMany = [perguntas: Pergunta, notas: Nota]
    static belongsTo = [Politico]
    static constraints = {
    }
}
