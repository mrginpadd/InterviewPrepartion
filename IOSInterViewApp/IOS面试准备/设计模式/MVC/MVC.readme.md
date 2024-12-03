

https://juejin.cn/post/6964252878726758407?searchId=2024120308354918ACDCD75ED5DC4ED92A

文章以 OC 代码为例，探讨了 iOS 架构从传统 MVC 到 MVP 再到 MVVM 的演变。
MVC 简单易上手但 Controller 易臃肿；
MVP 实现了 View 与 Model 分离，业务逻辑在 Presenter 层；
MVVM 在 MVP 基础上加入双向绑定机制。

最后指出应根据业务需求选择合适架构，文中观点含主观成分，相关 Demo 已上传。

用户点击 View(视图) --> 视图响应事件 -->通过代理传递事件到Controller-->发起网络请求更新Model--->Model处理完数据-->代理或通知给Controller-->改变视图样式-->完成


# MVC
工作原理
Model（模型）：Person 类包含了一个人的信息（name 和 age）。它还提供了一个方法 increaseAge() 来增加年龄。
View（视图）：PersonView 类负责显示数据。在这个例子中，UILabel 被用来显示 name 和 age。
Controller（控制器）：ViewController 类负责协调模型和视图。它创建了一个 Person 对象（模型）和一个 PersonView 对象（视图）。当用户点击按钮时，控制器会更新模型中的数据，并通过 PersonView 来更新显示。

总结
M：Model（模型）负责存储和处理数据，以及处理部分的业务逻辑

View（视图）负责数据的展示和事件捕捉

C：Controller / ViewController / VC（控制器）负责协调Model 和 View，处理大部分逻辑



