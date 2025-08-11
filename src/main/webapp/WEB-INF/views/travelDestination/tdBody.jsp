<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>여행지 페이지</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            background: #fff;
            color: #222;
        }
        .container {
            display: flex;
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
            gap: 30px;
            box-sizing: border-box;
        }
        .left-panel { flex: 1 1 0; }
        /* 아래 부분이 리디자인된 header-container */
        .header-container {
            background: #fff;
            padding: 26px 0 0 0;
            margin-bottom: 48px;
            border-radius: 0;
            box-shadow: none;
            border-bottom: 1.5px solid #ebebeb;
        }
        .header-title-wrap {
            display: flex;
            align-items: center;
            gap: 7px;
            margin-bottom: 7px;
        }
        .header-title {
            font-size: 20px;
            color: #565656;
            font-weight: 500;
            letter-spacing: -0.5px;
        }
        .page-title {
            font-weight: 900;
            font-size: 36px;
            color: #232323;
            margin-bottom: 17px;
            letter-spacing: -1.2px;
        }
        .header-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0px 10px 10px 10px;
            font-size: 16px;
        }
        .total-count {
            color: #252b38;
            font-size: 16px;
            font-weight: 400;
            margin-right: 20px;
        }
        .total-number {
            color: #2196f3;
            font-size: 18px;
            font-weight: 700;
            margin-left: 2px;
            margin-right: 2px;
            letter-spacing: -0.5px;
        }
        .sort-options {
            font-size: 15px;
            display: flex;
            align-items: center;
            gap: 0;
            color: #888;
            font-weight: 400;
        }
        .sort-options span {
            cursor: pointer;
            color: #222;
            font-weight: 400;
            padding: 0 0 0 0;
            margin-right: 0;
            position: relative;
            font-size: 15px;
        }
        .sort-options span:not(:last-child) {
            margin-right: 18px;
        }
        .sort-options span:not(:last-child)::after {
            content: '';
            display: inline-block;
            width: 1px;
            height: 14px;
            background: #888;
            margin-left: 16px;
            margin-right: 0;
            vertical-align: middle;
            position: relative;
            top: 1px;
        }
        .sort-options .active {
            font-weight: 700;
            text-decoration: underline;
            color: #111;
        }
        /* 이하 기존 코드 그대로 */
        .travel-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .travel-item {
            display: flex;
            gap: 20px;
            margin-bottom: 24px;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }
        .travel-item img {
            width: 140px;
            height: 90px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }
        .travel-item img:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        .travel-info { flex: 1; }
        .travel-title {
            font-weight: 700;
            font-size: 18px;
            margin-bottom: 6px;
        }
        .travel-location {
            font-size: 12px;
            color: #666;
            margin-bottom: 6px;
        }
        .travel-desc {
            font-size: 13px;
            color: #444;
            margin-bottom: 8px;
            line-height: 1.3;
            max-height: 52px;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .hashtags {
            font-size: 12px;
            color: #555;
        }
        .hashtags span {
            margin-right: 8px;
        }
        .right-panel {
            width: 280px;
            height: 250px;
            border: 2px solid #f7d49c;
            border-radius: 8px;
            padding: 16px 20px;
            font-size: 14px;
            color: #444;
            line-height: 1.5;
            margin-top:132px;
        }
        .tag-group {
            margin-bottom: 20px;
        }
        .tag-group h4 {
            font-weight: 700;
            margin-bottom: 8px;
        }
        .tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px 12px;
        }
        .tags span {
            cursor: pointer;
            padding: 4px 10px;
            border-radius: 14px;
            background: #f6f6f6;
            color: #666;
            user-select: none;
            transition: background-color 0.3s, color 0.3s;
        }
        .tags span.active,
        .tags span:hover {
            background: #ee853f;
            color: white;
        }
        .pagination {
    text-align: center;
    margin: 30px 0;
}

.pagination a {
    display: inline-block;
    padding: 6px 12px;
    margin: 0 2px;
    border-radius: 6px;
    text-decoration: none;
    color: #333;
    background: #f0f0f0;
    font-size: 14px;
    transition: background 0.2s, color 0.2s;
}

.pagination a:hover {
    background: #ddd;
}

.pagination a.active {
    background: #2196f3;
    color: #fff;
    font-weight: bold;
}
    </style>
