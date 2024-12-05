//
//  MVVMViewController.swift
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/5.
//

// ViewController 层负责绑定 ViewModel 的信号到 UI 元素上，以更新界面。
import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift

@objcMembers class MVVMViewController: UIViewController {
    var nameLabel: UILabel?
    var ageLabel: UILabel?
    
    var nameTextField: UITextField?
    var ageTextField: UITextField?
    var updateButton: UIButton?
    
    var viewModel: MVVMViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化 ViewModel
        viewModel = MVVMViewModel()
        
        //设置UI
        setupViews()
        
        //绑定用户的名字到UI
        viewModel?.userName
            .observe(on: UIScheduler()) //确保UI更新在主线程
            .observeValues{ [weak self] name in
        self?.nameLabel?.text = "姓名： \(name)"
    }
        
        //绑定用户的年龄到UI
        viewModel?.userAge
            .observe(on: UIScheduler()) //确保UI更新在主线程
            .observeValues{[weak self] age in
                self?.ageLabel?.text = "年龄： \(age)"
            }
    }
    
    func setupViews() {
        self.view.backgroundColor = .white
        // 创建并配置 nameLabel
        nameLabel = UILabel()
        nameLabel!.translatesAutoresizingMaskIntoConstraints = false
        nameLabel!.font = UIFont.systemFont(ofSize: 20)
        nameLabel!.textColor = .black
        nameLabel!.text = "xx"
        view.addSubview(nameLabel!)
        
        // 创建并配置 ageLabel
        ageLabel = UILabel()
        ageLabel!.translatesAutoresizingMaskIntoConstraints = false
        ageLabel!.font = UIFont.systemFont(ofSize: 20)
        ageLabel!.textColor = .black
        ageLabel!.text = "00"
        view.addSubview(ageLabel!)
        
        nameTextField = UITextField()
        nameTextField!.translatesAutoresizingMaskIntoConstraints = false
        nameTextField!.font = UIFont.systemFont(ofSize: 20)
        nameTextField!.textColor = .blue
        nameTextField!.borderStyle = .roundedRect
//        nameTextField!.placeholder = "请输入姓名"
        let nameTextFieldAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        nameTextField?.attributedPlaceholder = NSAttributedString(string: "请输入姓名", attributes: nameTextFieldAttributes)
        view.addSubview(nameTextField!)
        
        ageTextField = UITextField()
        ageTextField!.translatesAutoresizingMaskIntoConstraints = false
        ageTextField!.font = UIFont.systemFont(ofSize: 20)
        ageTextField!.textColor = .blue
        ageTextField!.borderStyle = .roundedRect
//        ageTextField!.placeholder = "请输入年龄"
        let ageTextFieldAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 14)
        ]
        ageTextField!.attributedPlaceholder = NSAttributedString(string: "请输入年龄", attributes: ageTextFieldAttributes)
        view.addSubview(ageTextField!)
        
        updateButton = UIButton()
        updateButton!.translatesAutoresizingMaskIntoConstraints = false
        updateButton!.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        updateButton!.setTitle("设置", for: .normal)
        updateButton!.setTitleColor(.red, for: .normal)
        updateButton!.backgroundColor = .gray
        updateButton?.addTarget(self, action: #selector(updateUser) , for: .touchUpInside)
        view.addSubview(updateButton!)
        
        // 设置约束
        NSLayoutConstraint.activate([
            nameLabel!.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameLabel!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            ageLabel!.topAnchor.constraint(equalTo: nameLabel!.bottomAnchor, constant: 20),
            ageLabel!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nameTextField!.topAnchor.constraint(equalTo: ageLabel!.bottomAnchor, constant: 30),
            nameTextField!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ageTextField!.topAnchor.constraint(equalTo: nameTextField!.bottomAnchor, constant: 30),
            ageTextField!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            updateButton!.topAnchor.constraint(equalTo: ageTextField!.bottomAnchor, constant: 30),
            updateButton!.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    func updateUser() {
        viewModel?.updateUser(name: nameTextField?.text ?? "", age: Int(ageTextField?.text ?? "") ?? 0)
    }
}
