//
//  MoreInfoViewController.swift
//  Homework_2.28_4_LoginApp_v2
//
//  Created by Ravil on 22.11.2022.
//

import UIKit

class BiographyViewController: UIViewController {
    
    @IBOutlet weak var biographyTextView: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(user.person.fullName)'s bio"
        
        biographyTextView.text = user.person.biography
    }
}
