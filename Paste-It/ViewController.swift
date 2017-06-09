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
    
// MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Paste-It"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor(colorLiteralRed: 0.03, green: 0.25, blue: 0.6, alpha: 0.6)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let arrayOfCopies = UserDefaults.standard.value(forKey: "copies")
        
        if arrayOfCopies == nil{
            print("no user defaults")
        } else {
            
            guard let myCopies = arrayOfCopies as? [String] else {
                return
            }
            
            copies = myCopies
            
        }
        
        tableView.reloadData()
    }
    

    
// MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return copies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        UIPasteboard.general.string = copies[indexPath.row]
        
        let alert = UIAlertController(title: "Copied!", message: nil, preferredStyle: .alert)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            alert.dismiss(animated: true, completion: nil)
        }
    
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            copies.remove(at: indexPath.row)
            UserDefaults.standard.set(self.copies, forKey: "copies")
            tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PasteItTableViewCell ?? PasteItTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.detailButton.tag = indexPath.row
        cell.detailButton.addTarget(self, action: #selector(showTextDetail(sender:)), for: .touchUpInside)
        

        // Configure the cell...
        //cell.theLabel.font = UIFont(name: "attack of the cucumbers", size: 17)
        cell.theLabel.text = copies[indexPath.row]
        
        return cell
    }
    
    
//MARK: - Button Actions
    
    func showTextDetail(sender: UIButton){
        
        let textToShow = copies[sender.tag]
        self.performSegue(withIdentifier: "showDetails", sender: textToShow)
        print(sender.tag)
    }
    
    
    @IBAction func pasteButtonPressed(_ sender: Any) {
        
        if let newString = UIPasteboard.general.string{
            copies.insert(newString, at: 0)
            UserDefaults.standard.set(self.copies, forKey: "copies")
            tableView.reloadData()
        }
        
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

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailsViewController
        
        vc.copyText = sender as? String
        vc.copies = copies
        
    }
    

    
}

