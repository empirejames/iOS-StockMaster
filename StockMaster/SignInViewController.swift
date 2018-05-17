 //
//  ViewController.swift
//  StockMaster
//
//  Created by 韋儒朱 on 2018/5/14.
//  Copyright © 2018年 韋儒朱. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailAccount: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background_sky.png")!)
        
        let iconWidth = 40;
        let iconHeight = 40;
        
        let imageView = UIImageView();
        let imageEmail = UIImage(named: "account.png");
        imageView.image = imageEmail;
        
        imageView.frame = CGRect(x: 5, y: 5, width: iconWidth, height: iconHeight)
        emailAccount.leftViewMode = UITextFieldViewMode.always
        emailAccount.addSubview(imageView)
        emailAccount.text = "b90797@yahoo.com"
        
        let imageViewPassword = UIImageView();
        let imagePassword = UIImage(named: "lock.png");
        
        imageViewPassword.image = imagePassword;
        imageViewPassword.frame = CGRect(x: 5, y: 5, width: iconWidth, height: iconHeight)
        password.leftViewMode = UITextFieldViewMode.always
        password.addSubview(imageViewPassword)
        password.text = "123456"
        
        //set Padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.emailAccount.frame.height))
        emailAccount.leftView = paddingView
        
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.emailAccount.frame.height))
        password.leftView = emailPaddingView
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.setToolbarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.setToolbarHidden(false, animated: animated)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func createAccountAction(_ sender: AnyObject) {
        
        if emailAccount.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailAccount.text!, password: password.text!) { (user, error) in
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    //self.navigationController?.pushViewController(vc!, animated: true)
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        
        if self.emailAccount.text == "" || self.password.text == "" {
            
            // 提示用戶是不是忘記輸入 textfield ？
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
                Auth.auth().signIn(withEmail: self.emailAccount.text!, password: self.password.text!) { (user, error) in
                
                if error == nil {
                    
                    // 登入成功，打印 ("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful

                    let myStoryBoard = UIStoryboard(name:"Main", bundle: nil)
                    print(myStoryBoard)
                    let targetController = myStoryBoard.instantiateViewController(withIdentifier: "Home") as! UIViewController
                    print(targetController)
                    self.present(targetController, animated: true)
                    //self.navigationController?.pushViewController(targetController, animated: true)
                    //let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    //self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    // 提示用戶從 firebase 返回了一個錯誤。
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
//    @IBAction func showMessage(){
//        let alertController = UIAlertController(title:"Wellcome",
//                                                message:"Hello",
//                                                preferredStyle: UIAlertControllerStyle.alert)
//    alertController.addAction(UIAlertAction(title:"OK",style:UIAlertActionStyle.default,handler:nil))
//            present(alertController,animated:true,completion:nil)
//    }

    
}



