package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.apache.commons.validator.EmailValidator

@Secured(['ROLE_ELEITOR'])
class EleitorController {
    transient springSecurityService

    def _eleitorService

    @Secured(['ROLE_ELEITOR'])
    def index() {

        Usuario usuarioLogado = springSecurityService.currentUser
        def pessoa = Pessoa.findByUsuario(usuarioLogado)



        render(view: "index", model: ["pessoa": pessoa])

    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def cadastrar() {
        Eleitor eleitor


        eleitor = new Eleitor()


        eleitor.nome = params.nome
        eleitor.dataNascimento = new Date().parse("dd/MM/yyyy", params.dataNascimento)
        eleitor.email = params.j_username
        /*eleitor.usuario.password = params.j_password
        eleitor.usuario.username = params.j_username*/
        eleitor.sexo = params.sexo
        eleitor.isAtivada = true

        eleitor.usuario = new Usuario(username: params.j_username, password: params.j_password,
                enabled: true, accountExpired: false, accountLocked: false,
                passwordExpired: false)

        eleitor.validate()



        if (eleitor.hasErrors()) {
            def listaErros = []

            print(eleitor.errors.allErrors)
            eleitor.errors.allErrors.each { erro ->

                println(erro)
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }


            def mensagem = ["erro": listaErros]

            render mensagem as JSON

        } else {
            eleitor.usuario = eleitor.usuario.save(flush: true)
            eleitor = eleitor.save(flush: true)


            Permissao permissaoEleitor = Permissao.findByAuthority("ROLE_ELEITOR")
            new UsuarioPermissao(usuario: eleitor.usuario, permissao: permissaoEleitor).save(flush: true)

            render eleitor as JSON
        }


    }


    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def validarEmail() {
        def paramsEmail = params.email

        def email = Pessoa.findByEmail(paramsEmail)?.email

        def mensagem
        if (email) {
            mensagem = ["erro": "E-mail já cadastrado"]
        } else if (EmailValidator.instance.isValid(paramsEmail)) {
            mensagem = ["mensagem": "E-mail válido"]
        }else {
            mensagem = ["erro": "E-mail inválido"]
        }

        render mensagem as JSON
    }

}
