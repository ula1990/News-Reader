//
//  FeedsTable.swift
//  Reader
//
//  Created by Uladzislau Daratsiuk on 2018-04-17.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

extension FeedsListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feed = feeds[indexPath.row]
        let cell = listOfFeeds.dequeueReusableCell(withIdentifier: feedCellId, for: indexPath) as! FeedCell
        cell.feedName.text = feed.feedName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = feeds[indexPath.row]
        performSegue(withIdentifier: "news", sender: feed)
    }
}
