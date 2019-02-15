//
//  AnswerOptionCell.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/14/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class AnswerOptionCell: UITableViewCell {

    @IBOutlet weak var optionText: UILabel!
    
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(self.isSelected){
            self.container.layer.borderWidth = 1.0
            self.container.layer.borderColor = UIColor.orange.cgColor
            self.optionText.textColor = UIColor.orange
        }
        
//        willSet{
//            super.isSelected = newValue
//            if newValue
//            {
//                self.layer.borderWidth = 1.0
//                self.layer.borderColor = UIColor.orange.cgColor
//                self.userID.textColor = UIColor.orange
//                self.user.textColor = UIColor.orange
//            }
//            else
//            {
//                self.layer.borderWidth = 0.0
//                self.layer.cornerRadius = 0.0
//                self.userID.textColor = UIColor(red:0.29, green:0.56, blue:0.74, alpha:1.0)
//                self.user.textColor = UIColor(red:0.29, green:0.56, blue:0.74, alpha:1.0)
//                self.layer.cornerRadius = 20
//            }
    //        }
        
        // Configure the view for the selected state
        
        
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
//    
//    private func setup() {
//        container.layer.cornerRadius = 20
//        container.layer.masksToBounds = false
//        container.layer.shadowColor = UIColor.black.cgColor
//        container.layer.shadowOffset = CGSize(width: 2, height: 4)
//        container.layer.shadowOpacity = 0.2
//        container.layer.shadowRadius = 10
//    }

}
