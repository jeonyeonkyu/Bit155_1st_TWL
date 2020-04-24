<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<head>
    <meta charset="UTF-8">
    <title>구슬기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트 스트랩 css 추가하기-->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css">
</head>


    <div id="home"/><!-- navbar 에서 #career 와 section 의 아이디값이 일치해서 이동함-->
  <jsp:include page="top.jsp"></jsp:include>
    <section class="container mt-5">
        <div class="text-center">                   <!-- mb-3 아래쪽  mt-3 위쪽 여백-->
            <img src="./img/슬기.png" class="img-fluid mb-3  rounded-pill" style="margin-top: 70px;">
            <h3 style="font-family:Carrois Gothic SC; margin: 20px">구슬기
                <!-- <h5>유난히 내성적이었던..</h5> -->
            </h3>
            <img src="./img/heartt.svg" class="img-fluid mr-1" style="width: 25px; height: 25px;"> 유난히 내성적이었던...
            <br>
            <img src="./img/heartt.svg" class="img-fluid mr-1" id="career"  style="width: 25px; height: 25px;"> 오설록 제주 동백꽃 티 
            <!-- <br>
            <img src="./img/arrow.svg" class="img-fluid mr-1" id="career" style="width: 50px; height: 50px;" >  -->
        </div>

    </section>
    <section  class="bg-white text-dark mt-5 mb-3 pt-5 pb-4">
        <div class="text-center">
            <div class="container text-left mb-5" style="max-width: 600px;">
                <h4 style="font-family:Carrois Gothic SC">  연주 경력 </h4>
                <ul>
                    <li>WOODWIND QUINTET THE "K" 예술의 전당 리사이틀 홀 </li>
                    <li>R.Schumann concert piece for Four Horns 압구정 장천아트홀</li>
                    <li>CUVRES Ensemble 호른 협연 가천대학교 예음관 예음홀</li>
                    <li>Mu : 人 Clarinet Ensemble 성남아트센터 앙상블시어터</li>
                </ul>
                
            </div>
        </div>
        <div class="text-center">
            <div class="container text-left mb-5" style="max-width: 600px;">
                <h4 style="font-family:Carrois Gothic SC">  개발자로서의 능력 </h4>
                <div class="container my-4">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 50%"
                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">55%</div>
                        
                    </div>
                    <div class="container my-4">조금씩 늘어가고 있습니다...</div>
                </div>
                
            </div>
        </div>
    </section>

    <section id="portfolio" class="mb-3 pt-4 pb-5">
        <div class="text-center">
            <h4 style="margin-bottom: 70px;">Horn</h4>
        </div>
            <div class="container mt-3" style="max-width: 1000px;">
                <div class="card-deck" >
                    <div class="card">
                        <img class="card-img-top" src="./img/성남.jpg">
                        <div class="card-body" >
                            <h4 class="card-title" >Mu : 人 Clarinet Ensemble</h4>
                            <!-- <p class="card-text" style="text-align: justify">
                              클라 앙상블
                            </p> -->
                        </div>
                    </div>
                    
                    <div class="card">
                        <img class="card-img-top" src="./img/예당.jpg">
                        <div class="card-body">
                            <h4 class="card-title">WOODWIND QUINTET THE "K"</h4>
                            <!-- <p class="card-text" style="text-align: justify">
                                클라리넷 앙상블 팀과 협연했던 사진입니다.
                            </p> -->
                        </div>
                    </div>
                </div><!-- 여기까지 한 세트-->
            <hr >
            <div class="card-deck mx-5"  >
                <div class="card">
                    <div id="carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel" data-slide-to="1"></li>
                            <li data-target="#carousel" data-slide-to="2"></li>
                            <li data-target="#carousel" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100 h-100" src="./img/예당2.jpg" alt="첫 번째 이미지">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 h-100" src="./img/협연.jpg" alt="두 번째 이미지" >
                            </div>
                            <div class="carousel-item ">
                                <img class="d-block w-100 h-100" src="./img/슈만.jpg" alt="세 번째 이미지">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 h-100" src="./img/슈만4.jpg" alt="네 번째 이미지">
                            </div>
                        </div>
                        <!-- 단추 -->
                        <a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </div>
                </div>
            </div><!-- 여기까지 한 세트-->
            <hr>
            <div class="card-deck mx-5"  >
                <div class="card">
                    <div id="carousel2" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel2" data-slide-to="0" ></li>
                            <li data-target="#carousel2" data-slide-to="1" class="active"></li>
                            <li data-target="#carousel2" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="./img/졸연흑백1.jpg" alt="첫 번째 이미지">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="./img/졸연흑백2.jpg" alt="두 번째 이미지">
                            </div>
                            <div class="carousel-item ">
                                <img class="d-block w-100" src="./img/졸연1.jpg" alt="세 번째 이미지">
                            </div>
                        </div>
                        <!-- 단추 -->
                        <a class="carousel-control-prev" href="#carousel2" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel2" role="button" data-slide="next" >
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </div>
                </div>
            </div><!-- 여기까지 한 세트-->
        </div>
    </section><!--사진들 끝-->

    
    <section class="bg-white text-dark  mx-5">
    </section>
    
    
    <section  class="bg-white text-dark mt-5 pt-5 pb-4" id="like">
        <h4  style= "text-align: center; margin-bottom: 50px; margin-top: 50px;"> Favorite </h4>
        <div class="text-center">
            <div class="container text-left mb-5" style="max-width: 600px;">
                <div class="row">
                    <div class="col-5">
                        <div class="list-group">
                            <a class="list-group-item list-group-item-action active" data-toggle="list" href="#list-java">좋아하는 활동</a>
                            <a class="list-group-item list-group-item-action " data-toggle="list" href="#list-cpp">좋아하는 음악</a>
                            <a class="list-group-item list-group-item-action " data-toggle="list" href="#list-python">좋아하는 미드</a>
                            <a class="list-group-item list-group-item-action " data-toggle="list" href="#list-html">스트레스 해소</a>
                            <a class="list-group-item list-group-item-action " data-toggle="list" href="#list-seulki">내가 그린 그림</a>
                        </div>
                    </div>
                    <div class="col-7">
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="list-java">
                                <img class="d-block w-100" src="./img/나4.jpg" alt="첫 번째 이미지">
                                
                            </div>
                            <div class="tab-pane fade" id="list-cpp">
                                <!-- show 를 빼서 처음부터 보이지 않게 해준다.-->
                                <img class="d-block w-100" src="./img/마리.jpg" alt="첫 번째 이미지">
                                
                            </div>
                            <div class="tab-pane fade" id="list-python">
                                <img class="d-block w-100" src="./img/굿플.jpg" alt="첫 번째 이미지">
                                
                            </div>
                            <div class="tab-pane fade" id="list-html">
                                <img class="d-block w-100" src="./img/000.jpg" alt="첫 번째 이미지">
                                
                            </div>
                            <div class="tab-pane fade" id="list-seulki" >
                                <img class="d-block w-100" src="./img/그림5.jpg" alt="첫 번째 이미지">
                                
                            </div>
                            <div ></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </section>
 
    <!--연락처 -->
    <section  class="bg-white">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <!--반반씩 하나의 행 차지하도록해줌-->
                    <h4 class="mt-5 " style="font-family:Carrois Gothic SC ; text-align: center;">Info</h4>
                    <div class="d-flex flex-row">
                        <div class="p-3 align-self-start"></div>
                        <img src="./img/happy.svg" style="width: 50px; height: 50px;">
                        <div class="p-3 align-self-end" style="text-align: justify;">
                            낯을 좀 가리지만 잘 웃는다
                        </div>
                    </div>
                    <div class="d-flex flex-row">
                        <div class="p-3 align-self-start"></div>
                        <img src="./img/st.svg" style="width: 50px; height: 50px;">
                        <div class="p-3 align-self-end" style="text-align: justify;">
                            스트레스 받으면 피아노 치거나, 음악듣는다
                        </div>
                    </div>
                    <div class="d-flex flex-row">
                        <div class="p-3 align-self-start"></div>
                        <img src="./img/zz.svg" style="width: 50px; height: 50px;">
                        <div class="p-3 align-self-end" style="text-align: justify;">
                            잠자는것도 좋아
                        </div>
                    </div>
                    <div class="d-flex flex-row">
                        <div class="p-3 align-self-start"></div>
                        <img src="./img/in-love.svg" style="width: 50px; height: 50px;">
                        <div class="p-3 align-self-end" style="text-align: justify;">
                            새우 좋아한다
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card text-center card-form mt-5 mb-4">
                        <div class="card-body center">
                            <h4>Click</h4>
                            <form>
                                <div class="footer-col col-md-4 mb-2 "  style=" margin:auto  ;">
                                    <!-- <h3 style="color: black;">Click</h3> -->
                                    <a href="https://youtu.be/97_VJve7UVc" class="btn btn-warning m-2 ">피아노곡</a>  
                                    <a href="https://youtu.be/wbT9DeULzU4" class="btn btn-primary m-2 ">피아노곡</a>
                                    <a href="https://youtu.be/kxqn8FAVbpU?list=RDkxqn8FAVbpU" class="btn btn-danger m-2">팝송</a>
                                    <a href="https://youtu.be/oiSnB1D4gq8" class="btn btn-success m-2">내 연주</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section  class="bg-white; align-self-sm-auto">
        <div class="container" style="margin-bottom: 25px; margin-top: 40px;">
            <div class="row">
                <div class="col-lg-2 "></div>
                <div class="col-lg-4 ">
            <iframe width="700" height="394" src="https://www.youtube.com/embed/pT9mCa_5C4A?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="col-lg-6 "></div>
            </div>
        </div>    
    </section>


    <jsp:include page="footer.jsp"></jsp:include>




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



</body>
</html>