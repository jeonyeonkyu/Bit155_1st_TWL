//제일 중요한 파일, 여기서 다 import로 연결해줘야함
// package.json에 기록한 vue를 사용할끄다!!
import Vue from 'vue';
import ResponseCheck from './ResponseCheck.vue';


new Vue(ResponseCheck).$mount('#root');
//vue 인스턴스 생성

