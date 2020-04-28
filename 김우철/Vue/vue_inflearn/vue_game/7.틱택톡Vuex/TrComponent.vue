<template>
   <tr>
        <td-component v-for="(cellData, index) in rowData" :key="index" :cell-index="index" :row-index="rowIndex"></td-component>
   </tr>
</template>

<script>
import TdComponent from './TdComponent';
   export default{
        components: {
            TdComponent,
        },
        data(){
            return{
                parent: '내가 니 애비다',
            };
        },
        computed: {
            rowData(){
                return this.$store.state.tableData[this.rowIndex]; //바로 가져옴
            }
        },
       props: {
           rowIndex: Number,
       },
  };
</script>

<style>

 
</style>