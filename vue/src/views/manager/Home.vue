



<template>

  <div>
    <el-carousel indicator-position="outside" height="600px">
      <el-carousel-item v-for="image in images" :key="image">
        <div class="image-container">
          <img class="responsive-image" :src="image" alt="Carousel Image" />
        </div>
      </el-carousel-item>
    </el-carousel>
  </div>

  <div>
    <div style="margin-bottom: 3%; margin-top: 3%; font-size: x-large; font-weight: bolder">特色活动</div>

    <el-timeline style="width: 50%">
      <el-timeline-item :timestamp="item.time" placement="top" v-for="item in data.notice" :key="item.id">
        <el-card>
          <h3>{{ item.title }}</h3>
          <p>{{ item.content }}</p>
        </el-card>
      </el-timeline-item>
    </el-timeline>

  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request";
import img1 from "../../assets/imgs/1.jpg"
import img2 from "../../assets/imgs/2.jpg"
import img3 from "../../assets/imgs/3.jpg"
import img4 from "../../assets/imgs/4.jpg"

const images = [ img1, img2, img3, img4]

request.get("/notice/selectAll").then(res =>{
  data.notice = res.data
})

const data = reactive({
  admin: JSON.parse(localStorage.getItem('system-admin') || '{}'),
})

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
