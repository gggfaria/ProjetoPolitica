package politica

public enum EnumStatus {
    AGUARDANDO('Aguardando aprovação'),
    DESENVOLVIMENTO('Em desenvolvimento'),
    CUMPRIDA('Proposta cumprida'),
    CANCELADA('Cancelada pelo autor'),
    RECUSADA('Proposta recusada')

    String id;

    EnumStatus(String id) {
        this.id = id;
    }

}