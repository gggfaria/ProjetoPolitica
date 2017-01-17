import politica.Area
import politica.Permissao

class BootStrap {

    def init = { servletContext ->

        Permissao admin = Permissao.findByAuthority("ROLE_ADMIN")
        if (admin == null) {
            admin = new Permissao(authority: "ROLE_ADMIN").save(flush: true)
        }
        Permissao politico = Permissao.findByAuthority("ROLE_POLITICO")
        if (politico == null) {
            politico = new Permissao(authority: "ROLE_POLITICO").save(flush: true)
        }

        Permissao eleitor = Permissao.findByAuthority("ROLE_ELEITOR")
        if (eleitor == null) {
            eleitor = new Permissao(authority: "ROLE_ELEITOR").save(flush: true)
        }

        cadastrarAreas("Cultura", "fa fa-book")
        cadastrarAreas("Saúde","fa-medkit")
        cadastrarAreas("Educação","fa-book")
        cadastrarAreas("Turismo","fa-suitcase")
        cadastrarAreas("Segurança","fa-shield")
        cadastrarAreas("Meio Ambiente","fa-tree")
        cadastrarAreas("Transporte","fa-subway")

    }

    def destroy = {
    }


    def cadastrarAreas(String nome, String icone) {
        Area area = Area.findByNome(nome)
        if (area == null) {
            area = new Area(nome: nome, icone: icone).save(flush: true)
        }
    }


}


