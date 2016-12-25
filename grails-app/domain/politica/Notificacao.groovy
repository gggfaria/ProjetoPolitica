package politica

class Notificacao {
    String titulo
    String descricao
    Pessoa pessoa
    Date data
    boolean isVisualizada

    static hasOne = [pessoa: Pessoa]

    static constraints = {

    }

    static mapping = {
        table data :"data_hora"
    }

}
