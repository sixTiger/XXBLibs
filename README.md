# XXBLib
#一些好用的工具类
常用的分类，工具类
##支持pod
```c
pod 'XXBLibs', :git => "https://github.com/sixTiger/XXBLibs"
```

##打包静态库
```c
//安装Pod插件
gem install cocoapods-packager
//打包成 .a
pod package XXBLibs.podspec  --library --force
//打包成FrameWork
pod package XXBLibs.podspec  --force
```
