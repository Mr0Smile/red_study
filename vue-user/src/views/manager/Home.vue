<template>
	<div>
		<carousel :images="images"></carousel>

		<div style="clear: both">
			<notice class="home-card" :notice="data.notice"></notice>
			<news class="home-card"></news>
		</div>

		<div style="clear: both">
			<activity></activity>
		</div>
	</div>
</template>

<script setup>
import { reactive, onMounted } from "vue";
import request from "@/utils/request";

import carousel from "@/components/Home/carousel.vue";
import notice from "@/components/Home/notice.vue";
import news from "@/components/Home/news.vue";
import activity from "@/components/Home/activity.vue";

const data = reactive({
	admin: JSON.parse(localStorage.getItem("system-admin") || "{}"),
	notice: [], // 这里初始化 notice 数组
});

// 在组件挂载后请求数据
onMounted(() => {
	request
		.get("/notice/selectAll")
		.then((res) => {
			data.notice = res.data; // 更新数据
		})
		.catch((error) => {
			console.error("获取活动数据失败:", error); // 处理错误
		});
});

defineEmits(["updateUser"]);
</script>

<style>
@import "../../assets/css/home.css";
</style>
