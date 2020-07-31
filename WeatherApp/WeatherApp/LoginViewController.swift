//
//  ViewController.swift
//  WeatherApp
//
//  Created by korolev-ap on 31.07.2020.
//  Copyright © 2020 Ontry. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var showPassword: Bool = false
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }

    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
          NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
          // Второе — когда она пропадает
          NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
      }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }

    
    @IBAction func showPasswordDidPressed(_ sender: Any) {
        if showPassword == false {
            passwordTextField.isSecureTextEntry = false
            showPassword = true
        }
        else
        {
            passwordTextField.isSecureTextEntry = true
            showPassword = false
        }
    }
    @IBAction func registrationDidPressed(_ sender: Any) {
        if loginTextField.text == "admin" && passwordTextField.text == "123456"{
            print("You are able to login")
        } else {
            print("not able to login")
        }
        
    }
}

