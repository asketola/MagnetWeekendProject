//
//  ViewController.swift
//  MagnetWeekendProject
//
//  Created by Annemarie Ketola on 12/5/14.
//  Copyright (c) 2014 Up Early, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wordArray = ["riding", "green", "sand", "waves", "palm tree", "beach", "surf", "board", "wax", "rashgaurd", "paddle", "I", "love", "ocean", "endless summer", "joy", "to", "the", "go", "to", "sunshine", "we", "party", "pipe", "on", "off", "the", "bikini", "tan", "salty", "hang-ten", "had", "an", "surf city USA", "going", "surfing", "sunset", "dreaming", "catch" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for word in wordArray {
            var label = UILabel()
            label.text = word //wordArray[2]
            
            
            view.addSubview(label)
            label.font = UIFont.systemFontOfSize(15)
            label.sizeToFit()
            label.center = CGPoint(x: 150, y: 200)
            label.backgroundColor = UIColor.clearColor()
            
            var x = CGFloat(arc4random_uniform(350))
            var y = CGFloat(arc4random_uniform(460))
            
            label.center = CGPoint(x: x, y: y)
            
            view.addSubview(label)
            
            //Pan Gesture
            var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
            label.addGestureRecognizer(panGesture)
            label.userInteractionEnabled = true
        }
    }

    
    func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        println("pan")
        
        // get translation
        var translation = panGesture.translationInView(view)
        //resets the translation to zero, so that when you add it to the label.center, it won't be a hyper fast movement
        panGesture.setTranslation(CGPointZero, inView: view)
        
        println(translation)
        
        
        // add dx, dy to current label center position
        // makes the gesture the UILabel
        var label = panGesture.view as UILabel
        //Adds the center of the label coordinates to the reset translation.x(or.y) you set to zero above that they match up and the gesture moves the label under your finger
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

