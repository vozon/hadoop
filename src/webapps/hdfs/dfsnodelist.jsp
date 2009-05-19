<%
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file 
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
%>
<%@ page
contentType="text/html; charset=UTF-8"
	import="javax.servlet.*"
	import="javax.servlet.http.*"
	import="java.io.*"
	import="java.util.*"
	import="org.apache.hadoop.fs.*"
	import="org.apache.hadoop.hdfs.*"
	import="org.apache.hadoop.hdfs.server.common.*"
	import="org.apache.hadoop.hdfs.server.namenode.*"
	import="org.apache.hadoop.hdfs.server.datanode.*"
	import="org.apache.hadoop.hdfs.protocol.*"
	import="org.apache.hadoop.util.*"
	import="java.text.DateFormat"
  import="org.apache.hadoop.util.*"
%>
<%
final NamenodeJspHelper.NodeListJsp nodelistjsp = new NamenodeJspHelper.NodeListJsp();
NameNode nn = (NameNode)application.getAttribute("name.node");
String namenodeRole = nn.getRole().toString();
FSNamesystem fsn = nn.getNamesystem();
String namenodeLabel = nn.getNameNodeAddress().getHostName() + ":" + nn.getNameNodeAddress().getPort();
%>

<html>

<link rel="stylesheet" type="text/css" href="/static/hadoop.css">
<title>Hadoop <%=namenodeRole%> <%=namenodeLabel%></title>
  
<body>
<h1><%=namenodeRole%> '<%=namenodeLabel%>'</h1>
<%= NamenodeJspHelper.getVersionTable(fsn) %>
<br />
<b><a href="/nn_browsedfscontent.jsp">Browse the filesystem</a></b><br>
<b><a href="/logs/"><%=namenodeRole%> Logs</a></b><br>
<b><a href=/dfshealth.jsp> Go back to DFS home</a></b>
<hr>
<% nodelistjsp.generateNodesList(out, nn, request); %>

<%
out.println(ServletUtil.htmlFooter());
%>
