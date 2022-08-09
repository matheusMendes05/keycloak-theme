/* Máscaras Telefone */
function mascara(o, f) {
    v_obj = o
    v_fun = f
    setTimeout("execmascara()", 1)
}
function execmascara() {
    v_obj.value = v_fun(v_obj.value)
}
function mtel(v) {
    v = v.replace(/\D/g, ""); //Remove tudo o que não é dígito
    v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    v = v.replace(/(\d)(\d{4})$/, "$1-$2"); //Coloca hífen entre o quarto e o quinto dígitos
    return v;
}
function id(el) {
    return document.querySelector(el);
}


/*Mascara e validador CPF */

// mascara
function formatarCampo(campoTexto) {
    if (campoTexto.value.length <= 11) {
        campoTexto.value = mascaraCpf(campoTexto.value);
    } else {
        campoTexto.value = mascaraCnpj(campoTexto.value);
    }
}
function retirarFormatacao(campoTexto) {
    campoTexto.value = campoTexto.value.replace(/(\.|\/|\-)/g, "");
}
function mascaraCpf(valor) {
    let val = valor.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/g, "\$1.\$2.\$3\-\$4");
    if (this.verificarCPF(valor) != true) {
        const divCpf = document.querySelector(".div_cpf");
        let span = document.createElement('span');
        span.classList = '${properties.kcInputErrorMessageClass!}';
        span.setAttribute("id", "input-error-username");
        span.ariaLive = "polite";
        span.innerText = "CPF inválido";
        span.style = "color: red";

        if (!document.querySelector("#input-error-username")) {

            divCpf.appendChild(span);
            setInterval(() => {
                divCpf.removeChild(span)
            }, 1000);

        }
        console.log(divCpf)
    }
    return val;
}
function mascaraCnpj(valor) {
    return valor.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/g, "\$1.\$2.\$3\/\$4\-\$5");
}


function formatConverterCpf(valor) {

    valor.value = mascaraCpf(valor.value);

}

function viewPassword(valor) {

    const password = document.querySelector("#password-new");

    const type = password.getAttribute("type") === "password" ? "text" : "password";
    password.setAttribute("type", type);
}

function viewConfirmPassword() {
    const password = document.querySelector("#password-confirm");

    const type = password.getAttribute("type") === "password" ? "text" : "password";
    password.setAttribute("type", type);
}

function confirmPassword() {
    var newPassword = document.getElementById("password-new").value;
    var confirmPassword = document.getElementById("password-confirm").value;

    if (newPassword != confirmPassword) {
        document.getElementById("senhasIguais").style.color = "black"
    } else {
        document.getElementById("senhasIguais").style.color = "green"
    }
}

function validPasswords(valor) {

    /***numero de caracters */

    var numeroCaracters = (valor.value.length >= 8) ? true : false;

    /** number */

    // var numberregexp = new RegExp(/[0-9]/);
    // var number = numberregexp.exec(valor.value);

    /** number */

    var mausculoregexp = new RegExp(/[A-Z]/);
    var mausculo = mausculoregexp.exec(valor.value);


    /** number */

    var minusculoregexp = new RegExp(/[a-z]/);
    var minusculo = minusculoregexp.exec(valor.value);

    /** number */

    var caracterregexp = new RegExp(/[@$!%*-+~#?&]/);
    var caracter = caracterregexp.exec(valor.value);

    if (numeroCaracters) {
        document.getElementById("numerosDeCaracters").style.color = "green"
    } else {
        document.getElementById("numerosDeCaracters").style.color = "black"
    }

    // if(number){
    //     document.getElementById("numberValidSenha").style.color = "green"
    // }else{
    //     document.getElementById("numberValidSenha").style.color = "black"
    // }

    if (mausculo) {
        document.getElementById("mausculoValidSenha").style.color = "green"
    } else {
        document.getElementById("mausculoValidSenha").style.color = "black"
    }

    if (minusculo) {
        document.getElementById("minusculoValidSenha").style.color = "green"
    } else {
        document.getElementById("minusculoValidSenha").style.color = "black"
    }

    if (caracter) {
        document.getElementById("caracterValidSenha").style.color = "green"
    } else {
        document.getElementById("caracterValidSenha").style.color = "black"
    }


}

// validar
function verificarCPF(cpf) {
    // Remove os pontos/traço da expressão regular, caso exista
    cpf = cpf.replace(/[^\d]+/g, '');
    if (cpf == '') return false;

    // Elimina CPFs invalidos conhecidos    
    if (cpf.length != 11 ||
        cpf == "00000000000" ||
        cpf == "11111111111" ||
        cpf == "22222222222" ||
        cpf == "33333333333" ||
        cpf == "44444444444" ||
        cpf == "55555555555" ||
        cpf == "66666666666" ||
        cpf == "77777777777" ||
        cpf == "88888888888" ||
        cpf == "99999999999")
        return false;

    // Valida 1o digito 
    add = 0;

    for (i = 0; i < 9; i++) {
        add += parseInt(cpf.charAt(i)) * (10 - i);
    }
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11) {
        rev = 0;
    }

    if (rev != parseInt(cpf.charAt(9))) {
        return false;
    }

    // Valida 2o digito 
    add = 0;
    for (i = 0; i < 10; i++) {
        add += parseInt(cpf.charAt(i)) * (11 - i);
    }
    rev = 11 - (add % 11);
    if (rev == 10 || rev == 11) {
        rev = 0;
    }
    if (rev != parseInt(cpf.charAt(10))) {
        return false;
    }

    return true;
}
