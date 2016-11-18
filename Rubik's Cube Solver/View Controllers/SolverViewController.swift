//
//  SolverViewController.swift
//  Rubik's Cube Solver
//
//  Created by Christopher Stanley on 11/16/16.
//  Copyright © 2016 Christopher Stanley. All rights reserved.
//

import UIKit
import Foundation

class SolverViewController: UIViewController {
    
    var colorValue: Int = 0
    var blank = #imageLiteral(resourceName: "blank-square")
    var white = #imageLiteral(resourceName: "white-square")
    var yellow = #imageLiteral(resourceName: "yellow-square")
    var red = #imageLiteral(resourceName: "red-sqaure")
    var blue = #imageLiteral(resourceName: "blue-square")
    var green = #imageLiteral(resourceName: "green-square")
    var orange = #imageLiteral(resourceName: "orange-square")
    var faceValue: String = "blank"
    var cube: [String] = []
    
    var u1value = "blank"
    var u2value = "blank"
    var u3value = "blank"
    var u4value = "blank"
    var u5value = "U"
    var u6value = "blank"
    var u7value = "blank"
    var u8value = "blank"
    var u9value = "blank"
    
    var r1value = "blank"
    var r2value = "blank"
    var r3value = "blank"
    var r4value = "blank"
    var r5value = "R"
    var r6value = "blank"
    var r7value = "blank"
    var r8value = "blank"
    var r9value = "blank"
    
    var f1value = "blank"
    var f2value = "blank"
    var f3value = "blank"
    var f4value = "blank"
    var f5value = "F"
    var f6value = "blank"
    var f7value = "blank"
    var f8value = "blank"
    var f9value = "blank"
    
    var d1value = "blank"
    var d2value = "blank"
    var d3value = "blank"
    var d4value = "blank"
    var d5value = "D"
    var d6value = "blank"
    var d7value = "blank"
    var d8value = "blank"
    var d9value = "blank"
    
    var l1value = "blank"
    var l2value = "blank"
    var l3value = "blank"
    var l4value = "blank"
    var l5value = "L"
    var l6value = "blank"
    var l7value = "blank"
    var l8value = "blank"
    var l9value = "blank"
    
    var b1value = "blank"
    var b2value = "blank"
    var b3value = "blank"
    var b4value = "blank"
    var b5value = "B"
    var b6value = "blank"
    var b7value = "blank"
    var b8value = "blank"
    var b9value = "blank"
    
    
    @IBOutlet weak var infoButton: UIButton!
    
    
    @IBOutlet weak var U1: UIButton!
    @IBOutlet weak var U2: UIButton!
    @IBOutlet weak var U3: UIButton!
    @IBOutlet weak var U4: UIButton!
    @IBOutlet weak var U5: UIButton!
    @IBOutlet weak var U6: UIButton!
    @IBOutlet weak var U7: UIButton!
    @IBOutlet weak var U8: UIButton!
    @IBOutlet weak var U9: UIButton!
    
    @IBOutlet weak var R1: UIButton!
    @IBOutlet weak var R2: UIButton!
    @IBOutlet weak var R3: UIButton!
    @IBOutlet weak var R4: UIButton!
    @IBOutlet weak var R5: UIButton!
    @IBOutlet weak var R6: UIButton!
    @IBOutlet weak var R7: UIButton!
    @IBOutlet weak var R8: UIButton!
    @IBOutlet weak var R9: UIButton!
    
    @IBOutlet weak var F1: UIButton!
    @IBOutlet weak var F2: UIButton!
    @IBOutlet weak var F3: UIButton!
    @IBOutlet weak var F4: UIButton!
    @IBOutlet weak var F5: UIButton!
    @IBOutlet weak var F6: UIButton!
    @IBOutlet weak var F7: UIButton!
    @IBOutlet weak var F8: UIButton!
    @IBOutlet weak var F9: UIButton!
    
