function mostrarMediaNota(data) {
    $('#avaliacao').html(data).fadeToggle();
}


function carregarMediaNota(id) {
    $.ajax({
        url: "/politica/nota/carregarNota",
        data: {
            id: id,
        },
        method: "post",
        success: function (data) {
            for (var i = 0; i < data.nota.length; i++) {
                mostrarMediaNota(data)
            }
        }
    })
}


function carregarNota(id) {
    $.ajax({
        url: "/politica/nota/carregarNotaUsuario",
        data: {
            id: id,
        },
        method: "post",
        success: function (data) {
            $("#rating" + data.valor).attr("checked", true)
        }
    })
}

