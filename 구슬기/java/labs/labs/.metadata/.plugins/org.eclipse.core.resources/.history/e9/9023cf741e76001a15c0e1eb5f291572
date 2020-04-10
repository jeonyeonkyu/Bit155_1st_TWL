<template>
    <table>
        <tr v-for="(rowData, rowIndex) in tableData" :key="rowIndex">
            <td 
            v-for="(cellData, cellIndex) in rowData" :key="cellIndex"
             :style="cellDataStyle(rowIndex, cellIndex)"
             @click="onClickTd(rowIndex, cellIndex)"
             @contextmenu.prevent="onRightClickTd(rowIndex, cellIndex)"> {{cellDataText(rowIndex, cellIndex)}} 
            </td>
        </tr>
    </table>
</template>

<script>
import { mapState } from 'vuex';
import { CLICK_MINE, CODE, FLAG_CELL, NORMALIZE_CELL, OPEN_CELL, QUESTION_CELL } from './store';

   export default{
       computed:{
           ...mapState(['tableData', 'halted']),
           cellDataStyle(state) { //여긴 일반함수(this가 있으면 화살표 함수를 사용못함)
               return (row, cell) => { //고차함수(기능을 더 만들어 줌) / 기존 함수를 확장 / 내부는 화살표 가능
               switch(this.$store.state.tableData[row][cell]){ //테이블의 각행 각열마다 칸의 코드를 검사, //연칸은 까맣게, 열지않은 칸은 하얗게..
                   case CODE.NORMAL:
                   case CODE.MINE:
                       return {
                           background: '#444',
                       };
                   case CODE.CLICKED_MINE:
                   case CODE.OPENED:
                       return {
                           background: 'white',
                       };
                   case CODE.FLAG:
                   case CODE.FLAG_MINE:
                       return {
                           background: 'red',
                       };
                   case CODE.QUESTION:
                   case CODE.QUESTION_MINE:
                       return {
                           background: 'yellow',
                       };
                    default:
                        return {};
               }
            };
           },
        cellDataText() {
             return (row, cell) => { //고차함수(기능을 더 만들어 줌) / 기존 함수를 확장 
               switch(this.$store.state.tableData[row][cell]) {  //테이블의 각행 각열마다 칸의 코드를 검사, //연칸은 까맣게, 열지않은 칸은 하얗게..
                   case CODE.MINE:
                       return 'X';
                   case CODE.NORMAL:
                        return '';
                   case CODE.FLAG:
                   case CODE.FLAG_MINE:
                        return '!';
                   case CODE.QUESTION:
                   case CODE.QUESTION_MINE:
                        return '?';
                   case CODE.CLICKED_MINE:
                        return '펑!';
                   default:
                        return this.$store.state.tableData[row][cell] || ''; //주변지뢰개수가 몇개인지 보여주는것 // 0인경우는 빈칸
               }
           };
        },
       },
       methods: {
           onClickTd(row, cell){
               if(this.halted){
                   return;
               }
                switch(this.tableData[row][cell]){
                    case CODE.NORMAL:
                        return this.$store.commit(OPEN_CELL, { row, cell });
                    case CODE.MINE:
                        return this.$store.commit(CLICK_MINE, { row, cell });
                    default:
                        return;
                }
           },
           onRightClickTd(row, cell){
               if(this.halted){
                   return;
               }
                switch (this.tableData[row][cell]) {
                    case CODE.NORMAL:
                    case CODE.MINE:
                        this.$store.commit(FLAG_CELL, { row, cell });
                        return;
                    case CODE.FLAG_MINE:
                    case CODE.FLAG:
                        this.$store.commit(QUESTION_CELL, { row, cell });
                        return;
                    case CODE.QUESTION_MINE:
                    case CODE.QUESTION:
                        this.$store.commit(NORMALIZE_CELL, { row, cell });
                        return;
                    default:
                        return;
                }
           }
       }
  };
</script>
