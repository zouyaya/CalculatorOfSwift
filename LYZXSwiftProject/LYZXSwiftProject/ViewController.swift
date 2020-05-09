//
//  ViewController.swift
//  LYZXSwiftProject
//
//  Created by yangou on 2020/5/7.
//  Copyright © 2020 hello. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
//        creatUI()
//        chengfabiao()
        
        calculaterCompute()
//
        
    
    }
    
    /**
     *相关页面的布局实现
     */
    var clickButton :UIButton?
    func creatUI() {
        
        
        clickButton = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        clickButton?.backgroundColor = .cyan
        self.view.addSubview(clickButton!)
        
        
    }

    
     let ScreenWidth = UIScreen.main.bounds.size.width
     let ScreenHeigth = UIScreen.main.bounds.size.height
    /**
     *九九乘法表的实现
     */
    //实现九九乘法表
    func chengfabiao() {
        
    
        let bottomView = UIView(frame: CGRect(x: 0, y: 150, width:ScreenWidth ,height: ScreenWidth))
        bottomView.backgroundColor = .red
        self.view.addSubview(bottomView)
        let grideWidth: CGFloat = (ScreenWidth - 8)/9
        for rowIndex in 1...9 {
            
            for columnIndex in 1...9 {
                
                if columnIndex >= rowIndex {
                    let itemLabel = UILabel(frame: CGRect(x: CGFloat(rowIndex - 1)*(grideWidth + 1) , y: CGFloat(columnIndex - 1) * (grideWidth + 1), width: grideWidth, height: grideWidth))
                   itemLabel.backgroundColor = .blue
                   itemLabel.textColor = .black
                   itemLabel.textAlignment = .center
                   itemLabel.text = "\(columnIndex) * \(rowIndex) = \(columnIndex * rowIndex)"
                   itemLabel.font = UIFont.systemFont(ofSize: 13)
                    itemLabel.numberOfLines = 0
                   bottomView.addSubview(itemLabel)
                }
       
            }
            
            
        }
        
        
        
    }
    
 
    
    enum CalculterOperation {
        
        case add,minus,mutiply,div
    }
    
    var showLabel: UILabel?
    var firstOperatNumber :String? //第一个操作数
    var secondOperatNumber :String? //第二个操作数
    var currentOperation: CalculterOperation? //定义枚举类型，进行加减乘法的计算
    var tempConvertString = ""

    /**
     *
     *自定义实现手机计算器
     */
    func calculaterCompute() {
        
       initialzieCalculaterTopView()
        
        
       initializeCalculaterBottomView()
        
  
    }
    
    
    /**
     计算器顶部的布局
     */
    func initialzieCalculaterTopView() {
        
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200))
        topView.backgroundColor = .black
        self.view.addSubview(topView)
        
        
        showLabel = UILabel(frame: CGRect(x: 0, y: 100, width: ScreenWidth, height: 100))
        showLabel?.backgroundColor = .clear
        showLabel?.textAlignment = .right
        showLabel?.font = UIFont.boldSystemFont(ofSize: 55)
        showLabel?.text = "0"
        showLabel?.textColor = .white
        topView.addSubview(showLabel!)
        
        
    }
    
    /**
     计算器底部的布局
     */
    func initializeCalculaterBottomView() {
        
       let bottonView = UIView(frame: CGRect(x: 0, y: 200, width: ScreenWidth, height: ScreenHeigth - 200))
        bottonView.backgroundColor = .lightGray
        self.view.addSubview(bottonView)
        
        //clearButton
        
        let buttonWidth = (ScreenWidth - 3)/4
        
        
        let clearButton = UIButton(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: buttonWidth))
        clearButton.backgroundColor = .white
        clearButton.setTitle("AC", for: .normal)
        clearButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.tag = 20
        clearButton.addTarget(self, action: #selector(clearAction), for: .touchUpInside)
        bottonView.addSubview(clearButton)
    
        
        //正负按钮的实现
        
        let zhengOrFuButton = UIButton(frame: CGRect(x: buttonWidth + 1, y: 0, width: buttonWidth, height: buttonWidth))
        zhengOrFuButton.backgroundColor = .white
        zhengOrFuButton.setTitle("+/-", for: .normal)
        zhengOrFuButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        zhengOrFuButton.setTitleColor(.black, for: .normal)
        zhengOrFuButton.tag = 20
        zhengOrFuButton.addTarget(self, action: #selector(zhengFuAction), for: .touchUpInside)
        bottonView.addSubview(zhengOrFuButton)
        
        
        //除以100
        let div100Button = UIButton(frame: CGRect(x: 2 * (buttonWidth + 1), y: 0, width: buttonWidth, height: buttonWidth))
        div100Button.backgroundColor = .white
        div100Button.setTitle("%", for: .normal)
        div100Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        div100Button.setTitleColor(.black, for: .normal)
        div100Button.tag = 20
        div100Button.addTarget(self, action: #selector(div100Action), for: .touchUpInside)
        bottonView.addSubview(div100Button)
        
        
        let divButton = UIButton(frame: CGRect(x: 3 * (buttonWidth + 1), y: 0, width: buttonWidth, height: buttonWidth))
        divButton.backgroundColor = .white
        divButton.setTitle("➗", for: .normal)
        divButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        divButton.setTitleColor(.black, for: .normal)
        divButton.tag = 20
        divButton.addTarget(self, action: #selector(divAction), for: .touchUpInside)
        bottonView.addSubview(divButton)
        
        
        
        let firstLineArray = ["7","8","9","x"]
        for index in 0..<firstLineArray.count {
            
           
            let columnOneButton = UIButton(frame: CGRect(x:  CGFloat(index) * (buttonWidth + 1), y: buttonWidth + 1, width: buttonWidth, height: buttonWidth))
            columnOneButton.backgroundColor = .white
            columnOneButton.setTitle(firstLineArray[index], for: .normal)
            columnOneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            columnOneButton.setTitleColor(.black, for: .normal)
            columnOneButton.tag = index + 1000
            columnOneButton.addTarget(self, action: #selector(columnOneButtonAction), for: .touchUpInside)
            bottonView.addSubview(columnOneButton)

            
        }
        
        
        
        let secondLineArray = ["4","5","6","-"]
        for index in 0..<secondLineArray.count {
            
            let columnSecondButton = UIButton(frame: CGRect(x:  CGFloat(index) * (buttonWidth + 1), y: 2 * (buttonWidth + 1), width: buttonWidth, height: buttonWidth))
            columnSecondButton.backgroundColor = .white
            columnSecondButton.setTitle(secondLineArray[index], for: .normal)
            columnSecondButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            columnSecondButton.setTitleColor(.black, for: .normal)
            columnSecondButton.tag = index + 2000
            columnSecondButton.addTarget(self, action: #selector(columnSecondButtonAction), for: .touchUpInside)
            bottonView.addSubview(columnSecondButton)
            
            
        }
        
        
        
        let thirdLineArray = ["1","2","3","+"]
        
        for index in 0..<thirdLineArray.count {
            
            let columnThirdButton = UIButton(frame: CGRect(x:  CGFloat(index) * (buttonWidth + 1), y: 3 * (buttonWidth + 1), width: buttonWidth, height: buttonWidth))
            columnThirdButton.backgroundColor = .white
            columnThirdButton.setTitle(thirdLineArray[index], for: .normal)
            columnThirdButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            columnThirdButton.setTitleColor(.black, for: .normal)
            columnThirdButton.tag = index + 3000
            columnThirdButton.addTarget(self, action: #selector(columnThirdButtonAction), for: .touchUpInside)
            bottonView.addSubview(columnThirdButton)
            
            
        }
        
        
        
        let zeroButton = UIButton(frame: CGRect(x: 0, y: 4 * (buttonWidth + 1), width: buttonWidth * 2 + 1, height: buttonWidth))
        zeroButton.backgroundColor = .white
        zeroButton.setTitle("0", for: .normal)
        zeroButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.addTarget(self, action: #selector(zeroButtonAction), for: .touchUpInside)
        bottonView.addSubview(zeroButton)
        
        
        
        let pointButton = UIButton(frame: CGRect(x: 2*(buttonWidth + 1), y: 4 * (buttonWidth + 1), width: buttonWidth, height: buttonWidth))
        pointButton.backgroundColor = .white
        pointButton.setTitle(".", for: .normal)
        pointButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        pointButton.setTitleColor(.black, for: .normal)
        pointButton.addTarget(self, action: #selector(pointButtonAction), for: .touchUpInside)
        bottonView.addSubview(pointButton)
        
        
        
        let equalButton = UIButton(frame: CGRect(x: 3*(buttonWidth + 1), y: 4 * (buttonWidth + 1), width: buttonWidth, height: buttonWidth))
        equalButton.backgroundColor = .white
        equalButton.setTitle("=", for: .normal)
        equalButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        equalButton.setTitleColor(.black, for: .normal)
        equalButton.addTarget(self, action: #selector(equalButtonAction), for: .touchUpInside)
        bottonView.addSubview(equalButton)
        

        
    }
    
    
    
    
    //计算结果的方法
    func calcuaterResult(firstNum firstNumber:String,secondNum secondNumber:String,opt operation:CalculterOperation) -> String {
        
        var resultstring = "0"
        var firstValue = 0
        var secondValue = 0
        
        if firstNumber.contains(".") || secondNumber.contains(".") { //此处是两个float数相加
            
            
            
            
        }else{
            
           firstValue = Int(firstNumber)!
           secondValue = Int(secondNumber)!
            
        }
        
        switch operation {
        case .add:
            
            let addResult:Int = Int(firstValue) + Int(secondValue)
            resultstring = "\(addResult)"
            
            break
            
        case .minus:
            
            let addResult:Int = Int(firstValue) - Int(secondValue)
            resultstring = "\(addResult)"
            
            break
       case .mutiply:
               
               let addResult:Int = Int(firstValue) * Int(secondValue)
               resultstring = "\(addResult)"
               
               break
        case .div:
            let addResult:Int = Int(firstValue) / Int(secondValue)
            resultstring = "\(addResult)"
            break
        }
        
        return resultstring
        
    }
    
    
    
    
    /**
     *
     *相关点击事件的实现
     */
    
    @objc func clearAction(item:UIButton){
        
       //清楚按钮事件
        showLabel?.text = "0"
    }
    
    //正负切换
    @objc func zhengFuAction(button:UIButton){

        button.isSelected = !button.isSelected
        let inputString: String = showLabel?.text ?? "0"
        if button.isSelected{
            //将数据变为负数
            if inputString != "0" {
                
                showLabel?.text = "-" + inputString
            }
            
        }else{
            
            if inputString != "0" {
                
                if inputString.hasPrefix("-"){
                    //此时是负数，应该改为正数
                    let sumString:String = String(inputString.suffix(inputString.count - 1))
                    showLabel?.text = sumString
                }else{
                    
                     showLabel?.text = inputString
                }
                               
            }
            
            
        }
        
    }
    
    //除以100的结果
    @objc func div100Action() {
    
        let inputString = showLabel?.text ?? "0"
        if inputString == "0" {
            
            showLabel?.text = "0"
        }else{
           
            let doubInput = Double(inputString)
            let computerIngeter: Double = doubInput!/100.0
            showLabel?.text = "\(computerIngeter)"
            
        }
        
    }
    
    //除法操作
    @objc func divAction() {
    
        
        firstOperatNumber  = showLabel?.text ?? "0"
        secondOperatNumber = showLabel?.text ?? "0"
        currentOperation = .div
        
    }
    
    //第一列的点击事件
    @objc func columnOneButtonAction(button:UIButton){
        
        let buttonIndex = button.tag
        if buttonIndex != 1003 {
            
            let currentString = button.currentTitle
            if currentOperation != nil { //也就是说他点击过相关的操作符
        
                if firstOperatNumber != nil {
                                            
                    tempConvertString += currentString!
                    showLabel?.text = tempConvertString
                    secondOperatNumber = showLabel?.text //将操作的数赋值给第二个操作数
                    
                 }
    
                
            }else{
              
                
                let inputString = showLabel?.text
                if inputString == "0" {
                              
                  showLabel?.text = currentString
                    
               }else{
                  
                  showLabel?.text = inputString! + currentString!
               }
                
            }
            
        }else{ //乘法操作
            
            
            
            firstOperatNumber  = showLabel?.text ?? "0"
            currentOperation = .mutiply
    
        }

    
    }


    //第二列按钮的点击事件
    @objc func columnSecondButtonAction(button:UIButton){
        
        let buttonIndex = button.tag
        if buttonIndex != 2003 {
            
            let currentString = button.currentTitle
            if currentOperation != nil { //也就是说他点击过相关的操作符
        
                if firstOperatNumber != nil {
                                            
                    tempConvertString += currentString!
                    showLabel?.text = tempConvertString
                    secondOperatNumber = showLabel?.text //将操作的数赋值给第二个操作数
                    
                 }
    
                
            }else{
              
                
                let inputString = showLabel?.text
                if inputString == "0" {
                              
                  showLabel?.text = currentString
                    
               }else{
                  
                  showLabel?.text = inputString! + currentString!
                }
                
            }
                        
        }else{ //减法操作
            
            firstOperatNumber  = showLabel?.text ?? "0"
            currentOperation = .minus
    
        }
    }
    
    //第三列按钮的点击事件
    @objc func columnThirdButtonAction(button:UIButton){
           
       let buttonIndex = button.tag
       if buttonIndex != 3003 {
           
          let currentString = button.currentTitle
         if currentOperation != nil { //也就是说他点击过相关的操作符
   
           if firstOperatNumber != nil {
                                       
               tempConvertString += currentString!
               showLabel?.text = tempConvertString
               secondOperatNumber = showLabel?.text //将操作的数赋值给第二个操作数
               
            }

           
        }else{
         
           
           let inputString = showLabel?.text
           if inputString == "0" {
                         
             showLabel?.text = currentString
               
          }else{
             
             showLabel?.text = inputString! + currentString!
           }
                       
         }
       }else{ //加法操作
           
           firstOperatNumber  = showLabel?.text ?? "0"
           currentOperation = .add
   
       }
           
           
    }

    //数字0 的点击事件
    @objc func zeroButtonAction(){
        
        /**
         *有以下几种情况
         *最开是的时候为0 ，则随便输入都是0 不变
         *以0.开头的，则往后追加
         *还有就是不以0 开始的，就追加
         *
         */
        let inputString = showLabel?.text
        if inputString == "0" {
            
            showLabel?.text = "0"
            
        }else{
            
            showLabel?.text = inputString! + "0"
            
        }
        
    }
    
    //小数点的点击事件
    @objc func pointButtonAction(){
        
        /**
         每一个数字只有一个小数点
         */
        let inputstring = showLabel?.text
        if !inputstring!.contains(".") {
         
            showLabel?.text = inputstring! + "."
            
        }

    }
    
    //等于的最后点击事件
    @objc func equalButtonAction(){
        
        
      let lastResutlString = calcuaterResult(firstNum: firstOperatNumber!, secondNum: secondOperatNumber!,opt: currentOperation!)
      showLabel?.text = lastResutlString
      firstOperatNumber = nil
      secondOperatNumber = nil //相关的清空操作
      currentOperation = nil
      tempConvertString = ""
        
    }
    
    
}

