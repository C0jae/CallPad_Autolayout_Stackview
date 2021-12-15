//
//  ViewController.swift
//  Autolayout_stackview_tutorial
//
//  Created by 최영재 on 2021/12/15.
//

import UIKit

class ViewController: UIViewController {

    // 전화번호 표시기능 구현
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    /*
    버튼 클릭기능 구현
    버튼 -> 여러개를 하나하나 connection 하는것은 비효율적
    Connection : Outlet -> Outlet Collection 으로 변경 (Outlet의 배열이라 생각)
    라인표시줄에 + 를 끌어 추가할 view 선택
     */
    @IBOutlet var phoneNumberBtns: [CircleButton]!
    
    // 통화기능 구현
    @IBOutlet weak var phoneCallBtn: CircleButton!
    
    // 수시로 바뀌는 번호에 대한 변수 설정
    var phoneNumberString = "" {
        // 번호가 설정 되었을 때 해당 번호를 phoneNumberLabel에 저장
        didSet{
            DispatchQueue.main.async { [weak self] in
                // 가지고 있는 self 가 값이 없다면 return으로 반환
                guard let self = self else {return}
                // 전화번호 출력창의 글자색을 black으로 변경
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 버튼이 클릭될 때마다 add
        for btnItem in phoneNumberBtns {
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender:)), for: .touchUpInside)
        }
        
        // 전화번호 버튼이 클릭 되었을 때
        phoneCallBtn.addTarget(self, action: #selector(onPhoneCallBtnClicked(_:)), for: .touchUpInside)
    }

    // objective-c 메소드
    // 버튼이 클릭 되었을 때 기능 구현
    @objc fileprivate func onNumberBtnClicked(sender: UIButton) {
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }
    
    @objc fileprivate func onPhoneCallBtnClicked(_ sender: UIButton) {
        // phonNumberString의 글자 삭제
        phoneNumberString.removeAll()
        
    }

}

