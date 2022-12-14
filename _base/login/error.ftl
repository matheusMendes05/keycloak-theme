<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div id="kc-error-message" style="text-align: center;">
            <p class="instruction">${message.summary?no_esc}</p>
            <#if client?? && client.baseUrl?has_content>
                <!-- <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p> -->
            </#if>
                <p><a id="backToApplication" href="https://devland.cidadao.online/">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
        </div>
    </#if>
</@layout.registrationLayout>