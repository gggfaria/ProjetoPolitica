package politica

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured


class PerguntaController {
    transient springSecurityService

    @Secured(['ROLE_ELEITOR'])
    def index() {

    }


    @Secured(['ROLE_ELEITOR'])
    def enviar() {

        def RespostaRequisicao = [mensagem: '', erro: [errors: []], objeto: []];

        if (!params.propostaId.isNumber()) {
            RespostaRequisicao.erro.errors.push('Proposta não informada');
        }
        if (params.descricao == null || params.descricao == '') {
            RespostaRequisicao.erro.errors.push('Descrição não informada');
        }
        if (RespostaRequisicao.erro.errors.size() > 0) {
            return render(RespostaRequisicao as JSON);
        }

        Pergunta pergunta = new Pergunta();
        Proposta proposta = Proposta.findById(params.propostaId);

        if (proposta == null) {
            RespostaRequisicao.erro.errors.push('Proposta não encontrada');
            return render(RespostaRequisicao as JSON);
        }

        Pessoa pessoaPergunta;

        Usuario usuarioLogado = springSecurityService.currentUser
        pessoaPergunta = Pessoa.findByUsuario(usuarioLogado)

        if (pessoaPergunta == null) {
            RespostaRequisicao.erro.errors.push('Pessoa não encontrada');
            return render(RespostaRequisicao as JSON);
        }

        pergunta.data = new Date();
        pergunta.descricao = params.descricao;
        pergunta.pessoa = pessoaPergunta;
        pergunta.proposta = proposta;
        pergunta.isAtivada = true;


        pergunta.save();

        if (pergunta.hasErrors()) {
            RespostaRequisicao.erro = pergunta.getErrors();
            return render(RespostaRequisicao as JSON);
        }

        RespostaRequisicao.mensagem = 'Pergunta enviada com sucesso';
        RespostaRequisicao.erro = null;
        RespostaRequisicao.objeto = [
                id        : pergunta.id,
                data      : pergunta.data,
                descricao : pergunta.descricao,
                pessoaId  : pergunta.pessoa.id,
                propostaId: pergunta.proposta.id,
                isAtivada : pergunta.isAtivada,


        ];

        return render(RespostaRequisicao as JSON);
    }

    @Secured(['ROLE_POLITICO'])
    def responder() {
        def pergunta = Pergunta.findById(params.id)
        Usuario usuarioLogado = springSecurityService.currentUser
        def politico = Politico.findByUsuario(usuarioLogado)

        if (pergunta.isRespondida) {
            render(view: "index", controller:"politico")
        } else if (pergunta.proposta.politico.id != politico.id) {
            render(view: "index", controller:"politico")
        } else {
            render(view: "responder", model: ["pergunta": pergunta])
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
}
