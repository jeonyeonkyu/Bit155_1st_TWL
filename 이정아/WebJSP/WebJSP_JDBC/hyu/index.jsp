<!doctype html>

<head>
    <title>이정아</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width =device-width, initial-scale=1, shrink-to-fit=no">
    <!--부트스트랩 CSS추가하기-->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!--커스텀 css 추가-->
    <link rel="stylesheet" href="./css/custom.css">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

    <section id="introduce" class="container mt-5">
        <div class="text-center">
            <img src="./images/IMG_5041.jpg" class="img-fluid rounded-circle mb-3">
            <h3>이정아</h3>
            <img src="./images/coffee.svg" class="img-fluid mr-1 ml-3">커피
            <img src="./images/home.svg" class="img-fluid mr-1 ml-3">집순이
            <img src="./images/icon.png" class="img-fluid mr-1 ml-3">후추주인
        </div>
    </section>
    <section class="bg-white text-dark mt-5 mb-3 pt-5 pb-4">
        <div class="text-center">
            <div class="container text-left mb-5" style="max-width: 480px;">
                <h2 class="text-center">
                    <img src="./images/sun.svg" class="img-fluid mr-2">간단한 자기소개
                    <img src="./images/sun.svg" class="img-fluid mr-2">
                </h2>
                <hr>
                <ul>
                    <li>경기도 안산시 출생 29년째 안산 거주 중</li>
                    <li>현재 비트캠프 [155기] 수강 중</li>
                    <li>가장 좋아 하는 일은 누워있기 / 후추랑 산책하기</li>
                </ul>
            </div>
            </div>
    </section>
    <section id="news" class="mb-3 pt-4 pb-5">
        <div class="text-center">
            <h2><img class="mr-2" src="./images/anchor.svg">비트캠프에 오기까지의 여정
                <img class="ml-1" src="./images/anchor.svg">
            </h2>
            <hr style="max-width: 480px;">
        </div>
        <div class="container mt-3" style="max-width: 920px;">
            <div class="card-deck">
                <div class="card">
                    <img class="card-img-top" src="./images/01.jpg">
                    <div class="card-body">
                        <h4 class="card-title">도쿄생활 (2013~2015)</h4>
                        <hr>
                        <p class="card-text" style="text-align: justify;">
                            약 1년 반 동안 워킹홀리데이로 도쿄에 있었습니다!
                            일본어 공부를 하면서 이탈리안 레스토랑에서 일을 했었습니다!<br></p>
                        <p>좋은 친구들도 많이 사귈 수 있었고, 한국으로 돌아와서 통번역 일을 시작하게 되었던 계기가 되었습니다.</p>
                    </div>
                </div>
                <hr>
                <div class="card">
                    <img class="card-img-top" src="./images/IMG_6929.png">
                    <div class="card-body">
                        <h4 class="card-title">롯데시네마 드리미 (2016~2017)</h4>
                        <hr>
                        <p class="card-text" style="text-align: justify;">
                            롯데시네마에서 드리미로 활약하기도 했습니다! 같이 일했던 친구들이랑 간 후쿠오카 여행사진이에요!</p>
                    </div>
                </div>
                <hr>
                <div class="card">
                    <img class="card-img-top" src="./images/huchu2.jpg"></img>
                    <div class="card-body">
                        <h4 class="card-title">후추 입양 (2019~ ing)</h4>
                        <hr>
                        <p class="card-text" style="text-align: justify;">새 식구로 후추를 맞이했답니다~
                            우리집 재간둥이~~~</p>
                    </div>
                </div>
            </div>
            </div>
    </section>
    <section id= "contact" class="bg-white">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h2 class="mt-5">My Social Networks</h2>
                    <hr>
                    <div class="d-flex flex-row">
                        <div class="p-3 align-self-auto-start">
                            <a
                                href="https://www.notion.so/155e42e6faf44bc8b52dce07198ae7a6?v=911d23b18ac841868ab48bd167ee2187">
                                <img src="./images/notion.png"></a>
                        </div>
                        <div class="p-3 align-self-end" style="text-align: justify;">
                            매일 수업내용 정리해두니 필요하신 분은 참고!
                        </div>
                    </div>
                    <div class="d-flex flex-row">
                        <div class="p-3 align-self-auto-start">
                            <a href="https://www.instagram.com/2_jung_ah/">
                                <img class="mr-2" src="./images/instagram.svg"></a>
                        </div>
                        <div class="p-3 align-self-end" style="text-align: justify;">
                            비공개이니 팔로우 요청 먼저해주세요!
                        </div>
                    </div>
                    <div class="d-flex flex-row">
                        <div class="p-3 align-self-auto-start">
                            <a href="https://github.com/junga710/myWeb"> <img src="./images/github.svg"></a>
                        </div>
                        <div class="p-3 align-self-end" style="text-align: justify;">
                            차차 업데이트 중...
                        </div>
                    </div>
                </div>
                <!--전체 12 중 6 할당-->
                <div class="col-lg-6">
                    <div class="card text-center card-form mt-4 mb-4">
                        <div class="card-body">
                            <h2>더 궁금한 사항이 있으시다면?</h2>
                            <hr>
                            <form>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-lg" placeholder="이름">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-lg" placeholder="이메일">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-lg" placeholder="연락처">
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control form-control-lg" placeholder="내용을 입력하세요"></textarea>
                                </div>
                                <button type="submit" class="btn btn-warning">전송</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </section>


<jsp:include page="bottom.jsp"></jsp:include>
    
    
</body>
</html>

