//
//  ProgressViewController.swift
//  ChartDemo
//
//  Created by Myunggu Kim on 15/03/2019.
//

import UIKit

class ProgressViewController: UIViewController {

    @IBOutlet var chart: DonutChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chart.progress = 0.7
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
