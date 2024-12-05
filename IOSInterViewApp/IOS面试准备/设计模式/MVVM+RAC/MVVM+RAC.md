#  MVVM+RAC

该文章很好的介绍了RAC  ReactiveCocoa 的基本使用
https://juejin.cn/post/6953808004307222564
MVVM+RAC原文
https://juejin.cn/post/6964252878726758407?searchId=2024120308354918ACDCD75ED5DC4ED92A
结论：
RAC的高内聚，低耦合特性，很好的配合了MVVM的使用。
因此如果现在正在使用MVVM模式开发，不妨试一下RAC框架。

还有一个用处很大的评论：
关键是OC版本的RAC已经止步不更了，后续的RAC都是基于Swift的了，用Swift编程的话一般又都会选择RxSwift


在iOS开发中，MVVM（Model-View-ViewModel）和RAC（ReactiveCocoa）是常见的设计模式和框架组合，用于提升代码的可维护性、可重用性和响应式编程体验。MVVM 是一种架构模式，它将界面层和业务逻辑层分开，便于进行单元测试和代码管理。而 ReactiveCocoa（RAC）是一个响应式编程框架，它通过响应式的数据流和事件传递机制，帮助你更轻松地管理异步操作和事件驱动的交互。

Model：表示数据层，通常是一些模型对象，负责提供和管理数据。它不关心视图如何呈现数据。
View：表示视图层，负责显示 UI，并通过绑定从 ViewModel 获取数据来更新显示。
ViewModel：是 View 和 Model 之间的桥梁，负责从 Model 获取数据并处理业务逻辑，然后将数据暴露给 View。它不直接操作视图，只通过绑定通知视图更新。



ReactiveCocoa 是一个函数响应式编程（FRP）框架，它通过 Signal（信号流）和 Observer（观察者）来处理异步事件、数据流和 UI 交互。RAC 允许你以声明式的方式管理数据绑定和事件响应，减少了 UI 控制器中的逻辑代码，使得代码更具可测试性。


在将 MVVM 和 RAC 结合时，通常会通过 RAC 来进行 View 和 ViewModel 之间的数据绑定，使得 ViewModel 在数据更新时自动通知 View 更新，从而简化了手动更新 UI 的过程。



