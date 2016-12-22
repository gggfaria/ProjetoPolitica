<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <title>Editar</title>
        <meta name="layout" content="main">
    </head>
    <body>

        <div class="container-fluid">
            <h1>Minhas Perguntas</h1>
            <hr/>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Pergunta</th>
                        <th>Data</th>
                        <th>Respondida?</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${perguntas}" var="pergunta">
                        <tr>
                            <td>
                                ${pergunta.descricao}
                            </td>
                            
                            <td>${pergunta.data.format("dd/MM/yyyy")}</td>
                                
                            <g:if test="${pergunta.isRespondida}">
                                <td title="Está repondida">
                                    <i class="fa fa-check" aria-hidden="true"></i>
                                    Sim
                                </td>
                            </g:if>
                            
                            <g:else>
                                <td title="Não está repondida">
                                    <i class="fa fa-times" aria-hidden="true"></i>
                                    Não
                                </td>
                            </g:else>
                            
                            <td>
                                <g:if test="${pergunta.isRespondida}">
                                    Pergunta respondida
                                </g:if>
                                
                                <g:else>
                                    
                                    <g:remoteLink controller="pergunta" action="exibirPergunta" id="${pergunta.id}" 
                                        onSuccess="mostrarPergunta(data)">
                                        Editar
                                    </g:remoteLink>
                                    
                                    <!--
                                    <a href="#" onclick="exibirEdicao()">Editar</a>
                                    -->
                                    
                                    <!--
                                    <g:link controller="pergunta" action="editarPergunta" title="Editar pergunta" id="${pergunta.id}">
                                    Editar
                                    </g:link>
                                    -->
                                    
                                </g:else>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        
        <div class="modal fade" id="modalPergunta" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" title="Fechar" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </button>
                        <h4 class="modal-title">Editar pergunta</h4>
                    </div>
                    
                    <div class="modal-body">
                        <div id="conteudoPergunta">

                        </div>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
       
        <script>
            function mostrarPergunta(data){
                $('#modalPergunta').modal('show')
                $('#conteudoPergunta').html(data)
            }
        </script>
    </body>
</html>
