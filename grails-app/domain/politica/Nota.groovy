package politica

class Nota {

    int valor
    static hasOne = [eleitor: Eleitor, proposta: Proposta]
    static belongsTo = [Proposta, Eleitor]
    static constraints = {

    }
}
