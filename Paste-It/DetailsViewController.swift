//
//  DetailsViewController.swift
//  Paste-It
//
//  Created by Aditya Narayan on 5/31/17.
//
//

import UIKit

class DetailsViewController: UIViewController {

    var copyText: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = copyText
    }

}
