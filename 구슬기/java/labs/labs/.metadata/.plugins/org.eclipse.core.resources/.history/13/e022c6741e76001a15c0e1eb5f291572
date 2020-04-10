import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex); //Vue랑 Vuex 연결, this.$store가 생김

//뮤테이션에 정의한 함수 변수로 빼질 수 있음(ES2015문법) //이렇게 많이함 //export를 써야 다른 파일에서 사용 가능
//만약 이걸 사용하지 않고 오타고 났으면 에러가 안떠서 찾기 힘든데 변수명이 오타가 나면 에러가 떠서 쉽게 수정 가능
export const SET_WINNER = 'SET_WINNER'; // import { SET_WINNER, CLICK_CELL, CHANGE_TURN } from './store';
export const CLICK_CELL = 'CLICK_CELL';
export const CHANGE_TURN = 'CHANGE_TURN';
export const RESET_GAME = 'RESET_GAME';
export const NO_WINNER = 'NO_WINNER';

export default new Vuex.Store({
    state: {
        tableData: [
            ['', '', ''],
            ['', '', ''],
            ['', '', ''],
        ],
        turn: 'O',
        winner: '',
    }, //vue의 data와 비슷
    getters: {
        turnMessage(state){
            return state.turn + '님이 승리하셨습니다.';
        },
    }, //vue의 computed와 비슷 , 기존의 데이터에 추가적인 작업을 할 때 사용
    mutations: {
        [SET_WINNER](state, winner) {
            state.winner = winner;
        },
        [CLICK_CELL](state, {row, cell}){ //Vuex에는 'this.$'가 없음
            Vue.set(state.tableData[row], cell, state.turn); 
        },
        [CHANGE_TURN](state){
            state.turn = state.turn === 'O' ? 'X' : 'O';
        },
        [RESET_GAME](state){
            state.turn = 'O';
            state.tableData = [
                ['','',''],
                ['','',''],
                ['','',''],
            ];
        },
        [NO_WINNER](state){
            state.winner = 'O';
            state.tableData = [
                ['','',''],
                ['','',''],
                ['','',''],
            ]
        }
    }, //state를 수정할 때 사용, 동기적으로 / 함수를 만들어 값을 바꿈(대문자로 짓는게 약속)
    actions: {

    }, //비동기를 사용할때, 또는 여러 뮤테이션을 연달아 실행할 때
});