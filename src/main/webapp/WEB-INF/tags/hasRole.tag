<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="roles" required="true" type="java.lang.String" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="hasAnyRole(${roles})">
    <jsp:doBody/>
</sec:authorize>
