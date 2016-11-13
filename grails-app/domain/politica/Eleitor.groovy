package politica


class Eleitor extends politica.Pessoa {

    static hasMany = [perguntas: Pergunta, notas:Nota]
    static hasOne = [pessoa: politica.Pessoa]
    static belongsTo = [politica.Pessoa]
    static mapping = {
        tablePerHierarchy false
        //  table name :"pessoas"
        //id column: "pes_id"
        //shows cascade: "all-delete-orphan"

    }
    static constraints = {
    }



}
