function classificarProposta(id, valor) {
    $.ajax({
        url: '/politica/proposta/avaliar',
        data: {
            id: id,
            valor: valor
        },
        method: "post",
        success: function (data) {
            exibirMensagemGenerica(data, 'Avaliado com sucesso', false)
        }
    })
}
