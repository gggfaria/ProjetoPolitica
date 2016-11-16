package politica

class Partido {


    String nome
    int numero
    String sigla
    String bandeira

    static hasMany = [politicos: Politico]
    static belongsTo = [Politico]
    static constraints = {
    }
}
