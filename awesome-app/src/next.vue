<template>
  <div class="wrapper">
    <text class="button" @click="jump">Jump</text>
  </div>
</template>

<style scoped>
.wrapper {
  flex-direction: column;
  justify-content: center;
}
.button {
  font-size: 60px;
  width: 450px;
  text-align: center;
  margin-top: 30px;
  margin-left: 150px;
  padding-top: 20px;
  padding-bottom: 20px;
  border-width: 2px;
  border-style: solid;
  color: #666666;
  border-color: #DDDDDD;
  background-color: #F5F5F5
}
</style>

<script>
export default {
  methods: {
    jump() {
      weex.requireModule('hkRouter').open({
        url: 'http://192.168.31.211:8081/dist/second.js',
        type: 'PUSH',
        params: 'params--1',
        pageName: 'next'
      }, resData => {
        console.log('回调成功');
      });
    }
  }
}
</script>