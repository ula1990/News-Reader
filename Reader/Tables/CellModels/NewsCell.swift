//
//  NewsCell.swift
//  Reader
//
//  Created by Uladzislau Daratsiuk on 2018-04-17.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    
    lazy var newsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var newsDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    lazy var newsDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 9)
        label.textAlignment = .right
        return label
    }()
    
    
    lazy var newsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 30
        return image
    }()
    
    
    func updateData(title: String?, description: String? , imageUrl: String?, pubDate: String?){
        newsTitle.text = title
        newsDescription.text = description
        newsDate.text = pubDate
        do{
            let url = URL(string: imageUrl!)
            let data = try Data(contentsOf: url!)
        self.newsImage.image = UIImage(data: data)
        }catch{
            print(error)
        }
       
    }
    
    
    fileprivate func addViews() {
        addSubview(newsTitle)
        addSubview(newsDescription)
        addSubview(newsDate)
        addSubview(newsImage)
        setupCellView()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        
    }
    
    func setupCellView(){
        
        newsImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        newsImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        newsImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        newsTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        newsTitle.leftAnchor.constraint(equalTo: newsImage.rightAnchor, constant: 20).isActive = true
        newsTitle.widthAnchor.constraint(equalToConstant: 150).isActive = true
        newsTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        newsDescription.topAnchor.constraint(equalTo: newsTitle.topAnchor, constant: 20).isActive = true
        newsDescription.leftAnchor.constraint(equalTo: newsImage.rightAnchor, constant: 20).isActive = true
        newsDescription.widthAnchor.constraint(equalToConstant: 250).isActive = true
        newsDescription.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        newsDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        newsDate.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        newsDate.widthAnchor.constraint(equalToConstant: 100).isActive = true
        newsDate.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
