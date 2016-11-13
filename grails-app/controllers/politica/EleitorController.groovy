package politica

import grails.converters.JSON

class EleitorController {

    def index() {
        render (view:"index")

    }

    def cadastrar(){
        Eleitor eleitor

        eleitor = new Eleitor()


        eleitor.nome = params.nome
        eleitor.dataNascimento = new Date().parse("dd/MM/yyyy",params.dataNascimento)
        eleitor.email = params.email
        eleitor.senha = params.senha
        eleitor.sexo = params.sexo
        eleitor.isAtivado = true

        eleitor.validate()


        if(eleitor.hasErrors()){
            def listaErros = []
            eleitor.errors.each{ erro ->
                listaErros += g.message(message: erro.fieldError.defaultMessage, error: erro.fieldError)
            }

            def mensagem = ["erro": listaErros]
            render mensagem as JSON

        }else{
            eleitor =  eleitor.save(flush: true)
            render eleitor as JSON
        }


    }


}
