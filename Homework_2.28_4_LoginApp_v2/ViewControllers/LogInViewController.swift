//
//  ViewController.swift
//  Homework_2.28_4_LoginApp_v2
//
//  Created by Ravil on 22.11.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    var user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutVC = navigationVC.topViewController as? AboutViewController else { return }
                aboutVC.user = user
            }
        }
    }
    
    @IBAction func logInButtonPressed() {
        guard usernameTF.text == user.login, passwordTF.text == user.password else {
            showAlert(
                title: "Error",
                message: "Wrong username or password",
                textField: passwordTF
            )
            return
        }
        
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        sender.tag == 10
            ? showAlert(title: "Oops!", message: "Your username is \(user.login)")
            : showAlert(title: "Oops!", message: "Your password is \(user.password)")
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue, sender: Any?) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
}


    

    
