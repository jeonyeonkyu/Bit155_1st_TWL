<template>
    <div class="ball" :style="styleObject">{{number}}</div>
</template>

<script>
   export default{
       name: 'LottoBall',
       props: { //props는 바꾸지 못함(readOnly)
        number: Number, //권장사항(축약은 비추) 타입을 맞춰줘야함
       },
       computed: { //this.number를 통해 계산하니 computed
        styleObject() {
            let background;
            if (this.number <= 10) {
            background = 'red';
            } else if (this.number <= 20) {
            background = 'orange';
            } else if (this.number <= 30) {
            background = 'yellow';
            } else if (this.number <= 40) {
            background = 'blue';
            } else {
            background = 'green';
            }
            return {
            background, //computed는 새로운 값을 리턴
            };
        }
    },
  }
</script>

<style>
.ball{
    display: inline-block;
    border: 1px solid black;
    border-radius: 20px;
    width: 40px;
    height: 40px;
    line-height: 40px;
    font-size: 20px;
    text-align: center;
    margin-right: 20px;
}
 
</style>