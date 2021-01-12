//
//  ViewController.swift
//  MyChurch
//
//  Created by Wei Xu on 2020-11-09.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let userController = UserController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var errorMsgTxt: UILabel!
    
    // MARK: Actions
    
    @IBAction func loginPressed(_ sender: Any) {
        if(usernameTxt.text=="" || passwordTxt.text=="") {
            
            // Input check
            let box = UIAlertController(
                title: "Input Error",
                message: "Both Username and password are required!",
                preferredStyle: .alert
            )
            box.addAction(
                UIAlertAction(title:"OK", style: .default, handler:nil)
            )
            self.present(box, animated:true)
            return
        } else {
            let count = self.userController.checkUser(username: usernameTxt.text!, password: passwordTxt.text!)

            if count == 0 {
                errorMsgTxt.isHidden=false
                errorMsgTxt.text="Username or password is incorrect!"
            }
            else {
                // Move to main view controller
                if let tabViewController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabBarCtl") as? UITabBarController {
                    tabViewController.modalPresentationStyle = .fullScreen
                    present(tabViewController, animated: true, completion: nil)
                }
            }
        }
    }
}

