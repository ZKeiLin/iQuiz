//
//  QuizCell.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/10/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
//        self.layer.cornerRadius = 20
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 2, height: 4)
//        self.layer.shadowOpacity = 0.2
//        self.layer.shadowRadius = 10
    }

}