</head>
<body>
<div class="container">
    <!-- 좌측 리스트 -->
    <section class="left-panel">
        <div class="header-container">
            <div class="header-title-wrap">
                <span class="header-title">여행지</span>
            </div>
            <div class="page-title">
                <span>#</span>
                <span>
                <c:choose>
				    <c:when test="${empty tag}">
				        전체
				    </c:when>
				    <c:otherwise>
				        ${tag}
				    </c:otherwise>
				</c:choose>
                </span>
            </div>
            <hr>
            <div class="header-bottom">
                <span class="total-count">
                    총 <span class="total-number"><c:out value="${fn:length(travelList)}" /></span>건
                </span>
                <div class="sort-options">
                    <span class="sortAction" onClick="addSort('recent')">최신순</span>
                    <span class="sortAction" onClick="addSort('popularity')">인기순</span>
                </div>
            </div>
        </div>
        <ul class="travel-list">
            <c:forEach var="travel" items="${travelList}">
                <li class="travel-item">
                	<a href="/travelDestination/${travel.id}">
                    	<img src="${travel.image}" alt="${travel.name}"/>
                    </a>
                    <div class="travel-info">
                        <div class="travel-title">${travel.name}</div>
                        <div class="travel-location">${travel.sumup}</div>
                        <div class="travel-desc">${travel.descride}</div>
                    </div>
                </li>
            </c:forEach>
        </ul>

			<div class="pagination">
				<c:if test="${totalPages > 1}">
					<c:forEach begin="1" end="${totalPages}" var="pageNum">
						<a href="?page=${pageNum}&sort=${sort}&tag=${tag}"
							class="${pageNum == currentPage ? 'active' : ''}"> ${pageNum}
						</a>
					</c:forEach>
				</c:if>
			</div>
			
			<div class="pagination">
    <a href="?page=1" class="${currentPage == 1 ? 'active' : ''}">1</a>
    <a href="?page=2" class="${currentPage == 2 ? 'active' : ''}">2</a>
    <a href="?page=3" class="${currentPage == 3 ? 'active' : ''}">3</a>
    <a href="?page=4" class="${currentPage == 4 ? 'active' : ''}">4</a>
</div>
		</section>
		
		
    <!-- 우측 필터/태그 -->
    <aside class="right-panel">
        <div class="tag-group">
            <h4>테마별</h4>
            <div class="tags">
            	<span onClick="location.href='/travelDestination?sort=recent'">#전체</span>
                <span onClick="addTag('제주시')">#제주시</span>
                <span onClick="addTag('서귀포시')">#서귀포시</span>
                <span onClick="addTag('핫플')">#핫플</span>
                <span onClick="addTag('맛집')">#맛집</span>
                <span onClick="addTag('숙소')">#숙소</span>
                <span onClick="addTag('호텔')">#호텔</span>
                <span onClick="addTag('가볼만한곳')">#가볼만한곳</span>
                <span onClick="addTag('실내여행지')">#실내여행지</span>
                <span onClick="addTag('이색체험')">#이색체험</span>
                <span onClick="addTag('음식')">#음식</span>
                <span onClick="addTag('쇼핑')">#쇼핑</span>
                <span onClick="addTag('트레킹')">#트레킹</span>
                <span onClick="addTag('드라이브코스')">#드라이브코스</span>
                <span onClick="addTag('제주여행')">#제주여행</span>
            </div>
        </div>
    </aside>
</div>
<script>
//태그 활성화
document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const selectedTag = urlParams.get('tag');
    const tags = document.querySelectorAll('.tags span');
    tags.forEach(tagEl => {
        // #전체는 tag 파라미터 없을 때 active
        if (!selectedTag && tagEl.textContent === '#전체') {
            tagEl.classList.add('active');
        } else if (selectedTag && tagEl.textContent === '#' + selectedTag) {
            tagEl.classList.add('active');
        }
    });
});
//sort 활성화
document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const selectedSort = urlParams.get('sort');
    const sorts = document.querySelectorAll('.sortAction');
    sorts.forEach(sortEl => {
    	if (selectedSort === 'recent' && sortEl.textContent.trim().includes('최신순')) {
    	    sortEl.classList.add('active');
    	} else if (selectedSort === 'popularity' && sortEl.textContent.trim().includes('인기순')) {
    	    sortEl.classList.add('active');
    	}
    });
});

//주소창 tag 추가
function addTag(tagValue) {
    const url = new URL(window.location.href); 
    url.searchParams.set('tag', tagValue);     
    window.location.href = url.toString();     
}
//주소창 sort 추가
function addSort(sortValue) {
    const url = new URL(window.location.href); 
    url.searchParams.set('sort', sortValue);     
    window.location.href = url.toString();   
}
</script>
</body>
</html>