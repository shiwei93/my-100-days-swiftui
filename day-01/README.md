# Project 1: WeSplit (Part One)

[https://www.hackingwithswift.com/100/swiftui/16](https://www.hackingwithswift.com/100/swiftui/16)

# 笔记

## Topics

 * WeSplit: Introduction
 * Understanding the basic structure of a SwiftUI app
 * Creating a form
 * Adding a navigation bar
 * Modifying program state
 * Binding state to user interface controls
 * Creating views in a loop

## WeSplit: Introduction

WeSplit 是一个用于计算账单 AA 的 App。

## Understanding the basic structure of a SwiftUI app

 * 从 Xcode 11 开始，新建的工程项目使用 `SceneDelegate` 替代了原先的 `AppDelegate`。用于配置独立的 windows 用于应用多开
 * Xcode 12 新建 SwiftUI 工程，使用了 `{ProjectName}App.swift` 替代了 `SceneDelegate`，以 WeSplit 为例
    ``` swift
    @main
    struct WeSplitApp: App {
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }
    ```
 * `ContentView.swift` 是 SwiftUI 项目的默认程序入口

## Creating a form

Form 类似于 Static TableView。

## Adding a navigation bar

SwiftUI 中通过 `NavigationView` 为 View 添加导航栏

> navigation bar 的标题使用 navigationBarTitle 设置，但该 modify 不能直接作用于 NavigationView，而是需要使用到 NavigationView 内部的 View 上。

## Modifying program state

SwiftUI 中 view 都是结构体，意味着我们不能直接修改属性值，例如下面的代码将无法编译

``` swift
struct ContentView: View {
    var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}
```

Swift 5.1 引入了 property wrapper 的概念，解决了这一问题。通过将计算属性与结构体进行分离，使得属性值可以被修改。

``` swift
struct ContentView: View {
    @State private var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}
```

Property wrapper 的相关文章

 * [SE-0258: Property Wrappers](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md)
 * [NSHipster](https://nshipster.com/propertywrapper/)

## Creating views in a loop

SwiftUI 中可以使用 `ForEach` 来构建 View，可以传递一系列值，构建任意动态的列表视图。

``` swift
struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
    }
}
```
