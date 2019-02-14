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
