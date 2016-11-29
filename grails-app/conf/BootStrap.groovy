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



    }
    def destroy = {
    }
}
