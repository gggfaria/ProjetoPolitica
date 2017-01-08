
function contadorCaracteres(idCampo, idContador) {
    var tagContador = $(idContador)
    var conteudoCampo = $(idCampo).val()
    tagContador.text(conteudoCampo.length)
}

