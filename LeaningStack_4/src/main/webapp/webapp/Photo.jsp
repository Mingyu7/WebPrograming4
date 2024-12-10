<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>간단한 포토 갤러리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        h1, h2 {
            text-align: center;
            color: #333;
        }
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            padding: 20px;
        }
        .gallery-item {
            width: 200px;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .gallery-item:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }
        .gallery-item img {
            width: 100%;
            height: auto;
            display: block;
        }
        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        label {
            font-size: 16px;
            color: #555;
        }
        input[type="file"] {
            display: block;
            margin: 10px 0;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>포토 갤러리</h1>
    <div class="gallery">
        <div class="gallery-item">
            <img src="photo/2.jpg" alt="Image 1">
        </div>
        <div class="gallery-item">
            <img src="photo/3.jpg" alt="Image 2">
        </div>
        <div class="gallery-item">
            <img src="photo/4.jpg" alt="Image 3">
        </div>
        <div class="gallery-item">
            <img src="photo/5.jpg" alt="Image 4">
        </div>
    </div>
    <h2>이미지 업로드</h2>
    <form action="uploadImage.jsp" method="post" enctype="multipart/form-data">
        <label for="file">이미지 파일 선택:</label>
        <input type="file" name="file" id="file" accept="image/*" required>
        <br>
        <input type="submit" value="업로드">
    </form>
</body>
</html>
