<template>
    <div>
        <!-- 가위바위보 이미지 -->
        <div id="computer" :style="computedStyleObject"></div> 
        <div>
            <button @click="onClickButton('바위')">바위</button>
            <button @click="onClickButton('가위')">가위</button>
            <button @click="onClickButton('보')">보</button>
        </div>
        <div>{{result}}</div>
        <div>현재 {{score}}점</div>
    </div>
</template>

<script>
    const rspCoords = {
        바위: '0',
        가위: '-142px',
        보: '-284px',
    };

    const scores = {
        가위: 1,
        바위: 0,
        보: -1,
    }
    
    const computerChoice = (imgCoord) => {
        return Object.entries(rspCoords).find(function (v){
            return v[1] === imgCoord;
        })[0];
    };

    let interval = null;
    export default {
        data() {
           return{
               imgCoord: rspCoords.바위,
               result: '',
               score: 0,
           };
        },
        computed: {
          computedStyleObject() {
              return{
                background: `url(https://en.pimg.jp/023/182/267/1/23182267.jpg) ${this.imgCoord} 0`
            }
          }
        },
        methods: { 
            changeHand() {
             interval = setInterval(() => {
            if(this.imgCoord === rspCoords.바위){
                this.imgCoord = rspCoords.가위;
            }else if(this.imgCoord === rspCoords.가위){
                this.imgCoord = rspCoords.보;
            }else if(this.imgCoord === rspCoords.보){
                this.imgCoord = rspCoords.바위;
            }
        }, 100);
            },
            onClickButton(choice) {
                clearInterval(interval);
                const myScore = scores[choice];
                const cpuScore = scores[computerChoice(this.imgCoord)];
                const diff = myScore - cpuScore;
                if(diff === 0){
                    this.result = '비김';
                } else if([-1, 2].includes(diff)){
                    this.result = '이김';
                    this.score += 1;
                } else{
                    this.result = '짐';
                    this.score -= 1;
                }
                setTimeout(() => {
                    this.changeHand();
                }, 1000);
            },
    },
    beforeCreate() {
        console.log('beforeCreate');
    },
    // 컴포넌트가 보여지긴 하지만 화면에 나타나기 전
    //script안에 있는 모든 값들이 template에 들어갔을때가 create 실행 (하지만 화면은 X)
    created() {
        console.log('created');
    },
    beforeMount(){
        console.log('beforeMount');
    },
     // 화면에 나타난 후 mounted 실행
    mounted() {
        this.changeHand();
        console.log('mounted');
        //가위바위보 component가 사라져도 setInterval은 계속 실행이 됨(문제) -> 메모리 누수..
    },
    beforeUpdate() {
        console.log('beforeUpdated');
    },
    // 데이터가 바껴서 화면이 다시그려질때 
    updated(){
        console.log('updated');
    },
    beforeDestroy(){
        console.log('beforeDestroy');
        clearInterval(interval); //메모리 누수 해결
    },
    //화면에서 사라질때
    destroyed() {
        console.log('destroyed');
    }
};
</script>

<style scoped>
    #computer{
        width:142px;
        height: 200px;
        background-position: 0 0;
    }
</style>