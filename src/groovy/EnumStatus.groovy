package politica
public enum EnumStatus {
    AGUARDANDO('Aguardando'),
    DESENVOLVIMENTO('Em desenvolvimento'),
    CONCLUIDA('Proposta concluída')

    String id;

    EnumStatus(String id) {
        this.id = id;
    }
}