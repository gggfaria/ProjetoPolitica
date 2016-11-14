package politica

import grails.converters.JSON

class PropostaController {

    def index() {
        render (view:"index")
    }

    def cadastrar(){


        Proposta proposta
        proposta = new Proposta()
        proposta.titulo = params.titulo
        proposta.resumo = params.resumo
        proposta.descricao = params.descricao
        proposta.politico = params.politico
        proposta.area = params.area


       proposta.validate()


        if(proposta.hasErrors()){
            def listaErros = []
            proposta.errors.each{ erro ->
                listaErros += g.message(message: erro.fieldError.defaultMessage, error: erro.fieldError)
            }

            def mensagem = ["erro": listaErros]
            render mensagem as JSON

        }else{
            proposta =  proposta.save(flush: true)
            render proposta as JSON
        }


    }

}
