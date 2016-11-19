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

            print(eleitor.errors.allErrors)
            eleitor.errors.allErrors.each{ erro ->

                println(erro)
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }


            def mensagem = ["erro": listaErros]
            println(mensagem)
            render mensagem as JSON

        }else{
            eleitor =  eleitor.save(flush: true)
            render eleitor as JSON
        }


    }



}
