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

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
    
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
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (Action) in
            //delete string
        }
        
        alert.addAction(delete)
        self.present(alert, animated: true, completion: nil)
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



