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
<form action="addinstructor" enctype="multipart/form-data" method="post">
<h1 style="font-family: 'Anton', sans-serif;
font-family: 'PT Serif', serif;">Add Instructor</h1>
<table style="border-collapse:collapse;height:auto;width:35%;border-radius: 10px; ">
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Instructor Name:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="name"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Phone Number:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="ph"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Instructor image:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="file" name="img"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Degree:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="degree"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Salary:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="salary"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="btn" type="reset" value="Reset"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="btn" type="submit" value="Add" name="Add"></td></tr>
</table>
</form>

</body>
</html>