//
//  FeedModel.swift
//  Reader
//
//  Created by Uladzislau Daratsiuk on 2018-04-17.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class Feed {
    var feedName: String?
    var url: String?
    
    init(feedName: String, url: String?) {
        self.feedName = feedName
        self.url = url
    }
    
    
}
