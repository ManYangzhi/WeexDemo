<template>
 <div>
    <div>姓名：{{user.name}}</div>
    <div>性别：{{user.sex}}</div>
    <div>年龄：{{user.age}}</div>
    <div>他隔壁邻居的阿姨家小狗的名字：{{user.petName}}</div>
 </div>
</template>

<script >
export  default {
	props: {
	  user: {
	    type:Object,
	    default: () => {}
	  }
	},
}
</script>