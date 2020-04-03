<template>
  <div>
    <h1>{{result}}</h1>
    <form @submit.prevent="onSubmitForm">
      <input ref="answer" minlength="4" maxlength="4" v-model="value" />
      <button type="submit">입력</button>
    </form>
    <div>시도: {{tries.length}}</div>
    <ul>
      <li v-for="t in tries" :key="t.try">
        <div>{{t.try}}</div>
        <div>{{t.result}}</div>
      </li>
    </ul>
  </div>
</template>

<script>
    //array.splice(start, count)
    //특정 범위의 값들을 추출하고,그 자리에 새로운 값을 넣는다.
    //0번째 값부터 랜덤한 값을 추출하여 chosen에 넣어준뒤 array에 값을 push 해줌
    const getNumbers = () =>{
        const candidates = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        const array = [];
        for(let i = 0; i < 4; i += 1) { 
            const chosen = candidates.splice(Math.floor(Math.random() * (9 - i)), 1)[0];
            array.push(chosen);
        }
        return array;
    };

    export default {
        data() {
            return {
            answer: getNumbers(), //ex) [1,5,3,4]
            tries: [], //시도 수
            value: '', //입력
            result: '', //결과
            }
        },
        methods: { //화면이랑 연결된 것 위주로 해주면 좋음
            onSubmitForm() {
                //문자열과 배열을 비교하기위해 문자열에 .join()을 사용
                if(this.value === this.answer.join('')) {
                    this.tries.push({
                    try: this.value,
                    result: '홈런',
                });
                this.result = '홈런';
                alert("게임을 다시 실행합니다.");
                this.value = '';
                this.answer = getNumbers();
                this.tries = [];
                this.$refs.answer.focus();
                } else{ //정답이 틀렸을때
                    if(this.tries.length >= 9){ //10번째 시도
                        this.result = `10번 넘게 틀려서 실패! 답은 ${this.answer.join(',')}였습니다!`;
                        alert('게임을 다시 시작합니다.');
                        this.value = '';
                        this.answer = getNumbers();
                        this.tries = [];
                        this.$refs.answer.focus();
                    }
                    let strike = 0;
                    let ball = 0;
                    const answerArray = this.value.split('').map(v => parseInt(v));
                    for(let i = 0; i < 4; i += 1){
                        if(answerArray[i] === this.answer[i]) { //숫자 자릿수 모두 정답
                            strike++;
                        }else if(this.answer.includes(answerArray[i])) { //숫자만 정답
                            ball++;
                        }
                    }
                    this.tries.push({
                        try: this.value,
                        result: `${strike} 스트라이크, ${ball} 볼입니다.`,
                    });
                    this.value = '';
                    this.$refs.answer.focus();
                }
            }
        }
    };
</script>

<style>

</style>