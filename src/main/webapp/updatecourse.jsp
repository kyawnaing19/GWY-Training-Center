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

<form action="updatecourse" method="post" enctype="multipart/form-data" >

<h1 style="font-family: 'Anton', sans-serif;
font-family: 'PT Serif', serif;">Update Courses</h1>
<table style="border-collapse:collapse;height:auto;width:35%;border-radius: 10px; ">
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><b>Course ID</b></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input readonly type="text" value="<%=request.getParameter("cid") %>" name="t1" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Course Name</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("name") %>" name="t2" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Instructor ID</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("iid") %>" name="t3" class="f"></td></tr>

<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Duration</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("duration") %>" name="t4" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Course Price</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("price") %>" name="t5" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Location</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" value="<%=request.getParameter("location") %>" name="t6" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Student Limit</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" value="<%=request.getParameter("limit") %>" name="t7"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Course Img</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="file" value="<%=request.getParameter("img") %>" name="t8"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Day</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" name="t9" value="<%=request.getParameter("day") %>" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Class time</td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="text" name="t10" value="<%=request.getParameter("time") %>" class="f"></td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Course Info</td>

<td style="padding:10px 5px 10px 5px;font-size: large;"><textarea rows="2" cols="30"  name="t11" value="<%=request.getParameter("info") %>" class="f"></textarea> </td></tr>
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="reset" class="btn" name="submit" value="Reset"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input type="submit" class="btn" name="submit" value="Update"></td></tr>
</table>
</form>

</body>
</html>