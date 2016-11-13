package politica


class Eleitor extends politica.Pessoa {

    static hasMany = [perguntas: Pergunta, notas:Nota]
    static hasOne = [pessoa: politica.Pessoa]
    static belongsTo = [politica.Pessoa]

    static constraints = {
    }

    static mapping ={
        //discriminator value: "ELEITOR"
    }


}
