//
//  PasteItTableViewCell.swift
//  Paste-It
//
//  Created by Aditya Narayan on 5/31/17.
//
//

import UIKit

class PasteItTableViewCell: UITableViewCell {

    
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
