package politica

class Notificacao {
    String titulo
    String descricao
    int caminho
    Pessoa pessoa
    Date dataHora
    boolean isVisualizada

    static hasOne = [pessoa: Pessoa]

    static constraints = {
    }

}
