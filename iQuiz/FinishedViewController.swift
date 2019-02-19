//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/18/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var scores: UILabel!
    
    var score: Int = 0
    var totalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scores.text = "\(score) / \(totalScore)"
        if score == totalScore {
            self.quote.text = "Perfect!"
        } else if score >= totalScore/2 {
            self.quote.text = "Almost!"
        } else{
            self.quote.text = "Can be better!"
        }
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
