<%@page session="false"%><%
%><%@include file="/libs/foundation/global.jsp" %><%
%><cq:includeClientLib js="apps.app_name_placeholder.splash-screen"/>

<!-- Enable all requests, inline styles, and eval() -->
<!-- TODO: set a more restrictive CSP for production -->
<meta http-equiv="Content-Security-Policy" content="default-src *; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' 'unsafe-eval'">
