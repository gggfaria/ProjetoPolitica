<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <title>Editar Pergunta</title>
        <meta name="layout" content="main">
    </head>
    <body>
        <div class="container-fluid">

            <h2>Editar pergunta</h2>
            <hr/>
            
            <div class="row">
                <div class="col-md-11" style="margin-left: 25px">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Pergunta</div>
                        <div class="panel-body">
                            <p>${pergunta.descricao}</p>
                        </div>
                    </div>
                </div>

            </div>
            <hr/>
            
            <sec:ifAllGranted roles="ROLE_ELEITOR">
                <g:formRemote name="formPergunta" url="[controller: 'pergunta', action: 'atualizar']" class="form-group" onSuccess="exibirMensagem(data)">

                    <input type="hidden" name="perguntaId" value="${pergunta?.id}"/>

                    <div class="row">
                        <div class="col-md-12" style="margin-left: 25px">
                            <div class="row">
                                <div class="col-md-10">
                                    <span class="obrigatorio">*</span>
                                    <label>Corrigir pergunta</label>
                                    <textarea name="descricao" id="descricao" class="form-control" style="max-width: 100%;">${pergunta.descricao}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-2" style="margin-left: 25px">
                            <button class="button button-5 button-5b icon-cart" name="atualizar">
                                <i class="fa fa-check"></i>
                                <span>Enviar</span>
                            </button>
                        </div>
                    
<!--                        <div class="col-md-2" style="margin-left: 25px">
                            <button class="button button-5 button-5b icon-cart" onclick="voltar()">
                                <i class="fa fa-arrow-left"></i>
                                <span>Cancelar</span>
                            </button>
                        </div>-->
                    </div>
                
                </g:formRemote>
            </sec:ifAllGranted>
            
       </div>
       
       <script>
            function voltar() {
            window.location='/Politica';
            }
        </script>
       
    </body>
    
</html>
