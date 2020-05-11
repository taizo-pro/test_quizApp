//
//  NextViewController.swift
//  testQuizApp
//
//  Created by 原田和輝 on 2020/04/21.
//  Copyright © 2020 Harada Kazuki. All rights reserved.
//

import UIKit

protocol nowScoreDelegate {
    
    func nowScore(score:Int)
    
}

class NextViewController: UIViewController {
    

    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var wrongLabel: UILabel!
    
    var delegate:nowScoreDelegate?
    
    var correctCount = Int()
    
    var wrongCount = Int()
    
    var beforeCount = Int()
    
    @IBAction func back(_ sender: Any) {
        
//        もし最高得点であれば入れ替え
        if beforeCount < correctCount{
            
            UserDefaults.standard.set(correctCount, forKey: "beforeCount")
            delegate?.nowScore(score: correctCount)
        }else if beforeCount > correctCount{
            
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
            
        }
        
//        それ以外であれば入れ替えない
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctCount)
        wrongLabel.text = String(wrongCount)
        
//        最高得点に値を入れていく
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            
            beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
        }
     
    }
    



}
