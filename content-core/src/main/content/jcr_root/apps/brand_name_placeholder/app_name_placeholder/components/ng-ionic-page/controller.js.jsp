<%@page session="false"
          import="java.util.List,
                  com.day.cq.wcm.api.components.IncludeOptions,
                  com.adobe.cq.mobile.angular.data.util.FrameworkContentExporterUtils" %><%
%><%@include file="/libs/foundation/global.jsp" %><%

    // Find all angular components
    Page angularPage = resource.adaptTo(Page.class);
    slingRequest.setAttribute("angularPage", angularPage);

    List<Resource> angularPageComponents = FrameworkContentExporterUtils.getAllAngularPageComponents(angularPage.getContentResource());

    String relativeResourcePath = FrameworkContentExporterUtils.getRelativePathToDescendantResource(
            currentPage.adaptTo(Resource.class), angularPage.adaptTo(Resource.class));
    pageContext.setAttribute("relativeResourcePath", relativeResourcePath);
    
    slingResponse.setContentType("application/javascript");

%><c:set var="controllerNameStripped"><%= angularPage.getPath().replaceAll("[^A-Za-z0-9]", "") %></c:set>

// Controller for page '<c:out value="${angularPage.name}"/>'
.controller('<c:out value="${controllerNameStripped}"/>', ['$scope', '$http', '$ionicModal',
function($scope, $http, $ionicModal) {
    var data = $http.get('<c:out value="${relativeResourcePath}"/>.angular.json' + cacheKiller);
<%

    for (Resource angularComponent : angularPageComponents) {
        IncludeOptions opts = IncludeOptions.getOptions(request, true);
        opts.setDecorationTagName("");
        opts.forceSameContext(Boolean.TRUE);
        %><cq:include resourceType="<%= angularComponent.getResourceType() %>" path="<%= angularComponent.getPath() + ".controller.js" %>"/><%
    }
%>
}])