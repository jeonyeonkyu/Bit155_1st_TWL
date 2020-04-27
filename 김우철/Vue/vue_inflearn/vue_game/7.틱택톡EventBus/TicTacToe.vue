<template>
    <div>  
        <div>{{turn}}님의 턴입니다.</div>
        <table-component :table-data="tableData" />
        <div v-if="winner">{{winner}}님의  승리!</div>
    </div>
</template>

<script>
// import Vue from 'vue';
import TableComponent from './TableComponent';
import EventBus from './EventBus';
    export default {
        components: {
            TableComponent,
        },
        data() {
            return {
                tableData: [
                    ['', '', ''],
                    ['', '', ''],
                    ['', '', ''],
                ],
                turn: 'O',
                winner: '',
            };
        },
        methods: { 
            onChangeData(){
                //this.tableData[1][0] = 'X'; 동작하지 않음
                Vue.set(this.tableData[1], 0, 'X');
                //바꾸고 싶은값, 키, 데이터
            },
            onClickTd(rowIndex, cellIndex){
                this.$set(this.tableData[rowIndex], cellIndex, this.turn);

                let win = false;
                //가로 3줄 검사
                if (this.tableData[rowIndex][0] === this.turn && this.tableData[rowIndex][1] === this.turn && this.tableData[rowIndex][2] === this.turn) {
                win = true;
                }
                //세로 3줄 검사
                if (this.tableData[0][cellIndex] === this.turn && this.tableData[1][cellIndex] === this.turn && this.tableData[2][cellIndex] === this.turn) {
                win = true;
                }
                //대각선 3줄 검사(왼쪽)
                if (this.tableData[0][0] === this.turn && this.tableData[1][1] === this.turn && this.tableData[2][2] === this.turn) {
                win = true;
                }
                //대각선 3줄 검사(오른쪽)
                if (this.tableData[0][2] === this.turn && this.tableData[1][1] === this.turn && this.tableData[2][0] === this.turn) {
                win = true;
                }
                if (win) { // 이긴 경우: 3줄 달성
                this.winner = this.turn;
                this.turn = 'O';
                this.tableData = [['', '', ''], ['', '', ''], ['', '', '']];
                } else { // 무승부
                let all = true; // all이 true면 무승부라는 뜻
                this.tableData.forEach((row) => { // 무승부 검사(모든칸이 차있는지)
                    row.forEach((cell) => {
                    if (!cell) {
                        all = false;
                    }
                    });
                });
                if (all) { // 무승부
                    this.winner = '';
                    this.turn = 'O';
                    this.tableData = [['', '', ''], ['', '', ''], ['', '', '']];
                } else {
                    this.turn = this.turn === 'O' ? 'X' : 'O'; //이긴거나 무승부도 아니기 때문에 턴 바꿔줌
                }
                }
            },
        },
        created() {
            //사용자 정의 이벤트 등록
            EventBus.$on('clickTd', this.onClickTd);
        }
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