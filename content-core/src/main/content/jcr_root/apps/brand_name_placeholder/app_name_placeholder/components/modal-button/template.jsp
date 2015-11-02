<%@ page session="false"
          import="com.day.cq.wcm.api.WCMMode" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
%><c:set var="wcmMode"><%= WCMMode.fromRequest(request) != WCMMode.DISABLED %></c:set>
    <c:choose>
        <c:when test="${wcmMode}">
<button ng-click="go('<%= xssAPI.getValidHref(properties.get("pagePath","")) %>')" class="button button-block button-stable">
        </c:when>
        <c:otherwise>
<button ng-click="openModal()" class="button button-block button-stable">
        </c:otherwise>
    </c:choose>
    <%= xssAPI.encodeForHTML(properties.get("jcr:title", "Button Title")) %>
</button>
