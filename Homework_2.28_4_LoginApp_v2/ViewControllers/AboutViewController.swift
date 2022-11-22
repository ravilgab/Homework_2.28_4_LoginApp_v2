//
//  AboutViewController.swift
//  Homework_2.28_4_LoginApp_v2
//
//  Created by Ravil on 22.11.2022.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.person.fullName
        
        photoImage.image = UIImage(named: user.person.photo)

        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        bornLabel.text = user.person.born
        companyLabel.text = user.person.company
        positionLabel.text = user.person.position
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        photoImage.layer.cornerRadius = photoImage.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let biographyVC = segue.destination as? BiographyViewController else { return }
        
        biographyVC.user = user
    }
}
