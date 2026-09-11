<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="add.css">
<style>
  @import url('https://fonts.googleapis.com/css2?family=Anton&family=PT+Serif:ital,wght@1,700&display=swap');
</style>
</head>
<body>
<h1 style="font-family: 'Anton', sans-serif;
font-family: 'PT Serif', serif;">Update Instructor Info</h1>
<form action="updateinst" method="post" enctype="multipart/form-data">


<table style="border-collapse:collapse;height:auto;width:35%;border-radius: 10px; ">
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><b>Enter old instructor ID</b></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("instId") %>" name="t1" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Instructor Name</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("name") %>" name="t2" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Phone</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("phno") %>" name="t3" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Picture</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="file" value="<%=request.getParameter("image") %>" name="img" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Degree</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("degree") %>" name="t5" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Salary</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("salary") %>" name="t6" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="reset" class="btn" name="submit" value="Reset"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="submit" class="btn" name="submit" value="Update"></td></tr>
</table>
</form>

</body>
</html>