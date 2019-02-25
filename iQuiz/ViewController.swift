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

struct QuizTest:Decodable {
    var title: String
//    var image: UIImage    t
    var desc: String
//    var questions: [Question]
}



class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var quizTable: UITableView!
    var dataSource : QuizDataSource? = nil
    var quizRepo : QuizRepository = (UIApplication.shared.delegate as! AppDelegate).quizRepository
    var quizes : [Quiz] = []
    var tQuizes : [QuizTest] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
        navigationItem.hidesBackButton = true
        quizes = quizRepo.getQuiz()
        dataSource = QuizDataSource(quizes)
        
        quizTable.dataSource = dataSource
        quizTable.delegate = self
        
        quizTable.tableFooterView = UIView(frame: .zero)
        quizTable.estimatedRowHeight = 200
        quizTable.rowHeight = UITableView.automaticDimension
    }
    
    fileprivate func fetchJSON(){
        let urlString = "http://tednewardsandbox.site44.com/questions.json"
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url){ (data, response, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Fail to get data from the url", err)
                    return
                }
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    self.tQuizes = try decoder.decode([QuizTest].self, from: data)
//                    let jsonResponse = try JSONSerialization.jsonObject(with:
//                        data, options: [])
                    for item in self.tQuizes {
                        print(item)
                    }
                } catch let parsingError {
                    print("Error", parsingError)
                    //                    let decoder = JSONDecoder()
                    //                    self.quizes = try decoder.decode([Quiz].self, from: data)
                    //                } catch let jsonErr{
                    //                    print("fail to decode", jsonErr)
                    //                }
                }
            }}
        task.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController
        vc?.questions = (dataSource?.data[indexPath.row].questions ?? nil)! 
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
