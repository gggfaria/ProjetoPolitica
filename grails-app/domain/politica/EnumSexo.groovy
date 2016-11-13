
package politica
public enum EnumSexo {
    MASCULINO('Masculino'),
    FEMININO('Feminino'),
    OUTRO('Outros')

    String id;

    EnumSexo(String id){
        this.id = id;
    }

}