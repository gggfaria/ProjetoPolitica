import politica.Area
import politica.EnumSexo
import politica.Partido
import politica.Permissao
import politica.Pessoa
import politica.Politico
import politica.Usuario
import politica.UsuarioPermissao

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

        cadastrarUsuario("João José", "joao.jose@mail.com", "senha")
    }

    def destroy = {
    }


    def cadastrarAreas(String nome, String icone) {
        Area area = Area.findByNome(nome)
        if (area == null) {
            area = new Area(nome: nome, icone: icone).save(flush: true)
        }
    }



    def cadastrarUsuario(String nome, String email, String senha) {
        Politico politico = Politico.findByEmail(email)
        if (politico == null) {
            def partido =  new Partido(bandeira: "/Politica/static/partido/bandeira.png",
                    sigla:"PQWERT", numero: 555, nome: "PARTIDO DOS TESTES" ).save(flush: true)

            Permissao permissao = Permissao.findByAuthority("ROLE_POLITICO")

            politico = new Politico(nome:nome, email: email, dataNascimento: new Date(),isAtivada: true, sexo: EnumSexo.MASCULINO,
                    isCandidato: false, isEleito: true, foto: "/Politica/static/images/politico/perfil.jpg",
                    numero: 42)
            politico.usuario = new Usuario(username: email, password: senha,
                    enabled: true, accountExpired: false, accountLocked: false,
                    passwordExpired: false).save(flush: true)

            def usuarioPermissao = new UsuarioPermissao(usuario: politico.usuario, permissao: permissao).save(flush: true)

        }
    }



}


