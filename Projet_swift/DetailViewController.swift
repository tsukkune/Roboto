//
//  DetailViewController.swift
//  Projet_swift
//
//  Created by Developer on 17/05/2018.
//  Copyright © 2018 Nicolas Depero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{

    @IBOutlet weak var TextRobot: UILabel!
    @IBOutlet weak var ImageRobot: UIImageView!
    
    var titre = String()
    var url = String()
    var imageData = Data()
    
    @IBAction func mailSend(_ sender: UIButton) {
        
        print("send mail")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TextRobot.text=titre
        let image = UIImage(data: imageData)
        ImageRobot.image=image
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    

}
