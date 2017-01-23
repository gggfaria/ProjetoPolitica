package politica

class Area {

    String nome
    String icone
    static hasMany = [propostas: Proposta]
    static belongsTo = [Proposta]

    static constraints = {
    }
    static mapping = {
        propostas cascade: "all-delete-orphan"
    }
}
