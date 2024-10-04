<template>
	<div>
		<el-carousel indicator-position="outside" height="600px">
			<el-carousel-item v-for="image in images" :key="image">
				<div class="image-container">
					<img
						class="responsive-image"
						:src="image"
						alt="Carousel Image"
					/>
				</div>
			</el-carousel-item>
		</el-carousel>
	</div>

	<div>
		<div
			style="
				margin-bottom: 3%;
				margin-top: 3%;
				font-size: x-large;
				font-weight: bolder;
			"
		>
			特色活动
		</div>

		<el-timeline style="width: 50%">
			<el-timeline-item
				v-for="item in data.notice"
				:key="item.id"
				:timestamp="item.time"
				placement="top"
			>
				<el-card>
					<h3>{{ item.title }}</h3>
					<p>{{ item.content }}</p>
				</el-card>
			</el-timeline-item>
		</el-timeline>
	</div>
</template>

<script setup>
import { reactive, onMounted } from "vue";
import request from "@/utils/request";
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

<style scoped>
.image-container {
	width: 100%; /* 设置容器宽度 */
	height: 100%; /* 设置容器高度 */
	overflow: hidden; /* 防止图片溢出 */
}

.responsive-image {
	width: 100%; /* 图片宽度100% */
	height: 100%; /* 图片高度100%，确保填满容器 */
	object-fit: contain; /* 使用contain以完整显示图片，可能会留白 */
}
</style>
