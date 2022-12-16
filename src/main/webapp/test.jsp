<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
          #container {
              width: 1000px;
              margin: 20px auto;
          }
          .ck-editor__editable[role="textbox"] {
              /* editing area */
              min-height: 200px;
          }
          .ck-content .image {
              /* block images */
              max-width: 80%;
              margin: 20px auto;
          }
      </style>
</head>
<body>
        
   <!-- <form action="./sub.jsp" method="post"> -->
          <textarea name="content" id="editor">
              &lt;p&gt;This is some sample content.&lt;/p&gt;
          </textarea>
          <p><input type="submit" value="Submit"></p>
   <!-- </form> -->
        <script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/super-build/ckeditor.js"></script>
        <script src="./image_upload.js"></script>
</body>
</html>