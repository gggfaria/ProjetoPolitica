package politica

class Area {

    String nome
    String icone
    static hasMany = [proposta: Proposta]
    static belongsTo = [Proposta]

    static constraints = {
    }
    static mapping = {
        proposta cascade: "all-delete-orphan"
    }
}
