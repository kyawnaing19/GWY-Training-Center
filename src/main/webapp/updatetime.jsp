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

<form action="updatetime">

<h1>Update Time-Table</h1>
<table style="border-collapse:collapse;height:auto;width:35%;border-radius: 10px; ">
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><b>Enter old Day ID</b></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" name="t1" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Day Name</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" name="t2" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Class Time</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" name="t3" class="f"></td></tr>

<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="reset" class="btn" name="submit" value="Reset"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="submit" class="btn" name="submit" value="Update"></td></tr>
</table>
</form>

</body>
</html>