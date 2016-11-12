package politica

class Partido {

    String nome
    static hasMany = [politicos: Politico]
    static belongsTo = [Politico]
    static constraints = {
    }
}
