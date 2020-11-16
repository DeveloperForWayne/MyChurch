//
//  RegistrationViewController.swift
//  MyChurch
//
//  Created by Wei Xu on 2020-11-11.
//

import UIKit
import CoreData

class RegistrationViewController: UIViewController {

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
            let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let user = User(context:myContext)
            user.userName=usernameTxt.text
            user.password=passwordTxt.text
            user.telephoneNo=telephoneTxt.text
            user.name=nameTxt.text
            user.email=emailTxt.text
            
            // save to the database
            do {
                try myContext.save()
                
                let box = UIAlertController(
                    title: "Success",
                    message: "User has been added.",
                    preferredStyle: .alert
                )
                box.addAction(
                    UIAlertAction(title:"OK", style: .default, handler:nil)
                )
                self.present(box, animated:true)
                return
            }
            catch {
                print("Save to DB error!")
            }
        }
    }

}
