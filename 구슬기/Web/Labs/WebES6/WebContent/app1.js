var app = new Vue({
    el:'#app',
    data:{
        mode:'list',
        memo:{
            id:null,
            content:null,
            regDate:null
        },
        memos:[
            {
                id:1,
                content:'메모 #1',
                regDate:new Date()
            },
            {
                id:2,
                content:'메모 #2',
                regDate:new Date()
            },
            {
                id:3,
                content:'메모 #3',
                regDate:new Date()
            }
        ]
    },
    methods:{
        write:function(){
            this.mode = 'write'
        },
        save:function(){
            var id = this.memos.length + 1;

            this.memos.push({
                id:id,
                content:this.memo.content,
                regDate: new Date()
            })

            this.memo.content = null;
            this.mode = 'list'
        },
        cancel:function(){
            this.mode = 'list'
        }
     }
});