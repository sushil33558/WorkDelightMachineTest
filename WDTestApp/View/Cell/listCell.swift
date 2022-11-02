//
//  listCell.swift
//  WDTestApp
//
//  Created by sushil Chaudhary on 9/29/22.
//

import UIKit
class listCell: UITableViewCell {
    //MARK: - iBoutlet
    //------------------
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var userIdLbl: UILabel!
    @IBOutlet weak var noOfDishesLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    //MARK: - for nib
    //-------------------
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
