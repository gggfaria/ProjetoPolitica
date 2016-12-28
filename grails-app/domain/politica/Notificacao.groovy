package politica

class Notificacao {
    String titulo
    String descricao
    Pessoa pessoa
    Date dataHora
    boolean isVisualizada

    static hasOne = [pessoa: Pessoa]

    static constraints = {
    }

}
