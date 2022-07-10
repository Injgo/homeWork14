//
//  ViewController.swift
//  homeWork13
//
//  Created by Dato on 05.07.22.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    private var name: String?
    private var email: String?
    private var password: String?
    
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
        
        vc.singedUPClosure = { name, email, password in
            self.name = name
            self.email = email
            self.password = password
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        if emailLabel.text == email && passwordLabel.text == password {
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
            vc.passedEmail = email
            vc.passedName = name
        }else if emailLabel.text?.count != 0 &&  passwordLabel.text?.count != 0{
            presentAlert()
        }
    }
    
    
    private func presentAlert() {
        let alert = UIAlertController(title: "Error", message: "incorrect credentials", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

