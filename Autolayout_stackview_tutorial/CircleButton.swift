//
//  CircleButton.swift
//  Autolayout_stackview_tutorial
//
//  Created by 최영재 on 2021/12/15.
//

import Foundation
import UIKit

// 인터페이스 빌더에서 디자인으로 확인 가능하게끔 IBDesignable 어노테이션
@IBDesignable
class CircleButton: UIButton {
    
    // IBInspectable 인스펙터 패널에서 사용될 수 있도록 설정
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        // cornerRadius 값이 설정되면(CGFloat) 실행
        didSet {
            // 해당 레이어(버튼)의 cornerRadius를 위의 cornerRadius 값으로 설정
            layer.cornerRadius = cornerRadius
            
            // cornerRadius가 0보다 크면 masksToBounds를 통해 바로 UI로 확인 가능(?)
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
