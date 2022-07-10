//
//  DetailViewController.swift
//  homeWork13
//
//  Created by Dato on 10.07.22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var passedEmail: String!
    var passedName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = passedEmail
        usernameLabel.text = passedName
    }
    @IBAction func signOutClicked(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ConfirmationViewController") as? ConfirmationViewController else { return }

        navigationController?.pushViewController(vc, animated: true)
    }
}
