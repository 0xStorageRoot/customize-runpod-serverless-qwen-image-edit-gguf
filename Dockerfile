# 使用 RunPod worker-comfyui 5.5.0 基础镜像
FROM runpod/worker-comfyui:5.5.0-base

# 安装 ComfyUI-GGUF 自定义节点插件
RUN comfy-node-install ComfyUI-GGUF

# 下载 Qwen Image Edit GGUF 模型文件 (16.8 GB)
RUN comfy model download --url https://huggingface.co/QuantStack/Qwen-Image-Edit-GGUF/resolve/main/Qwen_Image_Edit-Q6_K.gguf --relative-path models/diffusion_models --filename Qwen_Image_Edit-Q6_K.gguf

# 下载 VAE 模型文件 (254 MB)
RUN comfy model download --url https://huggingface.co/Qwen/Qwen-Image-Edit/resolve/main/vae/diffusion_pytorch_model.safetensors --relative-path models/vae --filename qwen_image_edit_vae.safetensors

# 下载 Text Encoder 模型文件
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors --relative-path models/text_encoders --filename qwen_2.5_vl_7b_fp8_scaled.safetensors

# 下载 Qwen Image Lightning 模型文件
RUN comfy model download --url https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V1.0.safetensors --relative-path models/loras --filename Qwen-Image-Lightning-4steps-V1.0.safetensors

# 可选：如果您有静态输入文件，可以取消注释下面的行
# COPY input/ /comfyui/input/