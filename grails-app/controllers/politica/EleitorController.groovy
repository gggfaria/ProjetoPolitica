package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class EleitorController {

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index() {

        render (view:"index")

    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def cadastrar(){
        Eleitor eleitor


        eleitor = new Eleitor()


        eleitor.nome = params.nome
        eleitor.dataNascimento = new Date().parse("dd/MM/yyyy",params.dataNascimento)
        eleitor.email = params.j_username
        /*eleitor.usuario.password = params.j_password
        eleitor.usuario.username = params.j_username*/
        eleitor.sexo = params.sexo
        eleitor.isAtivada = true

        eleitor.usuario = new Usuario(username: params.j_username, password: params.j_password,
                enabled: true, accountExpired: false, accountLocked: false,
                passwordExpired: false)

        eleitor.validate()



        if(eleitor.hasErrors()){
            def listaErros = []

            print(eleitor.errors.allErrors)
            eleitor.errors.allErrors.each{ erro ->

                println(erro)
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }


            def mensagem = ["erro": listaErros]
            println(mensagem)
            render mensagem as JSON

        }else{
            eleitor.usuario = eleitor.usuario.save(flush: true)
            eleitor =  eleitor.save(flush: true)


            Permissao permissaoEleitor = Permissao.findByAuthority("ROLE_ELEITOR")
            new UsuarioPermissao(usuario: eleitor.usuario, permissao: permissaoEleitor).save(flush: true)

            render eleitor as JSON
        }


    }



}
