
var renderer;
function initRender() {
    renderer = new THREE.WebGLRenderer({antialias:true});
    renderer.setSize(window.innerWidth, window.innerHeight);
    //告诉渲染器需要阴影效果
    renderer.setClearColor(0x000000);
    document.body.appendChild(renderer.domElement);
}

var camera;
function initCamera() {
    camera = new THREE.PerspectiveCamera(45, window.innerWidth/window.innerHeight, 0.1, 1000);
    camera.position.set(0, 40, 50);
    camera.lookAt(new THREE.Vector3(0,0,0));
}

var scene;
function initScene() {
    scene = new THREE.Scene();
}

//初始化dat.GUI简化试验流程
var gui;
function initGui() {
    //声明一个保存需求修改的相关数据的对象
    gui = {
    };
    var datGui = new dat.GUI();
    //将设置属性添加到gui当中，gui.add(对象，属性，最小值，最大值）
}

var light;
function initLight() {
    scene.add(new THREE.AmbientLight(0x444444));

    light = new THREE.PointLight(0xffffff);
    light.position.set(0,50,0);

    //告诉平行光需要开启阴影投射
    light.castShadow = true;

    scene.add(light);
}

function initModel() {

    //辅助工具
    var helper = new THREE.AxesHelper(50);
    scene.add(helper);

    var loader = new THREE.ColladaLoader();

    var mesh;
    loader.load("link0.dae", function (result) {
        mesh = result.scene.children[0].clone();
        console.log(mesh);
        scene.add(mesh);
    });

}

//初始化性能插件
var stats;
function initStats() {
    stats = new Stats();
    document.body.appendChild(stats.dom);
}

//用户交互插件 鼠标左键按住旋转，右键按住平移，滚轮缩放
var controls;
function initControls() {

    controls = new THREE.OrbitControls( camera, renderer.domElement );

    // 如果使用animate方法时，将此函数删除
    //controls.addEventListener( 'change', render );
    // 使动画循环使用时阻尼或自转 意思是否有惯性
    controls.enableDamping = true;
    //动态阻尼系数 就是鼠标拖拽旋转灵敏度
    //controls.dampingFactor = 0.25;
    //是否可以缩放
    controls.enableZoom = true;
    //是否自动旋转
    controls.autoRotate = false;
    controls.autoRotateSpeed = 0.5;
    //设置相机距离原点的最远距离
    controls.minDistance  = 1;
    //设置相机距离原点的最远距离
    controls.maxDistance  = 200;
    //是否开启右键拖拽
    controls.enablePan = true;
}

function render() {

    renderer.render( scene, camera );
}

//窗口变动触发的函数
function onWindowResize() {

    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    render();
    renderer.setSize( window.innerWidth, window.innerHeight );

}

function animate() {
    //更新控制器
    render();

    //更新性能插件
    stats.update();

    controls.update();

    requestAnimationFrame(animate);
}

function draw() {
    initGui();
    initRender();
    initScene();
    initCamera();
    initLight();
    initModel();
    initControls();
    initStats();

    animate();
    window.onresize = onWindowResize;
}