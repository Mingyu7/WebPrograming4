<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팀원 소개</title>
    <style>
        /* 전체적인 레이아웃 및 폰트 설정 */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #6b7b8c, #8b9fa8);
            color: #333;
        }

        header {
            background-color: #333;
            color: white;
            padding: 40px 0;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 2.5rem;
            margin: 0;
        }

        /* 팀원 섹션 설정 */
        .team-section {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 50px 20px;
            flex-wrap: wrap;
            justify-content: space-evenly;
        }

        /* 팀원 카드 디자인 */
        .team-member {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 280px;
            text-align: center;
            padding: 30px 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .team-member:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .team-member img {
            width: 100%;
            height: 250px;
            border-radius: 50%;
            margin-bottom: 20px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .team-member img:hover {
            transform: scale(1.1);
        }

        .team-member h3 {
            font-size: 1.6rem;
            margin: 10px 0;
            color: #333;
        }

        .team-member p {
            color: #777;
            font-size: 1rem;
        }

        /* 푸터 디자인 */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px;
            position: relative;
            width: 100%;
            margin-top: 50px;
        }

        footer p {
            font-size: 1rem;
            margin: 0;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .team-section {
                flex-direction: column;
                align-items: center;
            }

            .team-member {
                width: 100%;
                max-width: 300px;
                margin-bottom: 30px;
            }

            header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>우리 팀원들을 소개합니다</h1>
    </header>

    <div class="team-section">
        <div class="team-member">
            <img src="team_member1.jpg" alt="팀원 1">
            <h3>홍길동</h3>
            <p>프론트엔드 개발자</p>
            <p>웹사이트 디자인 및 개발을 담당하고 있습니다. React와 JavaScript에 능숙합니다.</p>
        </div>

        <div class="team-member">
            <img src="team_member2.jpg" alt="팀원 2">
            <h3>김철수</h3>
            <p>백엔드 개발자</p>
            <p>서버 개발 및 데이터베이스 관리 전문가입니다. Python과 Node.js를 다룹니다.</p>
        </div>

        <div class="team-member">
            <img src="team_member3.jpg" alt="팀원 3">
            <h3>박영희</h3>
            <p>디자이너</p>
            <p>사용자 경험(UX) 및 인터페이스(UI) 디자인을 담당하고 있습니다. 디자인 툴을 자유자재로 다룹니다.</p>
        </div>
    </div>

    <footer>
        <p>© 2024 우리 팀</p>
    </footer>
</body>
</html>
