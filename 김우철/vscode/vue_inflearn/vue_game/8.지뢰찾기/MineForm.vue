<template>
    <div>
        <input type="number" placeholder="세로" :value="row" @change="onChangeRow" />
        <input type="number" placeholder="가로" :value="cell" @change="onChangeCell" />
        <input type="number" placeholder="지뢰" :value="mine" @change="onChangeMine" />
        <button @click="onClickBtn">시작</button>
    </div>
</template>

<script>
import {START_GAME} from './store';
//여기에만 쓸 정보는 vuex에서 만들지 말고 걍 여기서 만들어라
export default {
    data(){
        return {
            row: 10,
            cell: 10,
            mine: 20,
        };
    },
    methods: {
        onChangeRow(e){
            this.row = e.target.value;
        },
        onChangeCell(e){
            this.cell = e.target.value;
        },
        onChangeMine(e){
            this.mine = e.target.value;
        },
        onClickBtn() { //vuex에 데이터를 보냄, START_GAME에 들어감
            this.$store.commit(START_GAME, {row: this.row, cell:this.cell, mine: this.mine });
        }
    },
}
</script>