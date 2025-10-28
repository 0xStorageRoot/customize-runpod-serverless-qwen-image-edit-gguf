# 使用 RunPod worker-comfyui 5.5.0 基础镜像
FROM runpod/worker-comfyui:5.5.0-base

# 安装 ComfyUI-GGUF 自定义节点插件
RUN comfy-node-install ComfyUI-GGUF

# 默认models就在/runpod-volume/models