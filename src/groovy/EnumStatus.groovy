package politica

public enum EnumStatus {
    AGUARDANDO('Aguardando'),
    DESENVOLVIMENTO('Em Desenvolvimento'),
    CUMPRIDA('Cumprida')

    String id;

    EnumStatus(String id) {
        this.id = id;
    }

}