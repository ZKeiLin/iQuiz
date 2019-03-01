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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
