## mutating

```c++
struct Person {
    var age = 0
    //实例方法中是不可以修改值类型的属性，使用mutating后可修改属性的值
    mutating func del() {
        age = 11
    }
}
```

## 协议 protocol

协议是一个变量和函数列表。

