import Vue from 'vue';
import VueRouter from 'vue-router';
import NumberBaseball from '../3.웹팩/NumberBaseball';
import ResponseCheck from '../4.반응속도체크/ResponseCheck';
import RockScissorsPaper from '../5.가위바위보/RockScissorPaper';
import LottoGenerator from '../6.로또 추첨기/LottoGenerator';
import GameMatcher from './GameMatcher';

Vue.use(VueRouter);

export default new VueRouter({
    mode: 'history',
    routes: [
        { path: '/number-baseball', component: NumberBaseball },
        { path: '/response-check', component: ResponseCheck },
        { path: '/rock-scissors-paper', component: RockScissorsPaper },
        { path: '/lotto-generator', component: LottoGenerator },
        { path: '/game/:name', component: GameMatcher } // 다이나믹 라우터 매칭   /game/number-baseball, /game/response-check 등..
    ],
});