<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="add.css">
</head>
<body>
<form action="addtimetable">
<h1>Add Time-Table</h1>
<table style="border-collapse:collapse;height:auto;width:35%;border-radius: 10px; ">
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Day Name:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="name"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Class Time:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="ctime"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">


<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="btn" type="reset" value="Reset"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="btn" type="submit" value="Add" name="Add"></td></tr>
</table>
</form>
</body>
</html>