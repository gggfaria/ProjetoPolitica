package politica


class Eleitor extends politica.Pessoa {

    static hasMany = [perguntas: Pergunta, notas:Nota]
    static hasOne = [pessoa: Pessoa]
    static belongsTo = [Pessoa]
    static constraints = {
    }


    static mapping = {
        //  table name :"pessoas"
        //id column: "pes_id"
        //shows cascade: "all-delete-orphan"
    }
}
