<template>
	<div class="affix-container">
		<el-affix target=".affix-container" :offset="position">
			<div
				style="
					height: 60px;
					background-color: #fff;
					display: flex;
					align-items: center;
					border-bottom: 1px solid #ddd;
				"
			>
				<div style="flex: 1">
					<div
						style="
							padding-left: 20px;
							display: flex;
							align-items: center;
						"
					>
						<img
							src="@/assets/imgs/logo.png"
							alt=""
							style="width: 30px"
						/>
						<div
							style="
								font-weight: bold;
								font-size: 20px;
								margin-left: 3px;
							"
						>
							红色研学系统
						</div>
					</div>
				</div>

				<div style="border-right: 1px solid #ddd; flex: 5">
					<el-menu
						router
						style="border: none"
						mode="horizontal"
						:default-active="router.currentRoute.value.path"
						:default-openeds="[]"
					>
						<div v-for="(item, index) in itemList" :key="index">
							<div v-if="item.params.show === true">
								<template v-if="item.children == null">
									<el-menu-item
										:index="item.path"
										v-if="
											data.user.role ===
												item.params.role ||
											item.params.role == null
										"
									>
										<el-icon>
											<component :is="item.params.icon" />
										</el-icon>
										<span>{{ item.params.showText }}</span>
									</el-menu-item>
								</template>

								<template v-else>
									<el-sub-menu
										:index="item.params.index"
										v-if="
											data.user.role ===
												item.params.role ||
											item.params.role == null
										"
									>
										<template #title>
											<el-icon><Menu /></el-icon>
											<span>{{
												item.params.showText
											}}</span>
										</template>

										<div
											v-for="(
												subItem, subIndex
											) in item.children"
											:key="subIndex"
										>
											<el-menu-item :index="subItem.path">
												<el-icon>
													<component
														:is="
															subItem.params.icon
														"
													/>
												</el-icon>
												<span>{{
													subItem.params.showText
												}}</span>
											</el-menu-item>
										</div>
									</el-sub-menu>
								</template>
							</div>
						</div>

						<el-menu-item index="login" @click="logout">
							<el-icon><SwitchButton /></el-icon>
							<span>退出系统</span>
						</el-menu-item>
					</el-menu>
				</div>

				<div
					style="
						width: fit-content;
						padding-right: 10px;
						display: flex;
						align-items: center;
					"
				>
					<img
						style="width: 40px; height: 40px; border-radius: 50%"
						:src="
							data.user.avatar ||
							'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
						"
						alt=""
					/>
					<span style="margin-left: 5px">
						<div v-if="data.user.id != undefined">
							{{ data.user.name }}
						</div>
						<div v-else @click="login" style="cursor: pointer">
							请登录
						</div>
					</span>
				</div>
			</div>
		</el-affix>

		<div style="display: flex">
			<div style="flex: 1; background-color: #f8f8ff; padding: 5vh 10vh">
				<router-view @updateUser="updateUser" style="margin: 0 auto" />
			</div>
		</div>
	</div>
</template>

<script setup>
import { reactive, ref, onMounted, onBeforeUnmount } from "vue";
import router from "@/router";
import { ElMessage } from "element-plus";

const itemList = router.options.routes[0].children;

const data = reactive({
	user: JSON.parse(localStorage.getItem("system-user") || "{}"),
});

// if (!data.user?.id) {
// 	ElMessage.error("请登录！");
// 	router.push("/login");
// }
// console.log(data.user.id);

const updateUser = () => {
	data.user = JSON.parse(localStorage.getItem("system-user") || "{}");
};

const login = () => {
	router.push("/login");
};

const logout = () => {
	ElMessage.success("退出成功");
	localStorage.removeItem("system-user");
};

const lastScrollTop = ref(0);
const position = ref(0);

const handleScroll = () => {
	const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

	if (scrollTop > lastScrollTop.value) {
		position.value = -1000;
	} else {
		position.value = 0;
	}

	lastScrollTop.value = scrollTop <= 0 ? 0 : scrollTop; // 为了移动端或者负值滚动
};

onMounted(() => {
	window.addEventListener("scroll", handleScroll);
});

onBeforeUnmount(() => {
	window.removeEventListener("scroll", handleScroll);
});
</script>

<style scoped>
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
