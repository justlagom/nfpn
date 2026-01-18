# nfpn

-----
# 🚀 Hugging Face - Hugging Face ENC+Vioion-Xhttp-ARGO 代理节点

[](https://www.google.com/search?q=https://github.com/justlagom/hfne)
[](https://huggingface.co/new-space)

一个部署在 **Hugging Face Spaces** 上的 **ENC+Vioion-Xhttp-ARGO** 代理节点项目。利用 Hugging Face Spaces 的免费算力和环境，为您提供一个快速且可定制的代理服务。

## ✨ 主要特性

  * **多协议支持:** 集成了 **ENC**、**Vioion**、**Xhttp**和 **ARGO** 代理协议。
  * **平台优势:** 部署在 Hugging Face Spaces，享受稳定的容器环境和便捷的部署流程。
  * **灵活配置:** 所有核心配置通过环境变量传入，部署维护简便。

## ⚙️ 部署指南 (Hugging Face Spaces)

部署此项目非常简单，主要通过配置 Hugging Face Spaces 的环境变量完成。

## hfne/app/xy/config.json-可选择手搓修改xray配置（例如path路径同时注意修改nginx分流路径设置）

## 节点参考模板： ##

**vless://%E8%87%AA%E5%AE%9A%E4%B9%89UUID@优选ip:443?encryption=mlkem768x25519plus.native.0rtt.fRLKjkBNx1N6ceiqcqilb46WNj4yvl4SgXklAFkvNhE&flow=xtls-rprx-vision&security=tls&sni=%E5%9B%BA%E5%AE%9A%E9%9A%A7%E9%81%93&fp=chrome&alpn=h2&insecure=0&allowInsecure=0&type=xhttp&path=%E8%87%AA%E5%AE%9A%E4%B9%89%E8%B7%AF%E5%BE%84&mode=auto#ENC%2BVision-Xhttp-ARGO**

-----

### 步骤 1: 创建新的 Space

1.  访问 [Hugging Face Spaces](https://huggingface.co/new-space) 创建新项目。
2.  **Space Name:** 为您的项目命名 (例如 `hfne-proxy`)。
3.  **Space SDK:** 选择 **`Docker`** (推荐使用 Docker SDK 以确保环境一致性)。
4.  **License:** 选择合适的许可证。
5.  点击 **"Create Space"**。

### 步骤 2: 上传 `Dockerfile` 和代码

由于您使用的是 Docker SDK，您需要将本项目仓库中的所有文件（特别是 `Dockerfile` 和您的核心代码）上传到新的 Space 仓库中。

> **提示:** 您可以直接 Fork `justlagom/hfne` 仓库，然后创建自己的docker镜像文件。
> 找到 **"files"** 编辑dockerfile - from ghcr.io/自己的镜像名称
> **Commint changes to main**

### 步骤 3: 配置环境变量

在您的 Hugging Face Space 页面，导航到 **"Settings"** (设置) 选项卡，找到 **"Repository secrets"** 或 **"Environment variables"** (环境变量) 部分，并添加以下核心配置：

| 变量名 | 描述 | 示例值 |
| :--- | :--- | :--- |
| **`CLOUDFLARED_TOKEN`** | 必备 | `设置cf tunel时获取token（镜像默认localhost:8001）` |
| **`UUID`** | 自定义uuid-必需 | `5936acb6-e65e-4631-bedf-ce723a1a375d` |
| **`PROXY_PATH`** | 自定义path-必需 | `/5936acb6` |
| **`DOMAIN`** | 容器本地域名(首次部署后可见)-必需 | `xxx-xxx.hf.space` |

### 步骤 4: 启动 Space

配置完成后，Hugging Face Spaces 会自动根据 `Dockerfile` 构建并启动服务。

  * **检查状态:** 在 **"Logs"** (日志) 选项卡中，您可以监控服务的启动状态。
  * **获取URL:** 部署成功后，您的代理服务将通过 Hugging Face Spaces 的公共 URL 暴露。

## 🔌 连接信息

您的代理服务的最终连接地址将是您的 **Hugging Face Space URL** 加上您在 `ENC_CONFIG` 中配置的 **Path**。

> **示例:**
>
>   * **Space URL:** `https://[您的用户名]-[Space名称].hf.space`
>   * **`ENC_CONFIG` Path:** `/hf-v2ray`
>   * **最终代理地址:** `https://[您的用户名]-[Space名称].hf.space/hf-v2ray`

## ⚠️ 注意事项

  * **资源限制:** Hugging Face Spaces 的免费层级有资源使用限制。请合理使用，避免因超限而被暂停。
  * **安全:** 请务必使用复杂且不易猜测的 **Path** 和 **UUID**，以增强您的代理节点的安全性。

-----

## 🛠️ 本地开发与测试

如果您需要本地测试，请确保您已安装 Docker 环境：

```bash
# 克隆项目
git clone https://github.com/justlagom/hfne.git
cd hfne

# (可选) 在本地创建一个 .env 文件来设置您的 ENC_CONFIG

# 构建 Docker 镜像
docker build -t hfne:latest .

# 运行容器 (替换为您的配置)
docker run -d -p 8080:8080 \
  -e ENC_CONFIG='{"uuid": "your-uuid", "path": "/testpath", "port": 8080}' \
  hfne:latest
```

## 📄 License

该项目基于 **MIT License** 发布。

-----

希望这份 README 能够清晰地展示您的项目！

