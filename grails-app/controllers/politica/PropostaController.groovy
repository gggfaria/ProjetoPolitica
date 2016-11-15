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

    def pergunta() {

        if (!params.id) {
            render(view: '/erro404', model: [mensagem: 'Proposta não especificada']);
        } else {
            Proposta proposta = Proposta.findById(params.id);

            if (proposta == null) {
                render(view: '/erro404', model: [mensagem: 'Proposta não encontrada']);
            } else {
                render(view: "pergunta", model: [proposta: proposta]);
            }
        }
    }

    def erro404() {
        render(view: "/error", model: [status: 404, exception: "Id da Proposta não especificado"]);
    }

}
