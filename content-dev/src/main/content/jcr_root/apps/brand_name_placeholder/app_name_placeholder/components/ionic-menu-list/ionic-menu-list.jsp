<%--
	ADOBE CONFIDENTIAL
	__________________

	 Copyright 2013 Adobe Systems Incorporated
	 All Rights Reserved.

	NOTICE:  All information contained herein is, and remains
	the property of Adobe Systems Incorporated and its suppliers,
	if any.  The intellectual and technical concepts contained
	herein are proprietary to Adobe Systems Incorporated and its
	suppliers and are protected by trade secret or copyright law.
	Dissemination of this information or reproduction of this material
	is strictly forbidden unless prior written permission is obtained
	from Adobe Systems Incorporated.
--%><%
%><%@include file="/libs/foundation/global.jsp" %><%
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
