var app = new Vue({
    el:'#app',
    data:{
        mode:'list',
        memo:{
            id:null,
            content:null,
            regDate:null
        },
        memos:[ ]
    },
    methods:{
        renew:function(val){
            return JSON.parse(JSON.stringify(val));
        },
        open:function(id){
            for(var i in this.memos){
                if(this.memos[i].id === id){
                    this.memo = this.renew(this.memos[i]);
                    console.log(this.memo);
                    break;
                }
            }
            this.mode ="edit"
        },
        write:function(){

            this.mode = 'write'
            this.memo = {
                id:null,
                content:null,
                regDate:null
            }
        },
        save:function(){
            //https://www.youtube.com/watch?v=dMHW25EDtAo&list=PLtht1_et-35ArPa9sBozD9dEr1CPRIOMb&index=9
            var id = this.memos.length + 1;

            this.memos.push({
                id:id,
                content:this.memo.content,
                regDate: new Date()
            })

            //this.memo.content = null;
            this.mode = 'list'

            localStorage.setItem('memos',JSON.stringify(this.memos));
        },
        cancel:function(){
            this.mode = 'list'
        }
     },
     created:function(){  //vue 기본제공함수
        var memos = localStorage.getItem('memos');
        if(memos){
            this.memos= JSON.parse(memos);
        }
     }
});