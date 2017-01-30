<g:each in="${eleitos}" var="eleito">
    <div class="col-lg-4 col-sm-6 text-center">
            <img class="img-circle img-responsive img-center" src="${eleito.foto}" alt="Foto de ${eleito.nome}">

        <h3><span style=" text-transform:capitalize;">${eleito.cargo}:</span> ${eleito.nome}</h3>

        <p> <strong>${eleito.partido.sigla}</strong></p>
    </div>
</g:each>



