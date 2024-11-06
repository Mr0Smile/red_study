<template>
  <div class="markdown-editor">
    <h2 class="editor-title">撰写文章</h2>
    <input type="text" v-model="title" placeholder="输入文章标题" class="title-input" />

    <input type="number" v-model="articleId" placeholder="输入文章 ID" class="article-id-input" />

    <!-- 文件上传处理 -->
    <input type="file" @change="handleFileUpload" accept="image/*" class="file-input" />

    <v-md-editor v-model="markdownContent" class="editor"  :disabled-menus="[]"
                 @upload-image="handleUploadImage"/>

    <button @click="saveArticle" class="save-button" :disabled="isLoading">
      <span v-if="isLoading">加载中...</span>
      <span v-else>保存文章</span>
    </button>

    <div v-if="message" class="message">{{ message }}</div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';

const markdownContent = ref(''); // Markdown 内容
const title = ref(''); // 文章标题
const articleId = ref(null); // 文章 ID
const message = ref(''); // 提示信息
const isLoading = ref(false); // 加载状态
const selectedFile = ref(null); // 图片文件

// 文件上传处理
const handleFileUpload = (event) => {
  selectedFile.value = event.target.files[0]; // 获取选择的文件
};

// 上传图片
const handleUploadImage = async () => {
  if (!selectedFile.value) return '';

  const formData = new FormData();
  formData.append('file', selectedFile.value); // 添加文件到 FormData

  try {
    const response = await axios.post('http://localhost:9090/images/upload', formData, {
      headers: { 'Content-Type': 'multipart/form-data' }
    });

    return response.data.url; // 返回上传后的图片 URL
  } catch (error) {
    console.error('图片上传失败:', error);
    alert('图片上传失败，请重试。');
  }
};



// 插入图片到 Markdown
const insertImageIntoMarkdown = async () => {
  const uploadUrl = await handleUploadImage();
  if (uploadUrl === '') return false;
  if (uploadUrl) {
    const markdownImageSyntax = `![Image](${uploadUrl})`;
    markdownContent.value += `\n${markdownImageSyntax}\n`;
    return true;
  }
  return false;
};

// 保存文章
const saveArticle = async () => {
  if (!title.value.trim()) {
    return (message.value = '标题不能为空！');
  }
  if (!articleId.value) {
    return (message.value = '文章 ID 不能为空！');
  }
  if (!markdownContent.value.trim()) {
    return (message.value = '内容不能为空！');
  }

  isLoading.value = true; // 设置加载状态
  const imageUploadSuccessful = await insertImageIntoMarkdown(); // 上传图片并插入

  if (imageUploadSuccessful) {
    isLoading.value = false;
    return; // 中止保存
  }

  const payload = {
    title: title.value,
    content: markdownContent.value,
    article_id: articleId.value,
  };

  try {
    await axios.post('http://localhost:9090/articles/add', payload);
    message.value = '文章保存成功！';
    // 清空表单
    title.value = '';
    markdownContent.value = '';
    articleId.value = null;
    selectedFile.value = null; // 清空文件
  } catch (error) {
    console.error('保存文章失败:', error);
    message.value = '保存失败，请重试！';
  } finally {
    isLoading.value = false; // 结束加载状态
  }
};



</script>

<style scoped>
.markdown-editor {
  margin: 20px;
  padding: 20px;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  background-color: #f9f9f9;
  width: 100vh;
}

.editor-title {
  font-size: 24px;
  margin-bottom: 20px;
}

.title-input,
.article-id-input,
.file-input {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.editor {
  margin-bottom: 20px;
}

.save-button {
  background-color: #409eff;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 8px 15px;
  cursor: pointer;
}

.message {
  margin-top: 10px;
  font-size: 14px;
  color: #d9534f;
}
</style>