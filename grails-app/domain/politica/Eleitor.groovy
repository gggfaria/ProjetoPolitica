package politica

class Eleitor extends Pessoa {

    static hasMany = [perguntas: Pergunta, notas:Nota]
    static hasOne = [pessoa: Pessoa]
    static belongsTo = [Pessoa]
    static constraints = {
    }
}
