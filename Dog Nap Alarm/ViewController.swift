//
//  ViewController.swift
//  Dog Nap Alarm
//
//  Created by Amy Wang on 2017-05-27.
//  Copyright © 2017 Rain Pillar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseDog(){
        let storyboard = UIStoryboard(name: "alarm", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "alarm")
        self.present(controller, animated: true, completion: nil)
    }

    
}

