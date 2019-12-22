import { host, app, banner3d, getParmasByHash, tmp, storage, PreventShaking } from './blog-utils';
const body = $('body:first');
const $win = $(window);
export function Banner3dEvent(){
    const bgShaking = PreventShaking(function () {
        banner3d($('#intrude-bg'), [`http://localhost:8888/static/img/401.png`, `http://localhost:8888/statics/img/404.png`, `http://localhost:8888/static/img/500.png`, `http://localhost:8888/static/img/wechat.jpg`]);
    }, 500);
    $win.on('resize.initBg', bgShaking);
    bgShaking();
}