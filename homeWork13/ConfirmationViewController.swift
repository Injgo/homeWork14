//
//  ConfirmationViewController.swift
//  homeWork13
//
//  Created by Dato on 10.07.22.
//

import UIKit

class ConfirmationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func yesClicked(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else { return }
        navigationController?.viewControllers = [vc]
    }
    
    @IBAction func noClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
