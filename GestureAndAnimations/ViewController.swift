//
//  ViewController.swift
//  GestureAndAnimations
//
//  Created by Marlon Garcia-Bermejo on 2023-03-16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var doubleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var singleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var gestureNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        
        showGesture(name: "double tap")
        
    }
    
    @IBAction func singleTap(_ sender: UITapGestureRecognizer) {
        
        showGesture(name: "tap")
        
        
    }
    
    func showGesture(name: String){
        gestureNameLabel.text = name
        
        UIView.animate(withDuration: 1, animations:{ self.gestureNameLabel.alpha = 1.0 },completion:fadeOutLabel(finished:))
        
    }
    
    func fadeOutLabel(finished: Bool) {
        UIView.animate(withDuration: 1, animations: {self.gestureNameLabel.alpha = 0.0})
    }
    
    
    @IBAction func bananaTap(_ sender: Any) {
    
    }
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        //print("moving image")
        
        guard let viewToPan = sender.view else {return}
        
        let translation = sender.translation(in: self.view)
        
        viewToPan.center = CGPoint(x: viewToPan.center.x + translation.x, y: viewToPan.center.y + translation.y)
        
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
}

