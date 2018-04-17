//
//  NewsTable.swift
//  Reader
//
//  Created by Uladzislau Daratsiuk on 2018-04-17.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit
import SafariServices

extension NewsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = news.sorted(by: { $0.publishedAt! >  $1.publishedAt! })[indexPath.row]
        let cell = listOfNews.dequeueReusableCell(withIdentifier: newsCellId, for: indexPath) as! NewsCell
        cell.updateData(title: article.headline, description: article.desc, imageUrl: article.imageUrl!, pubDate: article.publishedAt)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let article = news[indexPath.row]
            let articleUrl = URL(string: article.url!)
            let safariVC = SFSafariViewController(url: articleUrl!)
            present(safariVC, animated: true, completion: nil)
    }

}
