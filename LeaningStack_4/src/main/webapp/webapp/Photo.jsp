<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다중 사진 포토 갤러리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .gallery-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            padding: 20px;
            justify-content: center;
            background-color: #f9f9f9;
        }
        .gallery-item {
            width: 200px;
            height: 150px;
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            cursor: pointer;
        }
        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
        }
        .gallery-item:hover img {
            transform: scale(1.1);
        }
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .modal img {
            max-width: 90%;
            max-height: 90%;
            border-radius: 10px;
        }
        .modal.show {
            display: flex;
        }
    </style>
    <script>
        function openModal(src) {
            const modal = document.getElementById('photoModal');
            const modalImg = document.getElementById('modalImage');
            modalImg.src = src;
            modal.classList.add('show');
        }

        function closeModal() {
            const modal = document.getElementById('photoModal');
            modal.classList.remove('show');
        }
    </script>
</head>
<body>

<div class="gallery-container">
    <!-- 여러 사진을 동적으로 출력 -->
    <c:forEach var="image" items="${imageList}">
        <div class="gallery-item" onclick="openModal('${image}')">
            <img src="${image}" alt="사진">
        </div>
    </c:forEach>
</div>

<!-- 모달 -->
<div class="modal" id="photoModal" onclick="closeModal()">
    <img id="modalImage" alt="확대된 사진">
</div>

</body>
</html>
