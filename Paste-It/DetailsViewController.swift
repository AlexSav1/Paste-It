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
    var copies = [String]()
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = copyText
    
    }

    @IBAction func deletePressed(_ sender: Any) {
        
        let index = copies.index(of: copyText!)
        copies.remove(at: index!)
        UserDefaults.standard.set(copies, forKey: "copies")
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
}
