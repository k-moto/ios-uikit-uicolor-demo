//
//  ViewController.swift
//  ios-uikit-uicolor-demo
//
//  Created by OkuderaYuki on 2017/02/16.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var sampleView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var isRedButton: UIButton!

    let ciColor = CIColor(color: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1))
    var cgColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1).cgColor
    
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        
        predefinedColor()
        
        // output UIColor
        sampleView.backgroundColor = color
    }
    
    //MARK:- UIColorオブジェクトの生成
    
    /// カラーパレットでUIColorオブジェクトの色を設定する
    private func colorLiteral() {
        color = #colorLiteral(red: 0.8784313725, green: 0.3137254902, blue: 0.6588235294, alpha: 1) // (r, g, b) = (224, 80, 168)
    }
    
    /// 定義済みの色を使用してUIColorオブジェクト生成する
    private func predefinedColor() {
        color = .red
    }
    
    /// rgbαの値を指定してUIColorオブジェクトを生成する
    private func customColor() {
        color = UIColor(colorLiteralRed: 1.0, green: 0.9, blue: 0, alpha: 1.0)
    }
    
    /// パターンを使用してUIColorオブジェクトを生成する
    ///
    /// タイル状に繰り返し表示される
    private func patternImage() {
        guard let image = UIImage(named: "Dog") else { return }
        color = UIColor(patternImage: image)
    }
    
    /// CIColorからUIColorオブジェクトを生成する
    private func createFromCiColor() {
        color = UIColor(ciColor: ciColor)
    }
    
    /// CGColorからUIColorオブジェクトを生成する
    private func createFromCgColor() {
        color = UIColor(cgColor: cgColor)
    }
    
    //MARK:- UIColorオブジェクトの編集
    
    /// 透過度を編集する
    private func editAlphaValue() {
        guard let color = color else { return }
        self.color = color.withAlphaComponent(0.5)
    }
    
    /// 指定したサイズを塗りつぶしたイメージを生成する
    private func imageFilledRect() {
        let fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let sampleViewRect = sampleView.frame
        
        UIGraphicsBeginImageContext(sampleViewRect.size)
        fillColor.setFill()
        UIRectFill(sampleViewRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // output Image
        imageView.image = image
        imageView.isHidden = false
    }

    // MARK: - UIColorを比較する

    /// 引数の色が赤かどうか
    private func isRed(color: UIColor) -> Bool {
        return color == .red
    }

    @IBAction private func didTapIsRedButton(_ sender: UIButton) {

        /*
         引数の色を変えて動作確認
         */
        print("背景色比較: \(isRed(color: sender.backgroundColor!))")

        let rgbaColor = UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        print("rgbaで作成した色と比較: \(isRed(color: rgbaColor))")

        print("定義済みの色と比較: \(isRed(color: .red))")
    }

}

