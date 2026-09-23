var imagemGenio = document.getElementById("imagem-genio");
var textoDescritivo = document.getElementById("texto-descritivo");
var inputPalpite = document.getElementById("palpite");
var btnConsigo = document.getElementById("btn-consigo");
var btnDesisto = document.getElementById("btn-desisto");

var textoInicial = "Pense em um número, consegue adivinhar?!";
var numeroSecreto;

function reiniciarJogo() {
    numeroSecreto = Math.floor(Math.random() * 11);
    imagemGenio.src = "imagens/genio_inicio.png";
    textoDescritivo.textContent = textoInicial;
    inputPalpite.value = "";
    inputPalpite.disabled = false;
}

console.log(numeroSecreto);

reiniciarJogo();

window.addEventListener("pageshow", function (evento) {
    if (evento.persisted) {
        reiniciarJogo();
    } else {
        inputPalpite.value = "";
    }
});

btnConsigo.addEventListener("click", function () {
    var valor = inputPalpite.value.trim();

    if (valor === "") {
        alert("A regra é clara! Tem que preencher um valor para jogar");
        return;
    }

    var palpite = parseInt(valor, 10);

    if (palpite === numeroSecreto) {
        alert("Você acertou!!! Parabéns!!!");
        imagemGenio.src = "imagens/genio_acertou.png";
        textoDescritivo.textContent =
            "Parabéns você ganhou! Aperte F5 para jogar novamente";
        inputPalpite.disabled = true;
    } else {
        alert("Você errou!!! Tente Novamente!!!");
        imagemGenio.src = "imagens/genio_erro.png";
        textoDescritivo.textContent = textoInicial;
    }
});

btnDesisto.addEventListener("click", function () {
    imagemGenio.src = "imagens/genio_desistiu.png";
    textoDescritivo.textContent =
        "Você desistiu. Aperte F5 para jogar novamente";
    inputPalpite.disabled = true;
});
