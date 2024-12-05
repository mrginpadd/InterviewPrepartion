//
//  MVVMUserModel.swift
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/5.
//

//Model 层负责定义数据结构以及处理和提供数据。这

import Foundation

//1.定义Model层的模型类

struct User {
    let name: String
    let age: Int
}


//2.创建一个模拟服务，用来获取用户数据

class UserService {
    //模拟异步网络请求或数据库查询
    func fetchUserData(completion: @escaping(User) -> Void) {
        //模拟延时操作
        DispatchQueue.global().asyncAfter(deadline: .now()+2, execute: {
            //假设返回的用户数据
            let user = User(name: "张三", age: 40)
            completion(user)
        })
    }
}
