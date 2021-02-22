//
//  ViewController.swift
//  SampleAPI
//
//  Created by 三浦　登哉 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var qiitaArray: [QiitaModel] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        QiitaDataManager.fetchArticle() { qiitaArray in
            self.qiitaArray = qiitaArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qiitaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let qiitaPost = qiitaArray[indexPath.row]
        cell.textLabel?.text = qiitaPost.title
        cell.detailTextLabel?.text = qiitaPost.user.name
        return cell
    }
}
