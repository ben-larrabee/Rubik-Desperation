//
//  WebViewFixController.swift
//  Rubik's Cube Solver
//
//  Created by Ben Larrabee on 11/28/16.
//  Copyright © 2016 Christopher Stanley. All rights reserved.
//

import UIKit

class WebViewFixController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let rubikURL = URL(string: "https:/rubiks-cube-solver.com")
        let rubikSolution = URLRequest(url: rubikURL!)
        webView.loadRequest(rubikSolution)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
