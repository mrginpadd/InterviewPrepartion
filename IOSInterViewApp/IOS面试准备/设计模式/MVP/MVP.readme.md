#  MVP

用户点击 View(视图) --> 视图响应事件 -->通过代理传递事件到Presenter-->发起网络请求更新Model-->Model处理完数据-->代理或通知给视图(View或是Controller)-->改变视图样式-->完成

MVP（Model-View-Presenter）是一种常见的架构模式，常用于分离应用中的逻辑层、显示层和控制层。在这个模式中，Model 表示数据层，View 表示用户界面层，Presenter 作为中介，负责从 Model 获取数据并将数据展示给 View。与 MVC 模式不同，MVP 强调了 Presenter 的角色，它作为 View 和 Model 之间的唯一沟通者，处理所有的业务逻辑和视图更新。



M: Model 
    数据层，负责网络数据的处理，数据持久化存储和读取等工作

V: View 视图层，负责呈现从数据层传递的数据渲染工作，以及与用户的交互，这里把Controller层也合并到视图层

P: Presenter层，负责视图需要数据的获取，获取到数据后刷新视图。响应View的事件和作为View的代理。



