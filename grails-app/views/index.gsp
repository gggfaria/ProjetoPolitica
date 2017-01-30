<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Politica municipal</title>

    <link href="/Politica/css/loading.css" rel="stylesheet">
   <style>
       img{
           height: 100px;
           width: 100px;
       }
   </style>
</head>

<body>

<div class="container">

    <div class="row">
        <div class="col-lg-12 text-center">
            <h1 class="page-header">Olá,
                <small>vamos falar sobre o seu município?</small>
            </h1>

            <p style="font-size: 18px"><strong>Caro eleitor(a)</strong>, você conhece as propostas dos candidatos do seu município?
            </p>

            <p style="font-size: 18px">Se te perguntassem se foi cumprido o que prometeram, saberia responder?

            <p>

        </div>
    </div>

    <!-- Team Members Row -->
    <div class="row">
        <div class="col-lg-12">
            <h4 class="page-header">Veja quais foram os candidatos eleitos no seu município</h4>

            <div id="eleitos" class="text-center">
                <div class='uil-squares-css' style='transform:scale(0.6); margin-left: auto; margin-right: auto'>
                    <div><div></div></div>
                    <div><div></div></div>
                    <div><div></div></div>
                    <div><div></div></div>
                    <div><div></div></div>
                    <div><div></div></div>
                    <div><div></div></div>
                    <div><div></div></div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    $(document).ready(function () {
        carregarPoliticosEleitos()

    });

    function mostrarPoliticosEleitos(data) {
        $('#eleitos').html(data);
    }
    function carregarPoliticosEleitos() {
        $.ajax({
            url: "${g.createLink(controller:'politico',action:'carregarEleitos')}",
            method: "post",
            success: function (data) {
                mostrarPoliticosEleitos(data)
            }
        })
    }
</script>
</body>
</html>
