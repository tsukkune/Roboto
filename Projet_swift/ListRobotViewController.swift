//
//  ListRobotViewController.swift
//  Projet_swift
//
//  Created by Developer on 17/05/2018.
//  Copyright © 2018 Nicolas Depero. All rights reserved.
//

import UIKit

class ListRobotViewController: UIViewController {
    
    @IBOutlet weak var TableRobot: UITableView!
    
    var listItem = ListItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableRobot.dataSource = self
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            // make an instance of the second view controller
            var detailVC = segue.destination as! DetailViewController
            
            guard let cell = sender as? UITableViewCell else { return }
            guard let index = TableRobot.indexPath(for: cell) else { return }
            let currentItem = listItem.items[index.row]
            
            detailVC.titre = currentItem.Text
            detailVC.url = currentItem.URL
            detailVC.imageData = currentItem.ImgData!
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
            listItem.items.remove(at: indexPath.row)
            TableRobot.reloadData()
        }
    }
}

extension  ListRobotViewController: UITableViewDataSource {
    
    func numberOfSections(in TableRobot: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ TableRobot: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.items.count
    }
    
    func tableView(_ TableRobot: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableRobot.dequeueReusableCell(withIdentifier: "RobotCell", for: indexPath)
        
        
        
        //Customize the cell
        let Robot = listItem.items[indexPath.row]
        cell.textLabel?.text = Robot.Text
        return cell
    }
}
