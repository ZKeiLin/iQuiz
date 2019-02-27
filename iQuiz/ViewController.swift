//
//  ViewController.swift
//  iQuiz
//
//  Created by Zhiqi Lin on 2/8/19.
//  Copyright © 2019 Zhiqi Lin. All rights reserved.
//

import UIKit
import SystemConfiguration


struct Question: Codable {
    var text: String
    var answer: String
    var answers : [String]
}

struct Quiz : Codable{
    var title: String
    var desc: String
    var questions: [Question]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var quizTable: UITableView!

    var data : [Quiz] = []
    var defaults = UserDefaults.standard
    var sourceURL : String = UserDefaults.standard.string(forKey: "url") ?? "http://tednewardsandbox.site44.com/questions.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if((defaults.object(forKey: "url")) != nil){
            self.sourceURL = defaults.object(forKey: "url") as! String
        }
        
        // DATA
        fetchJSON(self.sourceURL)
        quizTable.dataSource = self
        quizTable.delegate = self
        
        // STYLE
        navigationItem.hidesBackButton = true
        quizTable.tableFooterView = UIView(frame: .zero)
        quizTable.estimatedRowHeight = 200
        quizTable.rowHeight = UITableView.automaticDimension
    }
    
    // Test Network
    override func viewDidAppear(_ animated: Bool) {
        if(Reachability.isConnectedToNetwork()){
            if self.data.count == 0 {
                fetchJSON(self.sourceURL)
            }
        }else{
            let alert = UIAlertController(title: "Oh no!", message: "no internet", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay...", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("no internet, grabbing from user default");
            
            
            if(defaults.string(forKey: "url") == nil){
                let alert = UIAlertController(title: "Oh no!", message: "connect the internet!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay...", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func Setting(_ sender: Any) {
        let alertController = UIAlertController(title: "Setting", message:
            "Input your own source url", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: {textField in
            textField.placeholder = "Input your own source url"
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default,handler: nil))
        alertController.addAction(UIAlertAction(title: "Check Now", style: UIAlertAction.Style.default,handler: {(_) in
                let input = (alertController.textFields![0] as UITextField).text!
                if let url = URL(string: input), UIApplication.shared.canOpenURL(url) {
                    self.fetchJSON(input)
                } else {
                    let alert = UIAlertController(title: "Oh no!", message: "The Download Fail!", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Okay...", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func fetchJSON(_ urlString: String){
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url){ (data, response, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Fail to get data from the url", err)
                    return
                }
                guard let onlineData = data else { return }
                self.defaults.set(urlString, forKey: "url")
                self.ParseData(onlineData)
                self.quizTable.reloadData()
            }}
            task.resume()
    }
    
    func ParseData (_ data: Data){
        do {
            let decoder = JSONDecoder()
            self.data = try decoder.decode([Quiz].self, from: data)
            self.quizTable.reloadData()
        } catch let parsingError {
            print("Error", parsingError)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quiz", for: indexPath) as! QuizCell
        cell.title.text = data[indexPath.row].title
        cell.desc.text = data[indexPath.row].desc
        cell.quizImage.image = UIImage(named: data[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController
        vc?.questions = (data[indexPath.row].questions ?? nil)!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
