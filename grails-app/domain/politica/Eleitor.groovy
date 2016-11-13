package politica


class Eleitor extends Pessoa {

    static hasMany = [perguntas: Pergunta, notas:Nota]

    static constraints = {
    }

    static mapping ={
        discriminator value: "ELEITOR"
    }


}
