<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.beanutils.BeanUtils" %>
<head>
    <title>Snoop</title>
    <style type="text/css">
        #snoopbox {
            border: 1px solid;
            font-size: small;
            text-align: left;
            padding: 20px;
            background-color: white
        }
        body {
            font-family: "Courier New", monospace; font-size: small
        }
    </style>

</head>
<body>

    <div id="snoopbox">

        <h1>Snoop</h1>

        <h2>POST form</h2>
        <form method="post">
            <table width="250px">
                <tr>
                    <td>Var1</td>
                    <td><input type="text" value="<%= request.getParameter("var1") == null || request.getParameter("var1").length() < 1 ? "Default" : request.getParameter("var1") %>" size="50" name="var1"/></td>
                </tr>
                <tr>
                    <td>Var2</td>
                    <td><input type="text" value="<%= request.getParameter("var2") == null || request.getParameter("var2").length() < 1 ? "Default" : request.getParameter("var2") %>" size="50" name="var2"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form>

        <h2>GET form</h2>
        <form method="GET">
            <table width="250px">
                <tr>
                    <td>Var3</td>
                    <td><input type="text" value="<%= request.getParameter("var3") == null || request.getParameter("var3").length() < 1 ? "Default" : request.getParameter("var3") %>" size="50" name="var3"/></td>
                </tr>
                <tr>
                    <td>Var4</td>
                    <td><input type="text" value="<%= request.getParameter("var4") == null || request.getParameter("var4").length() < 1 ? "Default" : request.getParameter("var4") %>" size="50" name="var4"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form>

        <h2>Request Parameters</h2>

        <table width="100%" cellspacing="0" cellpadding="2" bgcolor="#000000" border="1">
            <tr bgcolor="#dddddd">
                <th>Property</th>
                <th>Value</th>
            </tr>
            <%
                for ( Enumeration enu = request.getParameterNames(); enu.hasMoreElements(); ) {
                String attributeName = (String) enu.nextElement();
            %>
            <tr bgcolor="#eeeeee">
                <td><%= attributeName %></td>
                <td><%= request.getParameter(attributeName) %></td>
            </tr>
            <%
                }
            %>
        </table>


        <h2>Session Attributes</h2>

        <table width="100%" cellspacing="0" cellpadding="2" bgcolor="#000000" border="1">
            <tr bgcolor="#dddddd">
                <th>Property</th>
                <th>Value</th>
            </tr>
            <%
                for ( Enumeration enu = session.getAttributeNames(); enu.hasMoreElements(); ) {
                String attributeName = (String) enu.nextElement();
            %>
            <tr bgcolor="#eeeeee">
                <td><%= attributeName %></td>
                <td><%= BeanUtils.describe(session.getAttribute(attributeName)) %></td>
            </tr>
            <%
                }
            %>
        </table>


        <h2>HttpServletRequest Properties</h2>

        <table width="100%" cellspacing="0" cellpadding="2" bgcolor="#000000" border="1">
            <tr bgcolor="#dddddd">
                <th>Property</th>
                <th>Value</th>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getMethod()</td>
                <td><%= request.getMethod() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getAuthType()</td>
                <td><%= request.getAuthType() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getContextPath()</td>
                <td><%= request.getContextPath() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getPathInfo()</td>
                <td><%= request.getPathInfo() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getPathTranslated()</td>
                <td><%= request.getPathTranslated() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getQueryString()</td>
                <td><%= request.getQueryString() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getRequestedSessionId()</td>
                <td><%= request.getRequestedSessionId() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getRequestURI()</td>
                <td><%= request.getRequestURI() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getServletPath()</td>
                <td><%= request.getServletPath() %></td>
            </tr>
        </table>


        <h2>ServletRequest Properties</h2>

        <table width="100%" cellspacing="0" cellpadding="2" bgcolor="#000000" border="1">
            <tr bgcolor="#dddddd">
                <th>Property</th>
                <th>Value</th>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getCharacterEncoding()</td>
                <td><%= request.getCharacterEncoding() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getContentType()</td>
                <td><%= request.getContentType() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getLocale()</td>
                <td><%= request.getLocale() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getProtocol()</td>
                <td><%= request.getProtocol() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getRemoteAddr()</td>
                <td><%= request.getRemoteAddr() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getRemoteHost()</td>
                <td><%= request.getRemoteHost() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getScheme()</td>
                <td><%= request.getScheme() %></td>
            </tr>
            <tr bgcolor="#eeeeee">
                <td>getServerName()</td>
                <td><%= request.getServerName() %></td>
            </tr>
        </table>

        <h2>HTTP Headers</h2>

        <table width="100%" cellspacing="0" cellpadding="2" bgcolor="#000000" border="1">
            <tr bgcolor="#dddddd">
                <th>Property</th>
                <th>Value</th>
            </tr>
            <%
                for ( Enumeration enu = request.getHeaderNames(); enu.hasMoreElements(); ) {
                String headerName = (String) enu.nextElement();
            %>
            <tr bgcolor="#eeeeee">
                <td><%= headerName %></td>
                <td><%= request.getHeader(headerName) %></td>
            </tr>
            <%
                }
            %>
        </table>

    </div>

</body>
</html>
