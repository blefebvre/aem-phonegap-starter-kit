<%@page session="false" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
%>
<cq:includeClientLib css="brand_name_placeholder.ionic-1.1.0"/>
<cq:includeClientLib css="apps.brand_name_placeholder.app_name_placeholder.all"/>

<!-- Enable all requests, inline styles, and eval() -->
<!-- TODO: set a more restrictive CSP for production -->
<meta http-equiv="Content-Security-Policy" content="default-src 'self' gap://ready; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; connect-src *; img-src *">