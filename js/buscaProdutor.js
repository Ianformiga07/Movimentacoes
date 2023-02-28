"use strict";
$(document).ready(function () {

    // Pesquisa o produtor
    $(document.body).on("click", ".jq-buscaProdutor", function () {
        $(".alvo-buscaProdutor").html("");
        var CpfCnpj = $("[name='buscaProdutorCpfCnpj']").val();
        var Produtor = $("[name='buscaProdutorProdutor']").val();
        var Cidade = $("[name='buscaProdutorCidade']").val();
        $.ajax({
            type: "POST",
            url: "http://localhost/MovimentaGTA/ajax/tab_buscaProdutor.ajax.asp",
            data: 'CpfCnpj=' + CpfCnpj + '&Produtor=' + encodeURI(Produtor) + '&Cidade=' + Cidade,
            cache: false,
            beforeSend: function () {
                showLoader();
            },
            error: function () {
                closeLoader();
                setTimeout((function () {
                    Swal.fire({
                        text: "Desculpe, parece que alguns erros foram detectados, tente novamente.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "OK",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                }), 300);
            },
            success: function (response) {
                closeLoader();
                setTimeout((function () {
                                    
                    // Retorna os dados da consulta
                    if(response) {
                        $(".alvo-buscaProdutor").html(response);
                    }
                }), 300);
            }
        });
        return false;
    });

    // Realiza apaginação da pesquisa
    $(document.body).on("click", ".jq-paginacao", function () {
        var Pagina = $(this).data("pagina")
        var CpfCnpj = $("[name='buscaProdutorCpfCnpj']").val();
        var Produtor = $("[name='buscaProdutorProdutor']").val();
        var Cidade = $("[name='buscaProdutorCidade']").val();
        $.ajax({
            type: "POST",
            url: "http://localhost/MovimentaGTA/ajax/tab_buscaProdutor.ajax.asp",
            data: 'Pagina=' + Pagina + '&CpfCnpj=' + CpfCnpj + '&Produtor=' + encodeURI(Produtor) + '&Cidade=' + Cidade,
            cache: false,
            beforeSend: function () {
                showLoader();
            },
            error: function () {
                closeLoader();
                setTimeout((function () {
                    Swal.fire({
                        text: "Desculpe, parece que alguns erros foram detectados, tente novamente.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "OK",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    });
                }), 300);
            },
            success: function (response) {
                closeLoader();
                setTimeout((function () {
                                    
                    // Retorna os dados da consulta
                    if(response) {
                        $(".alvo-buscaProdutor").html(response);
                    }
                }), 300);
            }
        });
        return false;
    });    
});

function showLoader() {
    swal.fire({
        html: '<svg class="main-load-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid"><circle cx="50" cy="50" r="32" stroke-width="8" stroke="#5477E9" stroke-dasharray="50.26548245743669 50.26548245743669" fill="none" stroke-linecap="round" transform="rotate(131.685 50 50)"><animateTransform attributeName="transform" type="rotate" repeatCount="indefinite" dur="1s" keyTimes="0;1" values="0 50 50;360 50 50"></animateTransform></circle></svg>',
        title: "Aguarde, carregando...",
        width: 160,
        padding: "0 10px 8px 10px",
        showConfirmButton: false,
        allowOutsideClick: false,
    });
}

function closeLoader() {
    Swal.close();
}