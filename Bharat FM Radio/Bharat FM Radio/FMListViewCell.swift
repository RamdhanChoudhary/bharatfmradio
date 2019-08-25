//
//  FMListViewCell.swift
//  Bharat FM Radio
//
//  Created by RAMDHAN CHOUDHARY on 26/08/19.
//  Copyright © 2019 RDC Innovations Pvt Ltd. All rights reserved.
//

import UIKit

class FMListViewCell: UITableViewCell {

    @IBOutlet weak var fmNameLabel: UILabel!
    @IBOutlet weak var fmFrequencyLabel: UILabel!
    @IBOutlet weak var fmLocationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
