<template>
  <div class="wrapper">
    <div class="container-title">
      <text class="title">车况上报</text>
      <text class="desc">如果发现车辆问题，请上传对应图片</text>
    </div>
    <div class="container-inner">
      <div class="container-photo" v-for="(item, index) in data">
        <image class="img" :src="item.photo" placeholder="local:///photo_placeholder.png" @click="takephoto(index)"></image>
        <text class="position">{{item.position}}</text>
        <image class="delete-image" v-if="item.photo" resize="contain" src="local:///delete_photo.png" @click="deletephoto(index)"></image>
      </div>
    </div>
    <textarea class="feedback" rows=5 @change="feedbackOnchange" placeholder="请描述车辆问题，帮助我们更好的提高服务，请在500字以内"></textarea>
    <text v-if="isChoosePhoto" v-bind:style="[submitUnusable, submitUsable]" @click="submit">提交</text>
    <text v-if="!isChoosePhoto" v-bind:style="submitUnusable" @click="submit">提交</text>
  </div>
</template>

<style scoped>
.wrapper {
  background-color:#F8F8F8;
}
.container-title {
  background-color: white;
  width: 750px;
  height:203px;
}
.title {
  height:100px;
  line-height: 100px;
  margin-top:18px;
  margin-left:22px;
  font-size:64px;
  font-family:PingFangSC-Regular;
  color:#333333;
}
.desc {
  margin-top:42px;
  margin-left:22px;
  font-size:28px;
  line-height: 28px;
  font-family:PingFangSC-Regular;
  color:#333333;
}
.container-inner {
  background-color: white;
  flex-direction: row;
  flex-wrap: wrap;
}
.container-photo {
  height:303px;
  width: 225px;
  margin-left: 19px;
  background-color: white;
}
.img {
  background-color: white;
  margin-top: 25px;
  width:210px;
  height:210px;
  border-radius:12px;
  color: white;
}
.delete-image{
  position: absolute;
  right: 0;
  top: 0;
  width: 50px;
  height: 50px;
}
.position {
  height:68px;
  width:210px;
  line-height:68px;
  font-size:28px;
  text-align: center;
  color:#D1D1D1;
}
.feedback {
  width:750px;
  height:160px;
  margin-top:20px;
  padding-top:10px;
  padding-left:22px;
  padding-right:22px;
  padding-bottom:10px;
  font-size:28px;
  background-color:white;
}

</style>
<script>
export default {
  data () {
    return {
      isChoosePhoto: false,
      feedback: '',
      data: [
      {position:'车头',photo:''},
      {position:'车左侧',photo:''},
      {position:'车右侧',photo:''},
      {position:'车尾',photo:''},
      {position:'车内室',photo:''},
      {position:'其它',photo:''}
      ],
      submitUnusable: {
        position: 'absolute',
        bottom: 0,
        width: '750px',
        height: '100px',
        lineHeight: '100px',
        fontSize: '32px',
        textAlign: 'center',
        color: 'white',
        backgroundColor: '#CCCCCC'
      },
      submitUsable: {
        backgroundColor: '#39424B'
      }
    }
  },
  methods: {
    submit() {
      //   网络请求
      //   weex.requireModule('hkAxios').fetch({
      //     header: {
      //       apiVersion: null
      //     },
      //     method: 'GET',
      //     url: 'http://korafile.oss-cn-beijing.aliyuncs.com/cityinfo/prod/city.json',
      //     param: {
      //       p1: 'p1',
      //       p2: 'p2'
      //     }
      //   }, success => {
      //    console.log(success);
      //  }, failure => {
      //   console.log(failure);
      // });

      // 控制器
      // var navigator = weex.requireModule('navigator')
      // navigator.setNavBarLeftItem({title: 'next'}, event => {

      // }),
      // navigator.setNavBarHidden({hidden: false}, event => {

      // }),
      // navigator.push({
      //   url: 'http://192.168.31.211:8081/dist/next.js',
      //   animated: "true"
      // }, event => {
      //   console.log(event);
      // })

      weex.requireModule('hkRouter').open({
        url: 'http://192.168.31.211:8081/dist/next.js',
        type: 'PUSH',
        params: 'params--1',
        pageName: 'index'
      }, resData => {
        console.log('回调成功');
      });


      // weex.requireModule("hkOrderProblemReporting").submit(this.feedback, this.data);
    },

    checkSubmitState() {
      this.isChoosePhoto = false;

      for (let index in this.data) {
        if (this.data[index].photo.length > 0) this.isChoosePhoto = true;
      }

      if (this.feedback.length > 0) this.isChoosePhoto = true;
    },

    feedbackOnchange(event) {
      this.feedback = event.value;
      this.checkSubmitState();
      console.log("this.feedback = " + this.feedback + "-----------------------" + "this.isChoosePhoto = " + this.isChoosePhoto);
    },

    takephoto(index) {
      weex.requireModule("hkImage").camera({
        imageWidth: '800',
        allowCrop: true
      }, resData => {
        this.data[index].photo = resData.data[0];
        this.checkSubmitState();
      });
    },

    deletephoto(index) {
      this.data[index].photo = '';
      this.checkSubmitState();
    },

  }
}
</script>