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
        eleitor.dataNascimento = new Date()
        eleitor.email = params.email
        eleitor.senha = params.senha
        eleitor.sexo = params.sexo
        eleitor.isAtivado = true

        eleitor.validate()





        if(eleitor.hasErrors()){
            def mensagem = ["erro": eleitor.errors.allErrors]
            render mensagem as JSON
        }else{
            eleitor =  eleitor.save(flush: true)
            render eleitor as JSON
        }


    }


}
