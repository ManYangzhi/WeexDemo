<template>
  <div class="wrapper">
    <text class="button" @click="jump">Jumping</text>
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
      // weex.requireModule('hkRouter').getParams(resData => {
      //   console.log(resData);
      // });

      weex.requireModule('hkRouter').back({
        length: 1,
        type: 'PUSH'
      }, resData => {

      });
    }
  }
}
</script>