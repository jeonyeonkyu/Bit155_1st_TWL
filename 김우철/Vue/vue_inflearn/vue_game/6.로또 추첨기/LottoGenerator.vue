<template>
    <div>
        <div>당첨 숫자</div>
        <div id="결과창">
            <lotto-ball v-for="ball in winBalls" :key="ball" :number="ball"></lotto-ball>
        </div>
        <div>보너스</div>
        <lotto-ball v-if="bonus" :number="bonus"></lotto-ball>
        <button v-if="redo" @click="onClickRedo">한 번 더!</button>
    </div>
</template>

<script>
  import LottoBall from './LottoBall';
    function getWinNumbers() {
        const candidate = Array(45).fill().map((v, i) => i + 1);
        const shuffle = [];
        while(candidate.length > 0){
            shuffle.push(candidate.splice(Math.floor(Math.random() * candidate.length), 1)[0]);
        }
        const bonusNumber = shuffle[shuffle.length - 1];
        const winNumbers = shuffle.slice(0, 6).sort((p, c) => p - c);
        return [...winNumbers, bonusNumber];
    }

    const timeouts = []; //setTimeout을 저장해주면 clearTimeout때 사용가능
    export default {
        components: {
            LottoBall, 
        },
        data() {
           return{
               //winNumber(미리 숫자다 들어있음)
               //에 들어있는 값을 winBalls에 하나씩 넣어줌
               winNumbers: getWinNumbers(), 
               winBalls: [],
               bonus: null,
               redo: false,
           };
        },
        methods: { 
            onClickRedo(){
                this.winNumbers = getWinNumbers();
                this.winBalls = [];
                this.bonus = null;
                this.redo = false;
                this.showBalls();
            },
            showBalls(){
            //let을 쓰면 클로저 문제 해결
            for(let i = 0; i < this.winNumbers.length - 1; i++) {
            timeouts[i] = setTimeout(() => {
                this.winBalls.push(this.winNumbers[i]);
            }, (i + 1) * 1000);
        }
         timeouts[6] = setTimeout(() => {
            this.bonus = this.winNumbers[6];
            this.redo = true;
        }, 7000)
    },
},
    mounted() {
      this.showBalls();
    },
    beforeDestroy(){
        timeouts.forEach((t) => {
            clearTimeout(t);
        });
    },
    // watch:{ //최대한 쓰지마셈(부작용..)
    //     //value = 현재값, oldValue = 이전값
    //     //객체나 배열은 결과가 잘뜨지않음(참조관계라서)
    //     winBalls(value, oldValue){ //this.winBalls을 감시하고 싶음
    //         if(val.length === 0){ //winBals가 빈배열이 될때 실행
    //             this.showBalls();
    //         }
    //     }
    // },
};
</script>

<style scoped>
 
</style>