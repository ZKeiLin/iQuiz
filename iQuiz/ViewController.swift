//
//  ViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/8/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

struct Question {
    var text: String
    var answer: Int
    var answers : [String]
}

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var quizTable: UITableView!
    var dataSource : QuizDataSource? = nil
    var quizRepo : QuizRepository = (UIApplication.shared.delegate as! AppDelegate).quizRepository
    var quizes : [Quiz] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        quizes = quizRepo.getQuiz()
        dataSource = QuizDataSource(quizes)
        
        quizTable.dataSource = dataSource
        quizTable.delegate = self
        
        quizTable.tableFooterView = UIView(frame: .zero)
        quizTable.estimatedRowHeight = 200
        quizTable.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController
        vc?.questions = (dataSource?.data[indexPath.row].questions ?? nil)! 
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
