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
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
        
        textLabel.text = copyText
        textView.text = copyText
    
    }
    
    /*func textFieldDidEndEditing(_ textField: UITextField) {
        
        let newText = textField.text
        
        let index = copies.index(of: copyText!)
        copies[index!] = newText!
        UserDefaults.standard.set(copies, forKey: "copies")
    }*/
    
    @IBAction func deletePressed(_ sender: Any) {
        
        let index = copies.index(of: copyText!)
        copies.remove(at: index!)
        UserDefaults.standard.set(copies, forKey: "copies")
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
}

extension DetailsViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let newText = textView.text
        
        let index = copies.index(of: copyText!)
        copies[index!] = newText!
        copyText = newText!
        UserDefaults.standard.set(copies, forKey: "copies")
    }
    
}



