<%@page session="false"
          import="com.day.cq.wcm.api.Page,
                  com.day.cq.wcm.api.PageFilter,
                  java.util.List,
                  com.day.cq.wcm.api.components.IncludeOptions,
                  com.adobe.cq.mobile.angular.data.util.FrameworkContentExporterUtils" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
    slingResponse.setContentType("application/javascript");
%>;(function (angular, document, undefined) {

    'use strict';

    // Cache killer is used to ensure we get the very latest content after an app update
    var cacheKiller = '?ck=' + (new Date().getTime());

    /**
     * Controllers
     */
    angular.module('cqAppControllers', ['ngRoute', 'ionic'])<%
%><%

    List<Page> currentPageAndDescendants = FrameworkContentExporterUtils.getAllAngularDescendantPages(currentPage, new PageFilter(request));
    currentPageAndDescendants.add(currentPage);

    for (Page angularPage : currentPageAndDescendants) {
        pageContext.setAttribute("angularPage", angularPage);
        // Prevent wrapping of controller .js content
        IncludeOptions opts = IncludeOptions.getOptions(request, true);
        opts.setDecorationTagName("");
        opts.forceSameContext(Boolean.TRUE);
            %><cq:include resourceType="${angularPage.contentResource.resourceType}" path="${angularPage.path}.controller.js"/><%
    }
%>

}(angular, document));