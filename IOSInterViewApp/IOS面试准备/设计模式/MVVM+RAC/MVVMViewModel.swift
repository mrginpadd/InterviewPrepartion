//
//  MVVMViewModel.swift
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/5.
//

// ViewModel 层负责从 Model 层获取数据，并通过 ReactiveSwift 提供数据流给 View 层。
import Foundation
import ReactiveSwift
import ReactiveCocoa

class MVVMViewModel {
  //通过信号传递User数据
    let user: Signal<User, Never>
    private let userService = UserService() //引用model层服务
    private let userObserver: Signal<User, Never>.Observer
    init() {
        let(userSignal, userObserver) = Signal<User, Never>.pipe()
        self.user = userSignal
        self.userObserver = userObserver
        
        //从model层获取数据并发送给View
        userService.fetchUserData { user in
          userObserver.send(value: user)
        }
    }
    
   //将用户的名字转换成字符串信号
    var userName: Signal<String, Never> {
        return user.map {$0.name}
    }
    //将用户的年龄转换成字符串信号
    var userAge: Signal<String, Never> {
        return user.map{"\($0.age)"}
    }
    
    func updateUser(name: String, age: Int) {
        let updateUser = User(name: name, age: age)
        userObserver.send(value: updateUser)
    }
}
