//
//  ViewController.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 11/7/23.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var newsViewModel = NewsViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "News"
        view.backgroundColor = .systemBackground
        
        topHeadlines()
    }
    
    func topHeadlines(){
        
        newsViewModel.getHeadLinesNews {[weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(newsViewModel.numberOfRowsInSection(section: section))
        return newsViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsRowCellID", for: indexPath) as! NewsTableViewCell
        
        let news = newsViewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(article: news)
        
        return cell
    }
    
    
}

