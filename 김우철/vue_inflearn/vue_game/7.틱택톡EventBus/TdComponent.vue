<template>
    <td @click="onClickTd">{{cellData}}</td>
</template>

<script>
import EventBus from './EventBus';
   export default{
       props: {
           cellData: String,
           rowIndex: Number,
           cellIndex: Number,
       },
        methods:{
            onClickTd(){
                //TicTacToe에서 쓰이기 때문에 매개변수로 넘겨줘야함
                EventBus.$emit('clickTd', this.rowIndex, this.cellIndex);
            }
            }
        };
</script>

<style>

 
</style>