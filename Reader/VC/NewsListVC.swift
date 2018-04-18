//
//  NewsListVC.swift
//  Reader
//
//  Created by Uladzislau Daratsiuk on 2018-04-17.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class NewsListVC: UIViewController {
    
    let newsCellId = "newsCellId"
    
    var feed: Feed?
    var news: [Article] = []
    var urlString: String?
    
    lazy var navigationBar: UINavigationBar = {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        return navBar
    }()
    
    lazy var listOfNews: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.register(NewsCell.self, forCellReuseIdentifier: newsCellId)
        return table
    }()

    lazy var numberOfArticles: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.backgroundColor = .orange
        return label
    }()

    fileprivate func addAllViews() {
        view.addSubview(listOfNews)
        view.addSubview(navigationBar)
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfNews.delegate = self
        listOfNews.dataSource = self
        urlString = feed?.url
        uploadNews(url: urlString!)
        addAllViews()
        navigationController?.topViewController?.title = (feed?.feedName)! + "(" + "Updating" + ")"
    }

    func setupView(){
        
        listOfNews.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        listOfNews.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        listOfNews.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        listOfNews.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        listOfNews.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func uploadNews(url: String){
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error != nil {
                Alert.showBasic(title: "Problem with connection", msg: "Please check you internet connection", vc: self)
                return
            }
            self.news.removeAll()
            self.news = [Article]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let article = Article()
                        if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String,let publishedAt = articleFromJson["publishedAt"] as? String {
                            
                            article.author = author
                            article.desc = desc
                            article.headline = title
                            article.url = url
                            article.imageUrl = urlToImage
                            article.publishedAt = publishedAt
                        }
                        self.news.append(article)
                        
                        }
                    }
                DispatchQueue.main.async { 
                    self.navigationController?.topViewController?.title = (self.feed?.feedName)! + "(" + String(self.news.count) + ")"
                    }
                } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
