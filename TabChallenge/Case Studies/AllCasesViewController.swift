//
//  AllCasesViewController.swift
//  TabChallenge
//
//  Created by Spare on 02/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

class AllCasesViewController: UIViewController {

    @IBOutlet private weak var tabLogoImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabLogoImage()
        }
    
    private func setupTabLogoImage() {
        tabLogoImage.layer.cornerRadius = 8.0
        tabLogoImage.clipsToBounds = true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
