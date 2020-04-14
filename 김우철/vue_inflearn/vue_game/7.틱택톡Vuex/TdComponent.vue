<template>
    <div>

    </div>
    <!-- <td @click="onClickTd">{{cellData}}</td> -->
</template>

<script>
import { mapState } from 'vuex';
import {CLICK_CELL, SET_WINNER, RESET_GAME, CHANGE_TURN, NO_WINNER} from './store'; //store에서 변수로 선언한것을 가져옴
   export default{
       props: {
        //    cellData: String, tr,td가 부모에서 바로 받기 때문에 tr에서 주지 않아서 필요없음
           rowIndex: Number,
           cellIndex: Number,
       },
       computed: { //Vuex의 state를 쓰기 위해서는 computed에 반드시 연결을 해줘야 한다.
       ...mapState({
           tableData: state => state.tableData,
           turn: state => state.turn,
           cellData(state){
               return state.tableData[this.rowIndex][this.cellIndex];
           },
       }),
        // cellData(){ //부모데이터에서 바로 받음
        //      return this.$store.state.tableData[this.rowIndex][this.cellIndex];
        // },
        //    tableData() {
        //        return this.$store.state.tableData;
        //    },
        //    turn() {
        //        return this.$store.state.turn;
        //    },
       },
       methods: {

       }
};
</script>