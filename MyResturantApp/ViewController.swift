//
//  ViewController.swift
//  MyResturantApp
//
//  Created by Zachary Aguon on 2/8/17.
//  Copyright © 2017 Zachary Aguon. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet var signInSelector: UISegmentedControl!
    
    @IBOutlet var signInLabel: UILabel!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var signInButton: UIButton!
    
    @IBOutlet var retypePasswordLabel: UILabel!
   
    @IBOutlet var retypePasswordTextField: UITextField!
    
    var isSignIn:Bool = true
    
    
    
    
    override func viewDidLoad() {
        
        retypePasswordLabel.isHidden = true
        retypePasswordTextField.isHidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func forgotPassword(_ sender: UIButton) {
        self.performSegue(withIdentifier: "forgotpwd", sender: nil)
        
    }
        @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        // flip the boolean
        isSignIn = !isSignIn
        
        // check the bool and set the button and labels
        if isSignIn {
            signInLabel.text = "Sign in"
            signInButton.setTitle("Sign in", for: .normal)
            retypePasswordLabel.isHidden = true
            retypePasswordTextField.isHidden = true
            
            
            
            
        }
        else {
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
            retypePasswordLabel.isHidden = false
            retypePasswordTextField.isHidden = false
            
        }
        
        
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        // Validation on the email and password
        
        if let email = emailTextField.text, let pass = passwordTextField.text
        {
            
            // Check if it's sign in or register
            if isSignIn {
                // Sign in the user with firebase
                FIRAuth.auth()?.signIn(withEmail: email, password: pass , completion: { (user, error) in
                
                    // Check that user isnt nill
                    if user != nil {
                        // User is found, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                        
                    }
                    else {
                        // Error: check error and show message
                    }
                    
                })
            }
            else {
                // Register the user with firebase
                FIRAuth.auth()?.createUser(withEmail: email, password: pass , completion: { (user, error) in
                
                    // Check that user isnt nill 
                    if user != nil {
                        // User is found go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                        
                    }
                    else {
                        // Error: check error and show message
                        
                    }
                })
                
            }
  
        
    }
}

}


    
    


