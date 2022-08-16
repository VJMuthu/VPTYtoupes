//
//  ListCollectionViewCell.swift
//  VPTYtoupe
//
//  Created by iOS on 13/08/22.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    @IBOutlet var category_img:UIImageView!
    @IBOutlet var title_lbl:UILabel!
    @IBOutlet var category_icon:UIImageView!
    @IBOutlet var time_lbl:UILabel!
    @IBOutlet var views_lbl:UILabel!
    @IBOutlet var channel_name_lbl:UILabel!
    @IBOutlet var option_btn:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
