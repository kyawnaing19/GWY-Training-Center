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
<div id="addcourse">
<form enctype="multipart/form-data" action="AddCourse2" method="post">
<h1 style="font-family: 'Anton', sans-serif;
font-family: 'PT Serif', serif;">Add Course</h1>
<table border="0" style="border-collapse:collapse;height:auto;width:35%;border-radius: 10px; ">
<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Course Name:</td>

<td style="padding:10px 5px 10px 5px;font-size: large;">Instructor_ID:</td></tr>

<tr style="padding:10px 5px 10px 5px;font-size: large;">

<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="name"></td>

<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="iid"></td></tr>

<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Duration:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;">Course Price:</td><tr>


<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="duration"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="price"></td></tr>


<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Location:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;">Student Limit</td><tr>

<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="location"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="stu"></td></tr>


<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Course Img</td>
<td style="padding:10px 5px 10px 5px;font-size: large;">Day:</td></tr>

<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="file" name="img"></td>							
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="day"></td></tr>


<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;">Class Time:</td>
<td style="padding:10px 5px 10px 5px;font-size: large;">Course Info:</td><tr>

<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="f" type="text" name="time"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><textarea rows="2" cols="30" name="info"></textarea></td></tr>


<tr style="padding:10px 5px 10px 5px;font-size: large;">
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="btn" type="reset" value="Reset"></td>
<td style="padding:10px 5px 10px 5px;font-size: large;"><input class="btn" type="submit" value="Add" name="Add"></td></tr>
</table>
</form>
</div>
</body>
</html>