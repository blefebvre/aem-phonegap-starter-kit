<%@page session="false" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
    String headerText = currentPage.getTitle();
%><%
%>
<div class="modal">
    <ion-header-bar class="bar bar-header bar-light">
        <h1 class="title"><%= xssAPI.encodeForHTML(headerText) %></h1>
        <a ng-click="closeModal()" class="button icon-left ion-close-round button-clear"></a>
    </ion-header-bar>
    
    <ion-content class="has-header">
        <cq:include path="content-par" resourceType="foundation/components/parsys" />
    </ion-content>
</div>