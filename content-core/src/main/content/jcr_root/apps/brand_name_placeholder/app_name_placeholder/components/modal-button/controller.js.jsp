<%@ page session="false"
           import="com.adobe.cq.mobile.angular.data.util.FrameworkContentExporterUtils" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
%><%
    // Controller for this component
    String componentPath = FrameworkContentExporterUtils.getRelativeComponentPath(resource.getPath());
    pageContext.setAttribute("componentPath", componentPath);


	String modalPagePath = properties.get("pagePath","");
	if (modalPagePath.length() > 0) {
		Resource modalPageResource = resourceResolver.getResource(modalPagePath);
        // Get relative path to modal page
		modalPagePath = FrameworkContentExporterUtils.getRelativePathToDescendantResource(
            currentPage.adaptTo(Resource.class), modalPageResource);
    }

    slingResponse.setContentType("application/javascript");
%>
    /* <c:out value='${resource.name}'/> component controller (path: <c:out value='${componentPath}'/>) */
	$ionicModal.fromTemplateUrl('<%= xssAPI.getValidHref(modalPagePath) %>.template.html', {
    	scope: $scope,
    	animation: 'slide-in-up'
    }).then(function(modal) {
    	$scope.currentModal = modal;
    });
    $scope.openModal = function() {
    	$scope.currentModal.show();
	};
 	$scope.closeModal = function() {
    	$scope.currentModal.hide();
	};