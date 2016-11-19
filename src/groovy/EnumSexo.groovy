package politica


public enum EnumSexo {
    MASCULINO('Masculino'),
    FEMININO('Feminino'),
    OUTROS('Outros')

    String id;

    EnumSexo(String id){
        this.id = id;
    }

}