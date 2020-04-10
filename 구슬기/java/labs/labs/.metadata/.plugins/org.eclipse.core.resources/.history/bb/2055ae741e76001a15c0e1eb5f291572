<template>
    <table>
        <!-- tr.vue에 rowData를 넘겨주고 몇번째 가로줄인지도 알려줌 -->
        <tr-component v-for="(rowData, index) in tableData" :key="index" :row-data="rowData" :row-index="index"></tr-component>
    </table>
</template>

<script>
import TrComponent from './TrComponent';
   export default{
        components: {
            TrComponent,
        },
       props: {
           tableData: Array,
       },
  };
</script>

<style>

 
</style>