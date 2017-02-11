package politica

class Notificacao {
    String titulo
    String descricao
    String caminho
    Pessoa pessoa
    Date dataHora
    boolean isVisualizada

    static hasOne = [pessoa: Pessoa]

    static constraints = {

    }

    static mapping = {
        table dataHora :"data_hora"
    }

}
