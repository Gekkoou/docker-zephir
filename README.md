# docker-zephir 编译生成各php版本扩展

不重复造轮子, `Dockfile` 文件 copy `p神`  写的 (~~其实就是自己菜~~)

可自行 `docker build` 和 `docker run` 构建镜像与生成容器, 然后挂载目录在容器里进行各种骚操作

```shell
docker build -t zephirphp:5.6 .
docker run -it --rm --name zephir $(pwd):/zephir zephir-php:5.6 /bin/sh

# 容器里
cd /zephir
zephir init test
zephir build
```

需要其他php版本修改 `Dockfile` 文件第一行 `FROM php:5.6`, 例如 `FROM php:7.2`

----

文件夹 `test` 为测试实验项目, 可用 `zephir` 语法修改 `/test/test/hello.zep` 的内容, 编译生成自己的php扩展

编译生成5.4~7.2版本下所有扩展：
```
bash builds.sh
```
只生成某个PHP版本的扩展：
```
docker run -it --rm --name zephir -v $(pwd):/zephir tuwen/zephir:5.6 bash /zephir/build-ext.sh
```
----

参考
> p神博客: https://www.leavesongs.com

> zephir官方文档: https://docs.zephir-lang.com/en/
