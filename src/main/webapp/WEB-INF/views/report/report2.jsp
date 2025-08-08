<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRACE</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body, h1, h2, h3, h4, p, ul, li {
            margin: 0;
            padding: 0;
            font-family: 'Noto Sans KR', sans-serif;
            color: #333;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
        }

        .container {
            max-width: 960px;
            margin: 0 auto;
            padding: 20px 0;
        }

        .content {
            padding: 40px 0;
        }
        
        .page-title-group {
            padding: 0 20px;
            margin-bottom: 10px;
        }
        .page-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 15px;
            font-weight: 400;
            margin-bottom: 5px;
            color: #777;
        }

        .page-title.main-title {
            font-size: 24px;
            font-weight: 700;
            color: #333;
        }
        .page-title .icon {
            width: 14px;
            height: 14px;
            background-color: #999;
            border-radius: 50%;
        }
        
        .my-page-new-request {
            padding: 0 20px;
        }
        .my-page-new-request .sub-header h2 {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .my-page-new-request .sub-header p {
            font-size: 14px;
            color: #666;
        }
        .form-section {
            margin-bottom: 30px;
        }
        .form-section-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
        .form-section-title h3 {
            font-size: 18px;
            font-weight: 700;
        }
        .form-section-title .button-link {
            font-size: 14px;
            color: #666;
            text-decoration: underline;
        }
        .form-section input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .form-section textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            resize: none;
            box-sizing: border-box;
        }
        .form-section p.description {
            font-size: 13px;
            color: #999;
            margin-top: 5px;
            line-height: 1.5;
        }
        .file-upload-box {
            border: 1px solid #e0e0e0;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
        }
        .file-upload-box p {
            font-size: 14px;
            color: #666;
        }
        .file-upload-box p.file-info {
            font-weight: 700;
        }
        .file-upload-box a {
            color: #333;
            text-decoration: underline;
            font-weight: 700;
        }
        .file-upload-box .file-btn {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            margin-right: 10px;
        }
        .file-upload-box .file-list {
            font-size: 13px;
            color: #999;
            margin-top: 10px;
            padding-left: 10px;
        }
        .file-caution {
            margin-top: 20px;
            padding: 15px;
            background-color: #f5f5f5;
            border-radius: 5px;
        }
        .file-caution h4 {
            font-size: 15px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .file-caution ul {
            list-style-type: '※ ';
            padding-left: 20px;
        }
        .file-caution li {
            font-size: 13px;
            color: #666;
            margin-bottom: 5px;
        }
        .file-caution li .highlight {
            color: #eb5e00;
            font-weight: 700;
        }
        .form-footer {
            margin-top: 40px;
            text-align: center;
        }
        .form-footer .btn-group {
            display: inline-block;
            gap: 10px;
        }
        .form-footer .btn-group .btn {
            padding: 10px 30px;
            font-size: 16px;
            font-weight: 700;
            border-radius: 5px;
            cursor: pointer;
            border: none;
        }
        .form-footer .btn-group .btn-cancel {
            background-color: #fff;
            color: #666;
            border: 1px solid #ccc;
        }
        .form-footer .btn-group .btn-submit {
            background-color: #333;
            color: #fff;
        }
        .form-footer .btn-group .btn-submit[disabled] {
            background-color: #ccc;
            cursor: not-allowed;
        }
        .term-of-service {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            font-size: 13px;
            color: #666;
            margin-top: 15px;
        }
        .term-of-service input[type="checkbox"] {
            margin-right: 5px;
        }
        .term-of-service a {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="../travelDestination/tdHeader.jsp"%>
    
    <div class="container">
        <div class="content">
            <div class="page-title-group">
                <h1 class="page-title">
                </h1>
                <h2 class="page-title main-title">
                    관광정보 신규요청
                </h2>
                <p class="page-title-description">
                    TRACE에서 제공되지 않는 새로운 여행정보를 요청해주세요.
                </p>
            </div>
            
            <div class="my-page-new-request">
                <div class="form-section">
                    <div class="form-section-title">
                        <h3>제목 (관광지/업소명 등)</h3>
                        <a href="#" class="button-link">정보제공양식 다운로드 (엑셀 파일)</a>
                    </div>
                    <input type="text" id="title-input" placeholder="관광지,업소명 등을 기입해주세요">
                </div>

                <div class="form-section">
                    <div class="form-section-title">
                        <h3>상세내용</h3>
                    </div>
                    <textarea id="content-textarea" placeholder="TRACE에 소개되고 있지 않은 관광지의 정보를 제보해주세요.
(위 정보제공양식에 맞춰 작성 후 파일첨부 해주시면 확인 후 순차적으로 등록될 예정입니다.)"></textarea>
                </div>

                <div class="form-section">
                    <div class="form-section-title">
                        <h3>정보제공양식 / 사진 첨부</h3>
                    </div>
                    <div class="file-upload-box">
                        <input type="file" id="file-input" multiple style="display: none;">
                        
                        <p id="file-info" class="file-info">파일첨부는 최대 6개까지 가능하며, 다수의 파일 첨부 시 압축하여 업로드해주세요.</p>
                        <button class="file-btn" onclick="document.getElementById('file-input').click();">파일첨부</button>
                        
                        <div id="file-list" class="file-list"></div>
                    </div>
                    <div class="file-caution">
                        <h4>[사진 파일 첨부 시 유의사항]</h4>
                        <ul>
                            <li>사진활용에 저작권 문제가 없는 사진만 첨부 부탁드립니다.</li>
                            <li>상표권 및 초상권에 문제가 없는 직접 촬영한 사진만을 등록 부탁드립니다. (인물, 얼굴 노출 삼가)</li>
                            <li>사진 파일은 최소 5장 이상 등록해 주셔야 하며, 총 200mb 이하로 등록 가능합니다. (파일형식 jpg, gif, png, bmp, zip, xls, xlsx)</li>
                            <li>PC사양 및 첨부파일의 용량에 따라 업로드 시간이 다소 소요될 수 있습니다.</li>
                            <li>기존에 등록된 관광정보 사진의 변경요청은 각 관광정보 하단의 '관광정보 수정/신규 요청'을 통해 요청 바랍니다.</li>
                            <li>※ 사진의 사이즈는 긴 변 기준 940px 이상의 사진만 사용 가능합니다.</li>
                            <li>※ 다수의 파일을 첨부할 경우 압축하여 첨부해주세요.</li>
                        </ul>
                    </div>
                </div>

                <div class="term-of-service">
                    <input type="checkbox" id="agree-terms">
                    <label for="agree-terms">저작권 보존 및 제공에 동의합니다.</label>
                    <a href="#">약관보기</a>
                </div>

                <div class="form-footer">
                    <div class="btn-group">
                        <button class="btn btn-cancel">취소</button>
                        <button type="button" class="btn btn-submit" id="submit-btn" disabled>등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('file-input').addEventListener('change', function() {
            const fileListContainer = document.getElementById('file-list');
            fileListContainer.innerHTML = '';
            
            const files = this.files;
            if (files.length > 0) {
                for (let i = 0; i < files.length; i++) {
                    const fileName = document.createElement('div');
                    fileName.textContent = files[i].name;
                    fileListContainer.appendChild(fileName);
                }
            }
        });

        document.getElementById('submit-btn').addEventListener('click', function() {
            const agreeCheckbox = document.getElementById('agree-terms');
            const titleInput = document.getElementById('title-input');
            const contentTextarea = document.getElementById('content-textarea');

            if (!agreeCheckbox.checked) {
                alert('약관에 동의해야 등록할 수 있습니다.');
                return;
            }

            if (!titleInput.value.trim() || !contentTextarea.value.trim()) {
                alert('제목과 상세내용을 모두 입력해주세요.');
                return;
            }

            const title = titleInput.value.trim();
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const day = String(now.getDate()).padStart(2, '0');
            const 접수일자 = year + '-' + month + '-' + day;

            // JSP EL 충돌을 피하기 위해 일반 문자열 연결로 변경
            document.cookie = 'lastSubmissionTitle=' + encodeURIComponent(title) + '; path=/;';
            document.cookie = 'lastSubmissionDate=' + encodeURIComponent(접수일자) + '; path=/;';

            alert('관광정보 신청 접수가 완료되었습니다.');
            window.location.href = '/reportMain';
        });

        const agreeCheckbox = document.getElementById('agree-terms');
        const submitBtn = document.getElementById('submit-btn');
        
        window.addEventListener('load', function() {
            submitBtn.disabled = !agreeCheckbox.checked;
        });

        agreeCheckbox.addEventListener('change', function() {
            submitBtn.disabled = !this.checked;
        });
    </script>
</body>
</html>