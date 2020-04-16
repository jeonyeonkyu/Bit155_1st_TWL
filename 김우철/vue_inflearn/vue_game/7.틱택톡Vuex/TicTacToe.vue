<template>
    <div>  
        <div>{{turn}}님의 턴입니다.</div>
        <!-- <table-component :table-data="tableData" /> -->
        <table-component> 
            <tr v-for="(rowData, rowIndex) in tableData" :key="rowIndex">
            <td @click="onClickTd(rowIndex, cellIndex)" v-for="(cellData, cellIndex) in rowData" :key="cellIndex">{{cellData}}</td>
            </tr>
        </table-component>
        <!-- TableComponent.vue의 slot에 <table-component>가 렌더링됨(들어감) -->
            <!-- 틱택톡.vue의 데이터를 쓴 상태로 tablecomponent.vue에 들어감 -->
        <div v-if="winner">{{winner}}님의  승리!</div>
    </div>
</template>

<script>
import { mapState } from 'vuex';
import store, { CHANGE_TURN, CLICK_CELL, NO_WINNER, RESET_GAME, SET_WINNER } from './store';
import TableComponent from './TableComponent';
    export default {
        store, //$store 사용 가능
        components: {
            TableComponent,
        },
        data(){
            return{
                data: 1,
            }
        },
        computed: { //store의 state에 있는 것을 가져옴
            ...mapState(['tableData', 'winner', 'turn']), //이것만 알면 나머지는 응용
        },
        methods: {
            onClickTd(rowIndex, cellIndex){
                //this.$set(this.tableData[rowIndex], cellIndex, this.turn);
                this.$store.commit(CLICK_CELL, {row: rowIndex, cell: cellIndex }); 

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
                this.$store.commit(SET_WINNER, this.turn); // this.winner = this.turn;
                this.$store.commit(RESET_GAME); //    this.turn = 'O'; /   this.tableData = [['', '', ''], ['', '', ''], ['', '', '']];
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
                    this.$store.commit(NO_WINNER);
                    this.$store.commit(RESET_GAME);
                } else {
                   this.$store.commit(CHANGE_TURN);
                }
            }
        }
    },
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



            
 