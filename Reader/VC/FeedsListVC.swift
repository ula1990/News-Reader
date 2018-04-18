//
//  FeedsListVC.swift
//  Reader
//
//  Created by Uladzislau Daratsiuk on 2018-04-17.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class FeedsListVC: UIViewController {
    
    var feeds: [Feed] = []
    let token = "54fde7b8bbba4883abdf30f18bcea926"
    let feedCellId = "feedCellId"
    
    lazy var listOfFeeds: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.register(FeedCell.self, forCellReuseIdentifier: feedCellId)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        listOfFeeds.delegate = self
        listOfFeeds.dataSource = self
        setupView()
        feeds = creatTempArray(tokenKey: token)
        view.backgroundColor = .white

    }
    
  //ONE OF THE OPTION HERE TO SEND THE DATA CAN BE PROTOCOLS AND DELEGATES
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "news" {
            let destVC = segue.destination as! NewsListVC
            destVC.feed = sender as? Feed
        }
    }

    func setupView(){
        view.addSubview(listOfFeeds)
        listOfFeeds.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        listOfFeeds.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        listOfFeeds.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        listOfFeeds.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        listOfFeeds.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }

    func creatTempArray(tokenKey: String) -> [Feed]{
        var array: [Feed] = []
        
        let feed1 = Feed(feedName: "BBC", url: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=" + tokenKey)
        let feed2 = Feed(feedName: "The Huffington", url: "https://newsapi.org/v2/top-headlines?sources=the-huffington-post&apiKey=" + tokenKey)
        let feed3 = Feed(feedName: "TechCrunch", url: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=" + tokenKey)
        let feed4 = Feed(feedName: "The Verge", url: "https://newsapi.org/v2/top-headlines?sources=the-verge&apiKey=" + tokenKey)
        
        array.append(feed1)
        array.append(feed2)
        array.append(feed3)
        array.append(feed4)
        
        return array
    }
}
