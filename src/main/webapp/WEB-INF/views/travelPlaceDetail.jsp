<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.app.dto.TravelPlaceDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>${place.placeName} - 여행지 상세정보</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #fff7f0; }
        .container {
            max-width: 650px; margin: 40px auto; padding: 36px 32px;
            border-radius: 16px; box-shadow: 0 4px 24px #ee853f22;
            background: #fff; border: 2px solid #ff9752;
        }
        .title { color: #eb5e00; font-size: 2.3em; font-weight: bold; margin-bottom: 14px; }
        .desc { color: #333; margin-bottom: 20px; font-size: 1.08em; }
        .img-box {
            text-align: center; margin-bottom: 18px;
            background: #ff975212; border-radius: 12px; padding: 14px;
        }
        .img-box img {
            max-width: 100%; max-height: 320px; border-radius: 12px;
            border: 2px solid #ff9752;
        }
        .info { margin-bottom: 18px; }
        .info strong { color: #ee853f; }
        .btns { text-align: right; margin-top: 22px; }
        .btn {
            background: #ee853f; color: #fff; border: none;
            padding: 10px 24px; margin-left: 10px;
            border-radius: 8px; font-size: 1em; cursor: pointer;
            transition: background 0.18s;
        }
        .btn:hover { background: #eb5e00; }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">${place.placeName}</div>
        <div class="img-box">
           <%--  <img src="${place.placeImage}" alt="${place.placeName}  --%>"사진" 
             <%-- (사진 업로드/추가 구현시 이 위치에서 이미지 추가 처리 가능) --%>
                 onerror="this.src='/img/no_image.png'">
        </div>
        <div class="desc">${place.placeDesc}</div>
        <div class="info">
            <strong>위치:</strong> ${place.placeLat}, ${place.placeLng}
        </div>
        <div class="btns">
            <button class="btn" onclick="location.href='/map?placeId=${place.placeId}'">길찾기</button>
            <button class="btn" onclick="location.href='/events?placeId=${place.placeId}'">행사 보기</button>
        </div>
    </div>
</body>
</html>
