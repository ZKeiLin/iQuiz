//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/17/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var indicatorText:String = ""
    var curQues: String = ""
    var answerText : String = ""
    var buttonText : String = ""
    
    @IBOutlet weak var indicator: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var Answer: UILabel!
    
    @IBOutlet weak var nextStep: UIButton!
    
    override func viewDidLoad() {
        indicator.text = indicatorText
        question.text = curQues
        Answer.text = answerText
        nextStep.setTitle(buttonText, for: .normal)
    }
    
    @IBAction func next(_ sender: Any) {
        if buttonText == "Next"{
            let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController
            let cur = 1 + (vc?.index)!
            vc?.index = cur
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
