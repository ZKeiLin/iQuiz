//
//  ViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/8/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit

struct Question: Codable {
    var text: String
    var answer: String
    var answers : [String]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var quizTable: UITableView!
    var quizRepo : QuizRepository = (UIApplication.shared.delegate as! AppDelegate).quizRepository
    var data : [Quiz] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
        navigationItem.hidesBackButton = true
        quizTable.dataSource = self
        quizTable.delegate = self
        quizTable.tableFooterView = UIView(frame: .zero)
        quizTable.estimatedRowHeight = 200
        quizTable.rowHeight = UITableView.automaticDimension
    }
    
    fileprivate func fetchJSON(){
        let urlString = "http://tednewardsandbox.site44.com/questions.json"
        let fileUrl = Bundle.main.path(forResource: "quizes", ofType: "json")
        guard let url = URL(string: urlString) else { return}
        let task = URLSession.shared.dataTask(with: url){ (data, response, err) in
            DispatchQueue.main.async {
                if let err = err {
                    self.data = self.quizRepo.getQuiz()
                    self.quizTable.reloadData()
                    print("Fail to get data from the url", err)
                    return
                }
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    self.data = try decoder.decode([Quiz].self, from: data)
                    self.quizTable.reloadData()
                } catch let parsingError {
                    self.data = self.quizRepo.getQuiz()
                    print("Error", parsingError)
                }
            }}
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quiz", for: indexPath) as! QuizCell
        //        cell.quizImage.image = data[indexPath.row].image
        cell.title.text = data[indexPath.row].title
        cell.desc.text = data[indexPath.row].desc
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("table: \(self.data)")
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController
        vc?.questions = (data[indexPath.row].questions ?? nil)!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
