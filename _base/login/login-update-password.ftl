
<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">

        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
        
                 <input type="text" id="username" name="username" value="${username}" autocomplete="username"
                   readonly="readonly" style="display:none;"/>
                <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>
    
            <div class="${properties.kcFormGroupClass!}">
               <!-- 
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-new" class="${properties.kcLabelClass!}">${msg("passwordNew")}</label>
                    </div>
               -->
                <div class="${properties.kcInputWrapperClass!}">
                <input type="password" id="password-new" name="password-new" onkeyup="javascript: validPasswords(this);"  class="${properties.kcInputClass!} input_password"
                           autofocus autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" placeholder="NOVA SENHA" style="margin-top: 14px;"
                     />

                    <i class="" id="togglePassword">
                         <i id="viewPassword2000" class="las la-unlock-alt"   onclick="javascript: viewPassword(this);"></i>
                    </i>

                    <#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                           <br/> ${kcSanitize(messagesPerField.get('password'))?no_esc} 
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <!--
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    </div>
                 -->

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="password" id="password-confirm" name="password-confirm" onkeyup="confirmPassword()"
                           class="${properties.kcInputClass!} input_password"
                           autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                           placeholder="CONFIRMAR SENHA"
                    />
                    <i class="" id="togglePassword"><i class="las la-unlock-alt"   onclick="javascript: viewConfirmPassword();"></i></i>
                    <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            <br/> ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </span>
                    </#if>

                </div>
            </div>

             <div class="div-group-valid-password">
                        <li id="numerosDeCaracters">SENHA DEVE CONTER NO MÍNIMO 8 CARACTERES.</li>
                        <li id="mausculoValidSenha">SENHA DEVE CONTER UMA LETRA MAIÚSCULA.</li>
                        <li id="caracterValidSenha">SENHA DEVE CONTER UM CARÁCTER ESPECIAL.</li>
                        <!-- <li id="minusculoValidSenha">Pelo menos 1 letra minúscula</li> -->
                        
                        <!-- <li id="senhasIguais">As senhas devem ser iguais</li> -->
               </div>

            <div class="${properties.kcFormGroupClass!}" style="width: 140px;">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <#if isAppInitiatedAction??>
                            <div class="checkbox">
                                <label><input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked> ${msg("logoutOtherSessions")}</label>
                            </div>
                        </#if>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} grupo_btn_enviar">
                    <#if isAppInitiatedAction??>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} btn_enviar_check" type="submit" value="&#xf058; ENVIAR"/>
                        <i class="las la-check-circle icone_check"></i>
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} btn_enviar_check" type="submit" name="cancel-aia" value="true"/>${msg("doCancel")}</button>
                    <#else>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} btn_enviar_check" type="submit" value="ENVIAR"/>
                        <i class="las la-check-circle icone_check"></i>
                    </#if>
                </div>
            </div>
        </form>
    </#if>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@100;500;600;700&display=swap');

form i {
    margin-left: -24px;
    cursor: pointer;
    font-size: 20px;
    color: #8C97AC;
    position: relative;
    top: 1px;
}

.input_password{
    background: #FFFFFF;
    border: 2px solid #F5F5F5; 
    border-radius: 10px;
}
.input_password::placeholder{
    font-family: 'Montserrat';
    font-style: normal;
    font-weight: 600;
    font-size: 10px;
    line-height: 20px;
    text-transform: uppercase;
    color: #8C97AC;
}

#password-new, #password-confirm{
    font-family: 'Montserrat';
    font-style: normal;
    font-weight: 600;
    font-size: 12px;
    line-height: 20px;
    color: #8C97AC !important;
}

.pf-c-alert.pf-m-warning.pf-m-inline {
    display: none;
}

.btn_enviar_check{
    border-radius: 10px;
    background: #009A69 !important;
    height: 38px;
    font-size: 12px;
    text-align: right; 
    font-weight: 700;" 
}
.icone_check{
    position: absolute;
    top: 8px;
    font-size: 22px;
    left: 53px;
    color: white;
}

.grupo_btn_enviar{
    margin-top: 2px !important;
}

</style>


</@layout.registrationLayout>
