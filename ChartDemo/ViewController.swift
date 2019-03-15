//
//  ViewController.swift
//  ChartDemo
//
//  Created by Myunggu Kim on 14/03/2019.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let progress: CGFloat = 0.5
        let progressDegrees: CGFloat = ((progress * 100.0) * 360.0)/100.0
        let radian = degreesToRadians(progressDegrees)
        print(progressDegrees, radian)
    }
    
    func degreesToRadians(_ degree: CGFloat) -> CGFloat {
        return degree * CGFloat.pi / 180.0
    }

}

