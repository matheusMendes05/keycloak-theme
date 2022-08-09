<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
<#assign requiredActionsValues><#if requiredActions??><#list requiredActions><#items as reqActionItem>${reqActionItem}<#sep>, </#sep></#items></#list></#if></#assign>

</#outputformat>
<html>
<head>
 <style>
 .kc-tittle-email{
     margin: 25px 0px;
     font-size: 22px;
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

section {
    width: 100%;
    height: auto;
    background: #FFFFF;
}

.kc-body-emai {
    background: #f5f5f5 !important;
    height: 400px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}


</style>
</head>
<body style="background: #c5c5c5; padding:20px;">
<div >
    <#if requiredActionsValues == "VERIFY_EMAIL">
        <section>
           <div class="kc-body-email">
                <h1 class="">Verificação de endereço de e-mail!</h1>
                <div class="kc-content-email">
                    <div class="kc-content-msg kc-font-weight kc-font-color">
                        ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration)))?no_esc}
                    </div>
                </div>
           </div>
        </section>

    <#elseif requiredActionsValues == "UPDATE_PASSWORD">
        <div class="kc-template-body-email kc-font-style">
            <h1 class="kc-tittle-email">Recuperar senha</h1>
            <div class="kc-content-msg kc-font-weight kc-font-color">
                ${kcSanitize(msg("passwordResetBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration)))?no_esc}
            </div>
        </div>
    <#else>
    </#if>
</div>

</body>
</html>
