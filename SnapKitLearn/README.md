1、在Podfile文件中添加`pod 'SnapKit', '~> 5.6.0'`

```swift
source 'https://github.com/CocoaPods/Specs.git'
platform:ios,'17.2'

target 'SnapKitLearn' do
 
pod 'Alamofire' #这里也可以是其他的第三方库
pod 'SnapKit', '~> 5.6.0'

end
```

2、执行`pod install`

