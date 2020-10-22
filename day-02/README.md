# Project 1: WeSplit (Part Two)

[https://www.hackingwithswift.com/100/swiftui/17](https://www.hackingwithswift.com/100/swiftui/17)

# 笔记

## Topics

 * Reading text from the user with TextField
 * Creating pickers in a form
 * Adding a segmented control for tip percentages
 * Calculating the total per person

## Reading text from the user with TextField

``` swift
TextField("Amount", text: $checkAmount)
    .keyboardType(.decimalPad)
```

通过 `@State` 可以将 `checkAmount` 绑定到 `TextField` 控件上，如果使用 `@State` 修复的属性值发生了变化，SwiftUI 就会自动的刷新 View。

## Creating pickers in a form

通过 `Picker` 和 `ForEach`，可以方便的设置 Picker 中选项的样式与数据。

``` swift
Picker("Number of people", selection: $numberOfPeople) {
    ForEach(2..<100) {
        Text("\($0) People")
    }
}
```

## Adding a segmented control for tip percentages

`Picker` 组件可以通过添加 `pickerStyle()` modify 来设置 Picker 的样式，例如可以通过 `.pickerStyle(SegmentedPickerStyle())` 设置 Picker 为 SegmentControl 的样式。

## Calculating the total per person
