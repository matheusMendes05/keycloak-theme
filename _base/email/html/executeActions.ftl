<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
<#assign requiredActionsValues><#if requiredActions??><#list requiredActions><#items as reqActionItem>${reqActionItem}<#sep>, </#sep></#items></#list></#if></#assign>

</#outputformat>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<style>

 @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@100,200,300,400,500,600,700,800,900&display=swap');

 .body-kc{
    height: 680px;
    background: #FFFFF;
    border: 1px solid transparent;
 }

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



section .kc-body-emai {
    width: 100%; height:80%; background-color: #000 !important; display: flex; flex-direction: column; justify-content: center; align-content: center;
}


.section{
    height: 560px;
    background-color: #f5f5f5!important;
    margin: 4% 0px;
    border: 1px solid transparent;
}

.kc-tittle-email-update, 
.kc-tittle-email-verify {
    font-family: 'Montserrat',Arial;
    font-style: normal;
    font-weight: 800;
    font-size: 2rem;
    line-height: 44px;
    text-transform: uppercase;
    color: #333745;
}

.kc-tittle-email-update {
    width: 800px;
    margin-bottom: 60px;
}

.kc-tittle-email-verify{
    width: 400px;
    margin-bottom: 48px;
}


.kc-content-email{
    background: #ffffff;
    border-radius: 20px;
    width: 550px;
    padding: 40px;
    font-family: 'Montserrat',Arial;
    font-style: normal;
    font-weight: 600;
    font-size: 16px;
    line-height: 20px;
    color: #8c97ac;
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

.email-kc-body{
    width: 80%;
    margin: 88px auto;
}

@media screen and (max-width: 600px) {
    .kc-tittle-email{
        font-size: 1rem;
    }
    .kc-content-email{
        margin: 0px !important;
        padding: 5px;
    }
}

</style>
</head>

<body>

<div class="body-kc"> 
    <div>
        <#if requiredActionsValues == "VERIFY_EMAIL">
            <div class="section">
                <div class="email-kc-body">
                    <h1 class="kc-tittle-email-verify">Verificação de endereço de e-mail</h1>
                    <div class="kc-content-email">
                        ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration)))?no_esc}
                    </div>
                </div>
            </div>

        <#elseif requiredActionsValues == "UPDATE_PASSWORD">

        <!--
        <div class="kc-header-rpassword">
            <img src="https://devland.cidadao.online/_nuxt/img/logo2.9bdd913.png" alt="logo_proximo" style="width: 20%;"/>
        </div>
        -->

        <div class="section">
                <div class="email-kc-body">
                    <h1 class="kc-tittle-email-update">RECUPERAR A SENHA.</h1>
                    <div class="kc-content-email">
                        ${kcSanitize(msg("passwordResetBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration)))?no_esc}
                    </div>
                </div>
        </div>

    <!-- 
        <div class="kc-footer-rpassword">
            <a href="https://devland.cidadao.online/#/" >www.proximo.digital</a>
        </div>
    -->

        <#else>
        </#if>
    </div>
</div>

</body>
</html>
