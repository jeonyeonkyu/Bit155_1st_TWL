<template>
    <table>
        <slot></slot>
        <!-- 실제로 화면에 위치될 곳임 slot한데가 -->
        
        <!-- tr.vue에 rowData를 넘겨주고 몇번째 가로줄인지도 알려줌 -->
        <!-- <tr-component v-for="(rowData, index) in tableData" :key="index" :row-index="index"></tr-component> -->
    </table>
</template>

<script>
// import TrComponent from './TrComponent';
   export default{
        // components: {
        //     TrComponent,
        // },
        // computed: {
        //     tableData(){
        //         return this.$store.state.tableData;
        //     },
        //     // turnMessage(){
        //     //     return this.$store.getters.turnMessage;
        //     // }
        //     //getters도 여러개 존재할 수 있기 때문에 mapGetters 존재
        // }
    
  };
</script>

<style>

 
</style>