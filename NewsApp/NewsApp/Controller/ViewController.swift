//
//  ViewController.swift
//  NewsApp
//
//  Created by Arika Afrin Boshra on 21/6/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var article = [Articles]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        gettingDataFromServer()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.imageLbl.text = article[indexPath.row].author;
        
        let imageURL = "\(article[indexPath.row].urlToImage ?? "")"
        
        ImageService.getImage(url: URL(string: imageURL)!) { image in
            cell.newsImage.image = image
        }
        cell.newsImage.clipsToBounds = true
        cell.newsImage.contentMode = .scaleAspectFill
        
        return cell;
    }
    
    
    
    func gettingDataFromServer() {

        guard let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-05-21&sortBy=publishedAt&apiKey=64cbafb89f1d44aab3f1102b09c5ab3d") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, error == nil {
                do {
                    self.article = try JSONDecoder().decode([Articles].self, from: data)
                }
                catch {
                    print(error.localizedDescription)
                }
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            }
        }.resume()
    }


}

