<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css
">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js
"></script>

<link rel="stylesheet" href="<%=cssDir%>/product_upload2.css?after">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    main { font-family: 'Noto Sans KR', sans-serif; }
    section {
      margin-top: 20px;
    }
    .form-container { width:  65%; }
    form {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .product-info {
      display: flex;
      flex-direction: row;
      
    }
    .product-detail {
      padding: 35px;
      margin-left: 6%;
      display: flex;
      width: 80%;
      flex-direction: column;
      justify-content: center;
      position: relative;
      top: 15px;
    }

    .textarea {
      margin-top: 50px;
      padding: 10px;
    }
    .ck-editor__editable { min-height: 560px; }
    
    .submitBtn {
      display: flex;
      justify-content: center;
      margin-top: 50px;
      padding: 10px;
    }
    
    .submitBtn input[type=submit] {
      font-size: 1.3em; 
      width: 310px;
      height: 75px;
      position: relative;
    }
  </style>
  
</head>
<body>
<%@ include file="/header.jsp" %>

<main>
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link disabled">상품관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" aria-current="page" href="<%= dresserViewDir%>/product_upload.jsp">상품 등록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="./productRead.be">상품 조회</a>
    </li>
  </ul>

  <section>
    <form method="post" action="./productUpload.be" enctype="multipart/form-data">
      <div class="form-container">
        <!-- form container 추가 -->
        <div class="product-info">
          <div class="image-wrapper">
            <div class="box">
              <div class="js--image-preview"></div>
              <div class="upload-options">
                <label>
                  <input type="file" name="i_thumb" class="image-upload" accept="image/*" />
                </label>
              </div>
            </div>
          </div>

          <div class="product-detail">
            <div class="input-group mb-5">
              <span class="input-group-text">상품명</span>
              <input type="text" name="product_name" class="form-control" placeholder="상품명을 입력해주세요"
                      aria-label="Recipient's username" aria-describedby="basic-addon2" required>
            </div>
            <div class="input-group mb-5">
              <span class="input-group-text">상품 가격</span>
              <input type="text" name="product_price" class="form-control" aria-label="Amount (to the nearest dollar)" required>
              <span class="input-group-text">원(₩)</span>
            </div>

            <div class="input-group mb-5">
              <span class="input-group-text">재고 수량</span>
              <input type="number" name="product_stock" class="form-control" placeholder="재고 수량을 입력해주세요"
                aria-label="Recipient's username" aria-describedby="basic-addon2" required>
            </div>

                      
                      <div class="input-group mb-5">
                        <span class="input-group-text">상품 성별</span>
                        <select name="gender" class="form-select">
                          <option disabled selected>Gender</option>
                          <option value="Man">남</option>
                          <option value="Woman">여</option>
                          <option value="Pub">공통</option>
                        </select>
                      </div>
                      <div class="input-group mb-5">
                        <div class="input-group-text">상품 사이즈</div>
                        <select name="size" class="form-select">
                          <option disabled selected>Size</option>
                          <option value="100">100</option>
                          <option value="110">110</option>
                        </select>
                      </div>
                      <div class="input-group mb-5">
                        <span class="input-group-text">상품 색상</span>
                        <select name="color" class="form-select">
                          <option disabled selected>Color</option>
                          <option value="yellow">yellow</option>
                          <option value="red">red</option>
                        </select>
                      </div>
          </div> 
        </div>

        <div class="textarea">
          <textarea name="product_desc" id="editor" placeholder="플레이스홀더">
            
          </textarea>
        </div>  
        <div class="submitBtn">
          <input type="submit" value="상품 등록" class="btn btn-dark join">
        </div>
      </div>
    </form>
  </section>
</main>
<script type="text/javascript" src="<%=jsDir %>/image_upload.js"></script>

<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/super-build/ckeditor.js"></script>
<script src="<%=jsDir %>/editor2.js"></script>
</body>
</html>