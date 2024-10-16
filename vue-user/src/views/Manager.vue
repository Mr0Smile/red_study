<template>
	<div class="container">
		<stickyNavbar />

		<div style="display: flex">
			<div class="view-container" style="flex: 1">
				<router-view @updateUser="updateUser" style="margin: 0 auto" />
			</div>
		</div>
	</div>
</template>

<script setup>
import { reactive } from "vue";

import stickyNavbar from "../components/stickyNavbar.vue";

const data = reactive({
	user: JSON.parse(localStorage.getItem("system-user") || "{}"),
});

const updateUser = () => {
	data.user = JSON.parse(localStorage.getItem("system-user") || "{}");
};
</script>

<style scoped>
.container {
	width: 100%;
	background-image: url("../assets/imgs/background.png");
	background-repeat: repeat-y;
}

.view-container {
	padding: 5vh 10vh;
}

.el-menu-item.is-active {
	background-color: #e0edfd !important;
}
.el-menu-item:hover {
	color: #1967e3;
}
:deep(th) {
	color: #333;
}
</style>
