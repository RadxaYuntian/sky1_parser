## 命令说明

### `parse`

主要的执行入口。会打印启动次数和内存测试结果。

默认使用`/dev/sda`，可通过`MEMTEST_DISK`环境变量进行更改。

默认会将日志文件移动到脚本所在目录的`logs`目录下。可通过`NO_COPY=true`环境变量关闭此行为。

### `parse_log`

实际的日志分析脚本。接受日志文件路径作为参数，调用`get_channel_id`进行解析，并返回`parse`打印的结果。

### `get_channel_id`

将报错的内存地址转换成对应的内存通道ID。

### `watch`

工厂产侧运行的脚本。会在前台持续运行并检测`/dev/sda`的插入事件，并调用`parse`。

可通过`MEMTEST_DISK`环境变量进行更改默认检测的磁盘，对后续自动调用的`parse`有效。

## 工厂部署

```bash
sudo apt update
sudo apt install inotify-tools git
git clone https://github.com/RadxaYuntian/sky1_parser.git
# optionally, set up passwordless sudo if udisksctl is nott working
sky1_parser/watch
```
