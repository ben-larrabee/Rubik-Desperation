//
//  SolverViewController.swift
//  Rubik's Cube Solver
//
//  Created by Christopher Stanley on 11/16/16.
//  Copyright © 2016 Christopher Stanley. All rights reserved.
//

import UIKit

class SolverViewController: UIViewController {
    
    var colorValue: Int = 0
    var blank = #imageLiteral(resourceName: "blank-square")
    var white = #imageLiteral(resourceName: "white-square")
    var yellow = #imageLiteral(resourceName: "yellow-square")
    var red = #imageLiteral(resourceName: "red-sqaure")
    var blue = #imageLiteral(resourceName: "blue-square")
    var green = #imageLiteral(resourceName: "green-square")
    var orange = #imageLiteral(resourceName: "orange-square")
    
    
    @IBOutlet weak var Orange0: UIButton!
    @IBOutlet weak var Orange1: UIButton!
    @IBOutlet weak var Orange2: UIButton!
    @IBOutlet weak var Orange3: UIButton!
    @IBOutlet weak var Orange4: UIButton!
    @IBOutlet weak var Orange5: UIButton!
    @IBOutlet weak var Orange6: UIButton!
    @IBOutlet weak var Orange7: UIButton!
    @IBOutlet weak var Orange8: UIButton!
    
    @IBOutlet weak var green9: UIButton!
    @IBOutlet weak var green10: UIButton!
    @IBOutlet weak var green11: UIButton!
    @IBOutlet weak var green12: UIButton!
    @IBOutlet weak var green13: UIButton!
    @IBOutlet weak var green14: UIButton!
    @IBOutlet weak var green15: UIButton!
    @IBOutlet weak var green16: UIButton!
    @IBOutlet weak var green17: UIButton!
    
    @IBOutlet weak var white18: UIButton!
    @IBOutlet weak var white19: UIButton!
    @IBOutlet weak var white20: UIButton!
    @IBOutlet weak var white21: UIButton!
    @IBOutlet weak var white22: UIButton!
    @IBOutlet weak var white23: UIButton!
    @IBOutlet weak var white24: UIButton!
    @IBOutlet weak var white25: UIButton!
    @IBOutlet weak var white26: UIButton!
    
    @IBOutlet weak var red27: UIButton!
    @IBOutlet weak var red28: UIButton!
    @IBOutlet weak var red29: UIButton!
    @IBOutlet weak var red30: UIButton!
    @IBOutlet weak var red31: UIButton!
    @IBOutlet weak var red32: UIButton!
    @IBOutlet weak var red33: UIButton!
    @IBOutlet weak var red34: UIButton!
    @IBOutlet weak var red39: UIButton!
    
    @IBOutlet weak var blue36: UIButton!
    @IBOutlet weak var blue37: UIButton!
    @IBOutlet weak var blue38: UIButton!
    @IBOutlet weak var blue39: UIButton!
    @IBOutlet weak var blue40: UIButton!
    @IBOutlet weak var blue41: UIButton!
    @IBOutlet weak var blue42: UIButton!
    @IBOutlet weak var blue43: UIButton!
    @IBOutlet weak var blue44: UIButton!
    
    @IBOutlet weak var yellow45: UIButton!
    @IBOutlet weak var yellow46: UIButton!
    @IBOutlet weak var yellow47: UIButton!
    @IBOutlet weak var yellow48: UIButton!
    @IBOutlet weak var yellow49: UIButton!
    @IBOutlet weak var yellow50: UIButton!
    @IBOutlet weak var yellow51: UIButton!
    @IBOutlet weak var yellow52: UIButton!
    @IBOutlet weak var yellow53: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.gray
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "interapt-logo.png")
        imageView.image = image
        navigationItem.titleView = imageView
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
   @IBAction func buttonClicked(sender: UIButton) {
    
    if sender.image(for: UIControlState.normal) == blank {
        colorValue = 1
    } else if sender.image(for: UIControlState.normal) == white {
        colorValue = 2
    } else if sender.image(for: UIControlState.normal) == yellow {
        colorValue = 3
    } else if sender.image(for: UIControlState.normal) == red {
        colorValue = 4
    } else if sender.image(for: UIControlState.normal) == blue {
        colorValue = 5
    } else if sender.image(for: UIControlState.normal) == green {
        colorValue = 6
    } else {
        colorValue = 7
    }
    
        switch colorValue {
        case 1:
            sender.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            sender.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            sender.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            sender.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            sender.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            sender.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            sender.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
    }
    
    
    @IBAction func reset(_ sender: Any) {
        loadView()
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