    @IBOutlet weak var D1: UIButton!
    @IBOutlet weak var D2: UIButton!
    @IBOutlet weak var D3: UIButton!
    @IBOutlet weak var D4: UIButton!
    @IBOutlet weak var D5: UIButton!
    @IBOutlet weak var D6: UIButton!
    @IBOutlet weak var D7: UIButton!
    @IBOutlet weak var D8: UIButton!
    @IBOutlet weak var D9: UIButton!
    
    @IBOutlet weak var L1: UIButton!
    @IBOutlet weak var L2: UIButton!
    @IBOutlet weak var L3: UIButton!
    @IBOutlet weak var L4: UIButton!
    @IBOutlet weak var L5: UIButton!
    @IBOutlet weak var L6: UIButton!
    @IBOutlet weak var L7: UIButton!
    @IBOutlet weak var L8: UIButton!
    @IBOutlet weak var L9: UIButton!
    
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    @IBOutlet weak var B9: UIButton!
    
   
    
    
    
    
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
    
    
    @IBAction func U1Click(_ sender: Any) {
        
        if U1.image(for: UIControlState.normal) == blank {
            colorValue = 1
            faceValue = "U"
            print("U")
        } else if U1.image(for: UIControlState.normal) == white {
            colorValue = 2
            faceValue = "D"
            print("D")
        } else if U1.image(for: UIControlState.normal) == yellow {
            colorValue = 3
            faceValue = "B"
            print("B")
        } else if U1.image(for: UIControlState.normal) == red {
            colorValue = 4
            faceValue = "L"
            print("L")
        } else if U1.image(for: UIControlState.normal) == blue {
            colorValue = 5
            faceValue = "R"
            print("R")
        } else if U1.image(for: UIControlState.normal) == green {
            colorValue = 6
            faceValue = "F"
            print("F")
        } else {
            colorValue = 7
            print("Blank")
        }
        
        switch colorValue {
        case 1:
            U1.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            U1.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            U1.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            U1.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            U1.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            U1.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            U1.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
        u1value = faceValue

        
    }
    
    @IBAction func U2Click(_ sender: Any) {
        if U2.image(for: UIControlState.normal) == blank {
            colorValue = 1
            faceValue = "U"
            print("U")
        } else if U2.image(for: UIControlState.normal) == white {
            colorValue = 2
            faceValue = "D"
            print("D")
        } else if U2.image(for: UIControlState.normal) == yellow {
            colorValue = 3
            faceValue = "B"
            print("B")
        } else if U2.image(for: UIControlState.normal) == red {
            colorValue = 4
            faceValue = "L"
            print("L")
        } else if U2.image(for: UIControlState.normal) == blue {
            colorValue = 5
            faceValue = "R"
            print("R")
        } else if U2.image(for: UIControlState.normal) == green {
            colorValue = 6
            faceValue = "F"
            print("F")
        } else {
            colorValue = 7
            print("Blank")
        }
        
        switch colorValue {
        case 1:
            U2.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            U2.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            U2.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            U2.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            U2.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            U2.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            U2.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
        u2value = faceValue
        
    }
    @IBAction func U3Click(_ sender: Any) {
        if U3.image(for: UIControlState.normal) == blank {
            colorValue = 1
            faceValue = "U"
            print("U")
        } else if U3.image(for: UIControlState.normal) == white {
            colorValue = 2
            faceValue = "D"
            print("D")
        } else if U3.image(for: UIControlState.normal) == yellow {
            colorValue = 3
            faceValue = "B"
            print("B")
        } else if U3.image(for: UIControlState.normal) == red {
            colorValue = 4
            faceValue = "L"
            print("L")
        } else if U3.image(for: UIControlState.normal) == blue {
            colorValue = 5
            faceValue = "R"
            print("R")
        } else if U3.image(for: UIControlState.normal) == green {
            colorValue = 6
            faceValue = "F"
            print("F")
        } else {
            colorValue = 7
            print("Blank")
        }
        
        switch colorValue {
        case 1:
            U3.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            U3.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            U3.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            U3.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            U3.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            U3.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            U3.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
        u3value = faceValue
    }
    @IBAction func U4Click(_ sender: Any) {
        if U4.image(for: UIControlState.normal) == blank {
            colorValue = 1
            faceValue = "U"
            print("U")
        } else if U4.image(for: UIControlState.normal) == white {
            colorValue = 2
            faceValue = "D"
            print("D")
        } else if U4.image(for: UIControlState.normal) == yellow {
            colorValue = 3
            faceValue = "B"
            print("B")
        } else if U4.image(for: UIControlState.normal) == red {
            colorValue = 4
            faceValue = "L"
            print("L")
        } else if U4.image(for: UIControlState.normal) == blue {
            colorValue = 5
            faceValue = "R"
            print("R")
        } else if U4.image(for: UIControlState.normal) == green {
            colorValue = 6
            faceValue = "F"
            print("F")
        } else {
            colorValue = 7
            print("Blank")
        }
        
        switch colorValue {
        case 1:
            U4.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            U4.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            U4.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            U4.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            U4.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            U4.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            U4.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
        u4value = faceValue
    }
  
    @IBAction func U6Click(_ sender: Any) {
        if U6.image(for: UIControlState.normal) == blank {
            colorValue = 1
            faceValue = "U"
            print("U")
        } else if U6.image(for: UIControlState.normal) == white {
            colorValue = 2
            faceValue = "D"
            print("D")
        } else if U6.image(for: UIControlState.normal) == yellow {
            colorValue = 3
            faceValue = "B"
            print("B")
        } else if U6.image(for: UIControlState.normal) == red {
            colorValue = 4
            faceValue = "L"
            print("L")
        } else if U6.image(for: UIControlState.normal) == blue {
            colorValue = 5
            faceValue = "R"
            print("R")
        } else if U6.image(for: UIControlState.normal) == green {
            colorValue = 6
            faceValue = "F"
            print("F")
        } else {
            colorValue = 7
            print("Blank")
        }
        
        switch colorValue {
        case 1:
            U6.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            U6.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            U6.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            U6.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            U6.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            U6.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            U6.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
        u6value = faceValue
    }
    
    @IBAction func U7Click(_ sender: Any) {
        if U7.image(for: UIControlState.normal) == blank {
            colorValue = 1
            faceValue = "U"
            print("U")
        } else if U7.image(for: UIControlState.normal) == white {
            colorValue = 2
            faceValue = "D"
            print("D")
        } else if U7.image(for: UIControlState.normal) == yellow {
            colorValue = 3
            faceValue = "B"
            print("B")
        } else if U7.image(for: UIControlState.normal) == red {
            colorValue = 4
            faceValue = "L"
            print("L")
        } else if U7.image(for: UIControlState.normal) == blue {
            colorValue = 5
            faceValue = "R"
            print("R")
        } else if U7.image(for: UIControlState.normal) == green {
            colorValue = 6
            faceValue = "F"
            print("F")
        } else {
            colorValue = 7
            print("Blank")
        }
        
        switch colorValue {
        case 1:
            U7.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            U7.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            U7.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            U7.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            U7.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            U7.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            U7.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
        u7value = faceValue
    }
    
    @IBAction func U8Click(_ sender: Any) {
        if U8.image(for: UIControlState.normal) == blank {
            colorValue = 1
            faceValue = "U"
            print("U")
        } else if U8.image(for: UIControlState.normal) == white {
            colorValue = 2
            faceValue = "D"
            print("D")
        } else if U8.image(for: UIControlState.normal) == yellow {
            colorValue = 3
            faceValue = "B"
            print("B")
        } else if U8.image(for: UIControlState.normal) == red {
            colorValue = 4
            faceValue = "L"
            print("L")
        } else if U8.image(for: UIControlState.normal) == blue {
            colorValue = 5
            faceValue = "R"
            print("R")
        } else if U8.image(for: UIControlState.normal) == green {
            colorValue = 6
            faceValue = "F"
            print("F")
        } else {
            colorValue = 7
            print("Blank")
        }
        
        switch colorValue {
        case 1:
            U8.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            U8.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            U8.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            U8.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            U8.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            U8.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            U8.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
        u8value = faceValue
    }
    
    @IBAction func U9Click(_ sender: Any) {
        if U9.image(for: UIControlState.normal) == blank {
            colorValue = 1
            faceValue = "U"
            print("U")
        } else if U9.image(for: UIControlState.normal) == white {
            colorValue = 2
            faceValue = "D"
            print("D")
        } else if U9.image(for: UIControlState.normal) == yellow {
            colorValue = 3
            faceValue = "B"
            print("B")
        } else if U9.image(for: UIControlState.normal) == red {
            colorValue = 4
            faceValue = "L"
            print("L")
        } else if U9.image(for: UIControlState.normal) == blue {
            colorValue = 5
            faceValue = "R"
            print("R")
        } else if U9.image(for: UIControlState.normal) == green {
            colorValue = 6
            faceValue = "F"
            print("F")
        } else {
            colorValue = 7
            print("Blank")
        }
        
        switch colorValue {
        case 1:
            U9.setImage(#imageLiteral(resourceName: "white-square"), for: UIControlState.normal)
        case 2:
            U9.setImage(#imageLiteral(resourceName: "yellow-square"), for: UIControlState.normal)
        case 3:
            U9.setImage(#imageLiteral(resourceName: "red-sqaure"), for: UIControlState.normal)
        case 4:
            U9.setImage(#imageLiteral(resourceName: "blue-square"), for: UIControlState.normal)
        case 5:
            U9.setImage(#imageLiteral(resourceName: "green-square"), for: UIControlState.normal)
        case 6:
            U9.setImage(#imageLiteral(resourceName: "orange-square"), for: UIControlState.normal)
        default:
            U9.setImage(#imageLiteral(resourceName: "blank-square"), for: UIControlState.normal)
        }
        
        if colorValue > 6 {
            colorValue = 0
        }
        u9value = faceValue
    }
    
    
    
    
    
    
    @IBAction func reset(_ sender: Any) {
        loadView()
    }
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        cube.append(u1value)
        cube.append(u2value)
        cube.append(u3value)
        cube.append(u4value)
        cube.append(u5value)
        cube.append(u6value)
        cube.append(u7value)
        cube.append(u8value)
        cube.append(u9value)
        
        cube.append(r1value)
        cube.append(r2value)
        cube.append(r3value)
        cube.append(r4value)
        cube.append(r5value)
        cube.append(r6value)
        cube.append(r7value)
        cube.append(r8value)
        cube.append(r9value)
        
        cube.append(f1value)
        cube.append(f2value)
        cube.append(f3value)
        cube.append(f4value)
        cube.append(f5value)
        cube.append(f6value)
        cube.append(f7value)
        cube.append(f8value)
        cube.append(f9value)
        
        cube.append(d1value)
        cube.append(d2value)
        cube.append(d3value)
        cube.append(d4value)
        cube.append(d5value)
        cube.append(d6value)
        cube.append(d7value)
        cube.append(d8value)
        cube.append(d9value)
        
        cube.append(l1value)
        cube.append(l2value)
        cube.append(l3value)
        cube.append(l4value)
        cube.append(l5value)
        cube.append(l6value)
        cube.append(l7value)
        cube.append(l8value)
        cube.append(l9value)
        
        cube.append(b1value)
        cube.append(b2value)
        cube.append(b3value)
        cube.append(b4value)
        cube.append(b5value)
        cube.append(b6value)
        cube.append(b7value)
        cube.append(b8value)
        cube.append(b9value)
        
        print(cube)
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
