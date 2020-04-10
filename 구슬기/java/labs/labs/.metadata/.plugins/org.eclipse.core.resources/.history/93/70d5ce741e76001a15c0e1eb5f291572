<template>
    <div>  
        <div>
            <!-- 레이아웃 부분(예를 들어 메뉴바) -->
            <!-- to는 a태그로 바뀜, 다른 컴포넌트를 불러오는 개념 -->
            <router-link to="/game/index">게임매쳐</router-link>
            <router-link to="/game/number-baseball?pages=3&offset=10&limit=1&sort=createdAt">숫자야구</router-link>
            <router-link to="/game/response-check">반응속도</router-link>
            <router-link to="/game/rock-scissors-paper">가위바위보</router-link>
            <router-link to="/game/lotto-generator">로또생성기</router-link>
        </div>
        <!-- 바뀌는 화면이라 이름을 router-view로 설정 / 바귀는 화면이 렌더링 됨-->
        <router-view></router-view> 
    </div>
</template>

<script>
import router from './routes';
    export default {
       router,
    };
</script>

<style>
    table{
        border-collapse: collapse;
    }
    td {
        border: 1px solid black;
        width: 40px;
        height: 40px;
        text-align: center;
    }
</style>
