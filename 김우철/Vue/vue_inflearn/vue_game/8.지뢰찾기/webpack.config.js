const VueLoaderPlugin = require('vue-loader/lib/plugin');
//노드가 만들어준 스크립트
const path = require('path');

// 노드의 모듈을 만듬, 여기에 모든설정을 넣음
module.exports = {
    mode: 'development', //배포할때는 production
    devtool: 'eval', //배포할때는 hidden-source-web, eval로하면 웹팩의 빌드속도가 빨라짐
    resolve: {
        extensions: ['.js', '.vue'], //import Num from './Num'; .vue 생략가능
    },
    entry: {
        //app은 하나로 합쳐질 파일의 이름
        app: path.join(__dirname, 'main.js'),
    },
    // module은 웹팩의 핵심
    module: { 
        // rules는 JS를 어떻게 합칠지에 대한 규약
        rules: [{
            //파일명이 .vue로 끝나는 파일
            test: /\.vue$/, 
            loader: 'vue-loader',
        }, {
            test: /\.css$/, 
            use: [
                'vue-style-loader',
                'css-loader',
            ]
        }],
    },
    plugins: [ //output되기전 한번 더 가공
        new VueLoaderPlugin(),
    ],
    output: {
        filename: 'app.js',
        path: path.join(__dirname, 'dist'),
        //경로를 합쳐줌
        //__dirname는 현재경로
        publicPath: '/dist',
    },
};