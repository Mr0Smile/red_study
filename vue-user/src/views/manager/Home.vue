<template>
	<carousel :images="images"></carousel>

	<notice :notice="data.notice"></notice>
</template>

<script setup>
import { reactive, onMounted } from "vue";
import request from "@/utils/request";

import carousel from "@/components/Home/carousel.vue";
import notice from "@/components/Home/notice.vue";

import img1 from "../../assets/imgs/1.jpg";
import img2 from "../../assets/imgs/2.jpg";
import img3 from "../../assets/imgs/3.jpg";
import img4 from "../../assets/imgs/4.jpg";

const images = [img1, img2, img3, img4];

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
