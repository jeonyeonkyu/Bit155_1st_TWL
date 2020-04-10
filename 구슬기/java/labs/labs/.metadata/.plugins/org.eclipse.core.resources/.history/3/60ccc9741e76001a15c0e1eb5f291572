<template>
    <div>  
    <mine-form />
    <div>{{timer}}</div>
    <table-component />
    <div>{{result}}</div> 
    </div>
</template>

<script>
import { mapState } from 'vuex';

import store, { INCREMENT_TIMER } from './store';
import TableComponent from './TableComponent';
import MineForm from './MineForm';

    let interval; //저장하는 이유는 메모리누수를 막기위해 마지막에 정리해줘야 해서
    export default {
        store,
        components: {
            TableComponent,
            MineForm,
        },
        computed: {
            ...mapState(['timer', 'halted', 'result']),
        },
        methods: {

        },
        watch: { //통제된 환경에서는 써도됨(머가 통제된환경인지..?) / setInterval같은경우 말하는건가?
            halted(value, oldValue) {
                if(value === false) {//false일때 게임 시작
                interval = setInterval(() => {
                    this.$store.commit(INCREMENT_TIMER);
                    //new Date() //정확환 시간 체크 가능, JS의 타이머는 정확하지 않을 수 있다.
                }, 1000);
                }else { //게임 중단
                    clearInterval(interval);
                }
            }
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


            
 