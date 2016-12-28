package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured


class PerguntaController {
    transient springSecurityService

    PerguntaService perguntaService
    PropostaService propostaService

    @Secured(['ROLE_ELEITOR'])
    def index() {

    }


    @Secured(['ROLE_ELEITOR'])
    def salvar() {


        Usuario usuarioLogado = springSecurityService.currentUser
        Pessoa eleitor = Eleitor.findByUsuario(usuarioLogado)

        if (!params.propostaId.isNumber()) {
            RespostaRequisicao.erro.errors.push('Proposta não informada')
        }
        if (params.descricao == null || params.descricao == '') {
            RespostaRequisicao.erro.errors.push('Descrição não informada')
        }
        if (RespostaRequisicao.erro.errors.size() > 0) {
            return render(RespostaRequisicao as JSON)
        }

        Pergunta pergunta = new Pergunta();
        Proposta proposta = Proposta.findById(params.propostaId)

        if (proposta == null) {
            RespostaRequisicao.erro.errors.push('Proposta não encontrada')
            return render(RespostaRequisicao as JSON)
        }


        pergunta.descricao = params.descricao
        pergunta.data = new Date()
        pergunta.isAtivada = true
        pergunta.isRespondida = false
        pergunta.proposta = propostaService.selectPropostaId(params.propostaId.toLong())
        pergunta.pessoa = eleitor

        pergunta.validate()


        if (pergunta.hasErrors()) {
            def listaErros = []
            pergunta.errors.allErrors.each { erro ->
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }

        if (pessoaPergunta == null) {
            RespostaRequisicao.erro.errors.push('Pessoa não encontrada')
            return render(RespostaRequisicao as JSON);
        }
        pergunta.data = new Date()
        pergunta.descricao = params.descricao
        pergunta.pessoa = pessoaPergunta
        pergunta.proposta = proposta
        pergunta.isAtivada = true


        if (pergunta.hasErrors()) {
            RespostaRequisicao.erro = pergunta.getErrors()
            return render(RespostaRequisicao as JSON)
        } else {

            pergunta.save();

            Notificacao notificacao = new Notificacao()
            notificacao.dataHora = new Date()
            notificacao.isVisualizada = false
            notificacao.titulo = "O Sr(a) " + pessoaPergunta.nome + " te fez uma pergunta"
            notificacao.descricao = pergunta.descricao + " clique aqui para interagir"
            def alvoNotificacao = Pessoa.findById(proposta.politico.id)
            notificacao.pessoa = alvoNotificacao
            notificacao.save(flush: true)

            RespostaRequisicao.mensagem = 'Pergunta enviada com sucesso';
            RespostaRequisicao.erro = null
            RespostaRequisicao.objeto = [
                    id        : pergunta.id,
                    data      : pergunta.data,
                    descricao : pergunta.descricao,
                    pessoaId  : pergunta.pessoa.id,
                    propostaId: pergunta.proposta.id,
                    isAtivada : pergunta.isAtivada,

            def mensagem = ["erro": listaErros]
            render mensagem as JSON


        } else {
            pergunta = perguntaService.salvarPergunta(pergunta)
            render pergunta as JSON
        }


    }


    @Secured(['ROLE_POLITICO'])
    def responder() {

        Usuario usuarioLogado = springSecurityService.currentUser
        def politico = Politico.findByUsuario(usuarioLogado)

        if (params.id) {
            def perguntaId = params.id.toLong()

            Pergunta pergunta = perguntaService.selectPerguntaId(perguntaId)
            if (pergunta == null) {
                render(view: '/erro404', model: [mensagem: 'Pergunta não encontrada']);
            }


            if ((!pergunta.isRespondida)) {
                if( perguntaService.perguntaPertenceUsuario(pergunta, politico.id)){
                    render(view: "responder", model: ["pergunta": pergunta])
                }else {
                    render(view: '/erro404', model: [mensagem: 'Pergunta não pertence ao usuário logado']);
                }
            } else {
                render(view: '/erro404', model: [mensagem: 'Pergunta já foi respondida']);
            }
        }else
        {
            redirect(controller: "politico", action: "perguntas")
        } else {
            redirect(controller: "politico", action: "index")

        }


    }



    @Secured(['ROLE_ADMIN'])
    def preparar() {
        // Preparar para perguntar
        // Ao chamar esta action é inserido uma proposta
        // para que possa ser possível inserir uma pergunta

        Pessoa pessoa = new Politico();

        pessoa.version = 1;
        pessoa.dataNascimento = Date.parse('dd/MM/yyyy', '12/11/1990');
        pessoa.email = 'pessoa1@gmail.com';
        pessoa.isAtivada = true;
        pessoa.sexo = politica.EnumSexo.MASCULINO;
        pessoa.nome = 'Pessoa1';
        pessoa.senha = '123456';
        pessoa.save();

        def Pessoas = Pessoa.findAll();

        print('Pessoa: ----------');
        print(Pessoas);

        Area area = new Area();
        area.version = 1;
        area.icone = '';
        area.nome = 'Segurança';
        area.save();

        def Areas = Area.findAll();

        print('Area: ----------');
        print(Areas);

        Partido partido = new Partido();
        partido.version = 1;
        partido.nome = 'PP';
        partido.save();

        def Partidos = Partido.findAll();

        print('Partido: ----------');
        print(Partidos);

        Politico politico = new Politico();
        politico.version = 1;
        politico.partido = partido;
        politico.save();

        def politicos = Politico.findAll();

        print('Politico: ----------');
        print(politicos);

        Proposta proposta = new Proposta();
        proposta.version = 1;
        proposta.area = area;
        proposta.titulo = 'Aumento do politicamento';
        proposta.resumo = 'Aumento do politicamento';
        proposta.descricao = 'Aumento do Policiamento na região metropolitana devido ao aumento da criminalidade';
        proposta.politico = politico;
        proposta.save();

        def Propostas = Proposta.findAll();

        print('Proposta: ----------');
        print(Propostas);

        def Erros = [
                pessoas  : pessoa.getErrors(),
                areas    : area.getErrors(),
                partidos : politico.getErrors(),
                propostas: proposta.getErrors()
        ];
        def Buscas = [
                pessoa  : Pessoas,
                area    : Areas,
                partido : Partidos,
                proposta: Propostas
        ]

        return render([erro: Erros, objeto: Buscas] as JSON);
    }


    @Secured(['ROLE_ELEITOR'])
    def listar() {
        Usuario usuarioLogado = springSecurityService.currentUser
        def eleitor = Eleitor.findByUsuario(usuarioLogado)
        def perguntas = Pergunta.createCriteria().list {
            order("isRespondida", 'asc')
            eq('isAtivada', true)
            eq("pessoa.id", eleitor.id.toLong())
        }

        render(view: "listar", model: ["perguntas": perguntas])
    }

    @Secured(['ROLE_ELEITOR'])
    def exibirPergunta() {
        def perguntaId = params.id
        def perguntas = Pergunta.createCriteria().list {
            idEq(perguntaId.toLong())
        }

        render(view: "editar", model: ["perguntas": perguntas])
    }

    @Secured(['ROLE_ELEITOR'])
    def atualizar() {

        Usuario usuarioLogado = springSecurityService.currentUser
        def eleitor = Eleitor.findByUsuario(usuarioLogado)

        def perguntaId = params.perguntaId.toLong()

        print(perguntaId)

        def pergunta = new Pergunta()

        if (perguntaId) {
            pergunta = Pergunta.findById(perguntaId)

        }

        pergunta.descricao = params.descricao

        //print(pergunta.resposta.id)

        pergunta.validate()


        if (pergunta.hasErrors()) {
            def listaErros = []

            print(pergunta.errors.allErrors)
            pergunta.errors.allErrors.each { erro ->
                listaErros.add(g.message(message: erro.defaultMessage, error: erro))
            }

            def mensagem = ["erro": listaErros]
            println(mensagem)

            render mensagem as JSON
        } else {
            pergunta = pergunta.save(flush: true)
            render pergunta as JSON

        }
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY', 'ROLE_ELEITOR','ROLE_POLITICO' ])
    def erro404() {
        render(view: "/error", model: [status: 404, exception: "Id da Proposta não especificado"]);
    }


}
