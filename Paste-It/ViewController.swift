//
//  ViewController.swift
//  Paste-It
//
//  Created by Aditya Narayan on 5/31/17.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var copies = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //UserDefaults.standard.set(copies, forKey: "copies")
        
        let arrayOfCopies = UserDefaults.standard.value(forKey: "copies")
        
        if arrayOfCopies == nil{
            print("papa")
        } else {
            
        
        
            guard let myCopies = arrayOfCopies as? [String] else {
                return
            }
        
            copies = myCopies
            
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return copies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PasteItTableViewCell ?? PasteItTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.detailButton.tag = indexPath.row
        cell.detailButton.addTarget(self, action: #selector(showTextDetail(sender:)), for: .touchUpInside)
            //?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        
        
        // Configure the cell...
        
        cell.theLabel.text = copies[indexPath.row]
        
        return cell
    }
    
    func showTextDetail(sender: UIButton){
        
        let textToShow = copies[sender.tag]
    
        print(sender.tag)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        //self.performSegue(withIdentifier: "showDetails", sender: self)
        let alert = UIAlertController(title: "New Message", message: nil, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            if let newMessage = alert.textFields?[0].text{
                self.copies.append(newMessage)
                UserDefaults.standard.set(self.copies, forKey: "copies")
                self.tableView.reloadData()
            }
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (cool) in
            
        }
        
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        alert.addTextField { (textField) in
            textField.placeholder = "Message"
            textField.keyboardType = .default
        }
        
        self.present(alert, animated: true, completion: nil)
    }

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailsViewController
        
        
        
    }
    */
}

