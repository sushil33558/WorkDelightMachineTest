//
//  LoginViewController.swift
//  WDTestApp
//
//  Created by Sushil Chaudhary on 9/29/22.
//

import UIKit
class LoginViewController: UIViewController {
    //MARK: - iBOutlet
    //------------------
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    //MARK: - variables
    //------------------
    var viewModel = UserLoginViewModel()
    
    //MARK: - lifeCycles
    //------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTxtFld.text = "demo123@yopmail.com"
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - iBACtion
    //------------------
    @IBAction func signInBtn(_ sender: UIButton) {
        loginApi()
    }
    
    //MARK: - function()
    //------------------
    func loginApi(){
        viewModel.userLoginAPI(email: self.emailTxtFld.text ?? "", password:self.passwordTxtFld.text ?? "") { (isSuccess, message) in
            if isSuccess{
                print("-----------API hit----------------")
                //tokenStoreInUserDefault
                let token = UserDefaults.standard.set("\(String(describing: self.viewModel.model?.data.token ?? ""))", forKey: "token")
                UserDefaults.standard.setValue(true, forKey:"Login")
                print("Savedtoken: -\(token)")
                let storyboard = UIStoryboard(name: "WDTest", bundle: nil)
                let homeVC = storyboard.instantiateViewController(identifier: "HomeVC") as! HomeViewController
                self.navigationController?.pushViewController(homeVC, animated: true)
            }else{
                let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: - @objc func()
    //------------------
}
