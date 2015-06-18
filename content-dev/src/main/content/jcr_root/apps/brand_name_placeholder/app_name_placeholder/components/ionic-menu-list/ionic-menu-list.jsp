<%@include file="/libs/foundation/global.jsp" %><%
%><%@ page session="false"
           import="com.day.cq.wcm.api.WCMMode,
				   com.day.cq.wcm.api.components.DropTarget,
                   com.day.cq.wcm.foundation.Placeholder" %><%
%><c:set var="wcmMode"><%= WCMMode.fromRequest(request) != WCMMode.DISABLED %></c:set><%
%><c:set var="ddClassName"><%= DropTarget.CSS_CLASS_PREFIX + "pages" %></c:set>

<c:if test="${wcmMode}">
    <div class="<c:out value='${ddClassName}'/>">
</c:if>

<%-- initialize the list --%>
<cq:include script="init.jsp"/>

<c:choose>
    <c:when test="${empty list.pages}">
        <c:if test="${wcmMode}"><%
            String classicPlaceholder = "<img src=\"/libs/cq/ui/resources/0.gif\" class=\"cq-carousel-placeholder\" alt=\"\">";
            String placeholder = Placeholder.getDefaultPlaceholder(slingRequest, component, classicPlaceholder);
            %><%= placeholder %>
        </c:if>
    </c:when>
    <c:otherwise>
        <cq:include script="template.jsp"/>
    </c:otherwise>
</c:choose>

<c:if test="${wcmMode}">
    </div>
</c:if>
