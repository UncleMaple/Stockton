# stockton

malone项目的客户端应用，支持android和ios

## 项目结构

| 包名     | 介绍                                                |
|:--------|:----------------------------------------------------|
| util    | 一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等 |
| l10n    | 国际化相关的类都在此目录下                              |
| models  | Json文件对应的Dart Model类会在此目录下                 |
| states  | 保存APP中需要跨组件共享的状态类                         |
| routes  | 存放所有路由页面类                                     |
| widgets | APP内封装的一些Widget组件都在该目录下                   |

## model

```
// member字段
id
created_at
updated_at
deleted_at
deleted_at
phone_num // 注册时必填
password
email
account // 只登录时用到，可以是邮箱或手机号
avatar
gender
nickname
memo // 备注
online // 在线状态
salt
token
```

## ui构想

* 底部状态栏参考实况足球手游, 做成显示在上方 左右滑动的形式

## 进度

* 8.1-now(8.4):
  * [x] 登录注册界面已完成
  * [x] themeData设计已完成
  * [ ] 登录注册逻辑实现开发中
  * [ ] 底层框架搭建开发中

## 需要改进

* lib/util/HexColor.dart 改用flutter原生颜色管理

## last temp
lib/presentation/home/stockton_drawer.dart 38:47

