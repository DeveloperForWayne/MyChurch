//
//  RegistrationViewController.swift
//  MyChurch
//
//  Created by Wei Xu on 2020-11-11.
//

import UIKit
import CoreData

class RegistrationViewController: UIViewController {

    let userController = UserController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var telephoneTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Actions
    @IBAction func registerPressed(_ sender: Any) {
        if(usernameTxt.text=="" || passwordTxt.text=="" || nameTxt.text=="" || telephoneTxt.text=="" || emailTxt.text=="") {
            
            // Input check
            let box = UIAlertController(
                title: "Input Error",
                message: "Please input all items!",
                preferredStyle: .alert
            )
            box.addAction(
                UIAlertAction(title:"OK", style: .default, handler:nil)
            )
            self.present(box, animated:true)
            return
        } else {
            
            let result = userController.createUser(username: usernameTxt.text!, password: passwordTxt.text!, telephone: telephoneTxt.text!, name: nameTxt.text!, email: emailTxt.text!)
            
            if(result == .INSERT_SUCCESS) {
                let box = UIAlertController(
                    title: "Success",
                    message: "User has been added.",
                    preferredStyle: .alert
                )
                
                // show finish message
                box.addAction(
                    UIAlertAction(title:"OK", style: .default, handler:nil)
                )
                self.present(box, animated:true)
                return
            }
        }
    }

}
