<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
<#assign requiredActionsValues><#if requiredActions??><#list requiredActions><#items as reqActionItem>${reqActionItem}<#sep>, </#sep></#items></#list></#if></#assign>

</#outputformat>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

 <style>

 @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;500;700&display=swap');

.kc-content-msg{
    width: 87%;
}

.kc-template-body-email{
    background-color: #fff;
    border-top: 20px solid #F3F3F3;
    border-bottom: 106px solid #F3F3F3;
    width: 456px;
    margin: auto;
    border-left: 1px solid #F3F3F3;
    border-right: 1px solid #F3F3F3;
    padding: 18px;
    border-radius: 5px;
}

.onemail .inbox-message {
    padding: 10px  !important;
    min-height: 100px  !important;
}
kc-font-style{
    font-family: 'Roboto';
}
kc-font-weight{
    font-weight: 500;
}
kc-font-color{
    color: #4a4a4a;
}

section {
    width: 100%;
    height: auto;
    background: #FFFFF;
}

section .kc-body-emai {
    width: 100%; height:80%; background-color: #000 !important; display: flex; flex-direction: column; justify-content: center; align-content: center;
}


section{
    width: 100% !important;
    height: 80% !important;
    background-color: #f5f5f5 !important;
    margin-top:5%;
}
.kc-tittle-email{
    width: 50%;
    font-family: 'Montserrat', Arial;
    font-style: normal;
    font-weight: 800;
    font-size: 2rem;
    line-height: 44px;
    text-transform: uppercase;
    color: #333745;
    margin-bottom: 36px;
}


.kc-content-email{
    background: #FFFFFF;
    border-radius: 20px;
    width: 60%;
    height: 36%;
    padding: 40px;

    font-family: 'Montserrat', Arial;
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    line-height: 20px;

    color: #8C97AC;
}

.kc-header-rpassword{
    width: 100%;
    height: 30%;
    background-color: white;
    margin: 0px auto 100px auto;
    text-align: center;
    padding: 20px;
}

.kc-footer-rpassword{
    width: 100%;
    margin-top: 100px;
    height: 140px;
    background-color: white;
    display: flex;
    align-items: center;
}

.kc-footer-rpassword a{
    font-family: 'Montserrat',Arial;
    font-style: normal;
    font-weight: 800;
    font-size: 24px;
    line-height: 29px;
    color: #333745;
    text-decoration: none;
    margin: auto;
}

@media screen and (max-width: 600px) {
    .kc-tittle-email{
        width: 90%;
        font-size: 1rem;
    }
    .kc-content-email{
        width: 90%;
        margin: 0px !important;
        padding: 5px;
    }
}

</style>
</head>

<body style="background: #FFFFF;">

<div style="height: 100%; background: #f5f5f5;">
    <#if requiredActionsValues == "VERIFY_EMAIL">
        <section style="background-color: #f5f5f5; ">
            <div style="width: 80%; margin:auto; margin-top:50px; padding: 40px;">
                <h1 class="kc-tittle-email">Verificação de endereço de e-mail</h1>
                <div class="kc-content-email">
                    ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration)))?no_esc}
                </div>
            </div>
        </section>

    <#elseif requiredActionsValues == "UPDATE_PASSWORD">

    <div class="kc-header-rpassword">
        <img src="https://devland.cidadao.online/_nuxt/img/logo2.9bdd913.png" alt="logo_proximo" style="width: 20%;"/>
    </div>

       <section style="background-color: #f5f5f5;">
            <div style="width: 80%; margin:auto; margin-top:50px;">
                <h1 class="kc-tittle-email">RECUPERAR A SENHA.</h1>
                <div class="kc-content-email">
                    ${kcSanitize(msg("passwordResetBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration)))?no_esc}
                </div>
            </div>
       </section>

    <div class="kc-footer-rpassword">
        <a href="https://devland.cidadao.online/#/" >www.proximo.digital</a>
    </div>

    <#else>
    </#if>
</div>

</body>
</html>
