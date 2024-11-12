<template>
  <div class="container">
    <!-- 增加简单的输入框以输入标题 -->
    <input
        type="text"
        v-model="title"
        placeholder="请输入文章标题"
        class="title-input"
        required
    />

    <v-md-editor
        v-model="text"
        left-toolbar="undo redo | image"
        :disabled-menus="[]"
        @upload-image="handleUploadImage"
        height="500px"
        class="markdown-editor"
    />

    <!-- 增加保存文章的按钮 -->
    <button @click="saveArticle" class="save-button">保存文章</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      text: '',            // 文章内容
      title: '',          // 文章标题，绑定输入框
      author_id: null,    // 默认作者ID，初始化为 null
    };
  },
  mounted() {
    // 获取用户信息并设置 author_id
    const userInfo = JSON.parse(localStorage.getItem("system-user") || "{}");
    if (userInfo && userInfo.id) {
      this.author_id = userInfo.id; // 从 userInfo 中取出 id 赋值给 author_id
    }
  },
  methods: {
    async handleUploadImage(event, insertImage, files) {
      const file = files[0];
      if (!file) return;

      const formData = new FormData();
      formData.append('file', file);

      try {
        const response = await fetch('http://localhost:9090/files/upload', {
          method: 'POST',
          body: formData,
        });

        if (!response.ok) {
          throw new Error('网络响应不正常');
        }

        const result = await response.json();
        const imageUrl = result.data;

        if (imageUrl) {
          insertImage({ url: imageUrl, desc: file.name });

          this.$nextTick(() => {
            console.log("图片插入成功:", imageUrl);
          });
        }

      } catch (error) {
        console.error("上传失败:", error);
      }
    },
    async saveArticle() {
      const submit_time = new Date().toISOString(); // 生成当前时间的 ISO 格式字符串

      const articleData = {
        title: this.title,    // 获取用户输入的标题
        content: this.text,   // 获取 Markdown 内容
        author_id: this.author_id, // 从 localStorage 获取的 author_id
        submit_time: submit_time,
      };

      try {
        const response = await fetch('http://localhost:9090/articles/add', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(articleData),
        });

        if (response.ok) {
          const result = await response.json();
          console.log("保存成功:", result);
          // 清空表单或其他逻辑
          this.text = ''; // 清空编辑器内容
          this.title = ''; // 清空标题
        } else {
          throw new Error('保存失败');
        }
      } catch (error) {
        console.error("保存文章时出错:", error);
      }
    },
  },
};
</script>

<style scoped>
.container {
  max-width: 800px; /* 最大宽度 */
  margin: 0 auto; /* 居中对齐 */
  padding: 20px; /* 内边距 */
  background-color: #f9f9f9; /* 背景色 */
  border-radius: 8px; /* 圆角 */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 投影效果 */
}

.title-input {
  width: 100%; /* 使输入框宽度占满 */
  padding: 10px; /* 追加内边距 */
  margin-bottom: 20px; /* 输入框与其他元素之间留下间隙 */
  border: 1px solid #ccc; /* 边框 */
  border-radius: 4px; /* 圆角 */
  font-size: 16px; /* 字体大小 */
  transition: border-color 0.3s; /* 添加边框色变化效果 */
}

.title-input:focus {
  border-color: #007bff; /* 焦点时的边框颜色 */
  outline: none; /* 取消默认的轮廓显示 */
}

.save-button {
  padding: 10px 20px; /* 内边距 */
  background-color: #007bff; /* 按钮背景色 */
  color: white; /* 字体颜色 */
  border: none; /* 取消边框 */
  border-radius: 4px; /* 圆角 */
  font-size: 16px; /* 字体大小 */
  cursor: pointer; /* 鼠标指针样式 */
  transition: background-color 0.3s, transform 0.2s; /* 悬停效果 */
}

.save-button:hover {
  background-color: #0056b3; /* 悬停时的背景色 */
}

.save-button:active {
  transform: scale(0.95); /* 点击时缩放效果 */
}
</style>
