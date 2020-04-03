<template>
    <td @click="onClickTd">{{cellData}}</td>
</template>

<script>
   export default{
       props: {
           cellData: String,
           rowIndex: Number,
           cellIndex: Number,
       },
        methods:{
            onClickTd(){
                const rootData = this.$root.$data;
                //인덱스를 여러 번 쓰는 경우 마지막 인덱스를 key로하면 됨
                this.$set(rootData.tableData[this.rowIndex], this.cellIndex, rootData.turn);

                let win = false;
                //가로 3줄 검사
                if (rootData.tableData[this.rowIndex][0] === rootData.turn && rootData.tableData[this.rowIndex][1] === rootData.turn && rootData.tableData[this.rowIndex][2] === rootData.turn) {
                win = true;
                }
                //세로 3줄 검사
                if (rootData.tableData[0][this.cellIndex] === rootData.turn && rootData.tableData[1][this.cellIndex] === rootData.turn && rootData.tableData[2][this.cellIndex] === rootData.turn) {
                win = true;
                }
                //대각선 3줄 검사(왼쪽)
                if (rootData.tableData[0][0] === rootData.turn && rootData.tableData[1][1] === rootData.turn && rootData.tableData[2][2] === rootData.turn) {
                win = true;
                }
                //대각선 3줄 검사(오른쪽)
                if (rootData.tableData[0][2] === rootData.turn && rootData.tableData[1][1] === rootData.turn && rootData.tableData[2][0] === rootData.turn) {
                win = true;
                }
                if (win) { // 이긴 경우: 3줄 달성
                rootData.winner = rootData.turn;
                rootData.turn = 'O';
                rootData.tableData = [['', '', ''], ['', '', ''], ['', '', '']];
                } else { // 무승부
                let all = true; // all이 true면 무승부라는 뜻
                rootData.tableData.forEach((row) => { // 무승부 검사(모든칸이 차있는지)
                    row.forEach((cell) => {
                    if (!cell) {
                        all = false;
                    }
                    });
                });
                if (all) { // 무승부
                    rootData.winner = '';
                    rootData.turn = 'O';
                    rootData.tableData = [['', '', ''], ['', '', ''], ['', '', '']];
                } else {
                    rootData.turn = rootData.turn === 'O' ? 'X' : 'O'; //이긴거나 무승부도 아니기 때문에 턴 바꿔줌
                }
                }
            }
            }
        };
</script>

<style>

 
</style>