package politica

public enum EnumCargo {
    Prefeito('Prefeito'),
    Vereador('Vereador')

    String id;

    EnumCargo(String id){
        this.id = id;
    }

}