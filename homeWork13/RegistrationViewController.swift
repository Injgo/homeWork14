//
//  RegistrationViewController.swift
//  homeWork13
//
//  Created by Dato on 05.07.22.
//

import UIKit


class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UITextField!
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet var passwordLabel: UITextField!
    
    @IBOutlet weak var confirmPasswordLable: UITextField!
    
    var singedUPClosure: ((String, String, String) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func singUpButton(_ sender: Any) {
        
        let textfieldsArray = [userNameLabel, emailLabel, passwordLabel]
        guard let password =  passwordLabel.text else { return }
        let validation =  isPasswordValid(password)
        
        if validation {
            if passwordLabel.text != confirmPasswordLable.text && passwordLabel.text != "" && passwordLabel.text != nil {
                presentAlert(errorMessage: "passwords doesn't match" )
            } else {
                var allFilled = true
                for textfield in textfieldsArray {
                    if textfield?.text?.count == 0 || textfield?.text == nil {
                        textfield?.attributedPlaceholder = NSAttributedString(string: textfield?.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
                        allFilled = false
                    }
                }
                if allFilled {
                    singedUPClosure(userNameLabel.text!, emailLabel.text!, passwordLabel.text!)
                }
            }
        }else {
            presentAlert(errorMessage: "password must be at least 8 characters, one alphabet and one special character ( [$@$#!%?&] )")
        }
        
        
        
        
    }
    
    
    private func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    
    private func presentAlert( errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
