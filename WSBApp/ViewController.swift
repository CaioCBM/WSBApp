//
//  ViewController.swift
//  WSBApp
//
//  Created by Yhan Nunes on 09/06/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let viewModel: ListWsbViewModel = ListWsbViewModel()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsUIViewCotroller {
            destination.wsbApi = viewModel.items[(tableView.indexPathForSelectedRow?.row)!]
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        TestTableViewCell
        let item = viewModel.items[indexPath.row]
        cell.mySentiment.text = item.sentiment
        cell.myStock.text = "\((item.sentimentScore))"
        cell.myTicket.text = item.ticker
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getJson(url: "https://tradestie.com/api/v1/apps/reddit", completion: { result in
            self.tableView.reloadData()
        })
        tableView.delegate = self
        tableView.dataSource = self

    }
}

