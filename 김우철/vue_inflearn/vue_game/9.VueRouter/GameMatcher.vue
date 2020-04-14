<template>
    <div v-if="currentGame === 'number-baseball'">
        <number-baseball>></number-baseball>
    </div>
    <div v-else-if="currentGame === 'response-check'">
        <response-check></response-check>
    </div>
    <div v-else-if="currentGame === 'rock-scissors-paper'">
        <lotto-generator></lotto-generator>
    </div>
    <div v-else>일치하는 게임이 없습니다.</div>
</template>

<script>
import NumberBaseball from '../3.웹팩/NumberBaseball';
import ResponseCheck from '../4.반응속도체크/ResponseCheck';
import RockScissorsPaper from '../5.가위바위보/RockScissorPaper';
import LottoGenerator from '../6.로또 추첨기/LottoGenerator';

export default {
    components: {
        NumberBaseball,
        ResponseCheck,
        LottoGenerator,
    },
     mounted(){
        console.log(this.$router); //뷰 라우터 전체에대한 설정
        console.log(this.$route); //현재 주소에대한 설정들
    },
    computed: {
        currentGame(){
            return this.$route.params.name;
        },
    },
};
</script>