//
//  ForgotPassword.swift
//  MyResturantApp
//
//  Created by Zachary Aguon on 2/13/17.
//  Copyright © 2017 Zachary Aguon. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class ForgotPassword: UIViewController {

    @IBOutlet var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "backHome", sender: self)
    }
    @IBAction func submitEmailButton(_ sender: Any)
    {
        if self.email.text == ""
        {
            let alertcontroller = UIAlertController(title: "Oops", message: "Please enter email", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertcontroller.addAction(defaultAction)
            
            self.present(alertcontroller, animated: true, completion: nil)
            
        }
        else
        {
            
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.email.text!, completion: {(Error) in
                
                var title = ""
                var message = ""
                
                if Error != nil
                {
                    title = "Oops"
                    message =  (Error?.localizedDescription)!
                }
                else {
                    title = "Success!"
                    message = "Password Reset to email sent"
                    self.email.text = ""
                }
                
                        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertcontroller.addAction(defaultAction)
                        
                        self.present(alertcontroller, animated: true, completion: nil)
                
                
                
            })
            }
            
            
        }



    
}

