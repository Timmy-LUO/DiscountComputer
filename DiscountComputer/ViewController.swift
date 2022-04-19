//
//  ViewController.swift
//  DiscountComputer
//
//  Created by 羅承志 on 2021/12/10.
//

import UIKit

class ViewController: UIViewController {
    
    var resultLabel: UILabel = {
        let label = UILabel()
        //let labels: UILabel = .init()
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.text = "0"
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var differenceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "省下"
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var showDiscountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.text = " "
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var amountTextField: UITextField = {
        let textField = UITextField()
        textField.font = .boldSystemFont(ofSize: 40)
        textField.backgroundColor = .orange
        textField.placeholder = "輸入金額"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var discountPercentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.text = " "
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setDiscountRateTextView: UITextView = {
        let textView = UITextView()
        textView.text = "移動Slider設置折扣率(%)"
        textView.font = UIFont.boldSystemFont(ofSize: 30)
        textView.textColor = .black
        textView.backgroundColor = .gray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var discountSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        //slider.value = 1
        slider.backgroundColor = UIColor.systemGray
        slider.maximumTrackTintColor = UIColor.systemOrange
        slider.minimumTrackTintColor = UIColor.systemBlue
        slider.thumbTintColor = UIColor.systemRed
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var controller = UIAlertController()
    var action = UIAlertAction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        discountSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        amountTextField.addTarget(self, action: #selector(enterTextRenew), for: .editingChanged)
    }
    
    var cal = Calculator() {
        didSet {
            discountPercentLabel.text = cal.discountText
            resultLabel.text = "Total: " + cal.amountAfterDiscount.string(to: 0)
            differenceLabel.text = cal.saveMoneyText
            showDiscountLabel.text = "\(discountSlider.value.string(to: 1))折"
        }
    }
    
    @objc func sliderValueChanged(_ slider: UISlider) {
        cal.changeDiscount(slider.value / 10)
    }
    
    @objc func enterTextRenew(_ sender: UITextField) {
        cal.changeAmount(text: sender.text)
    }
    
    private func setupLayout() {
        view.backgroundColor = .gray
        view.addSubview(resultLabel)
        view.addSubview(differenceLabel)
        view.addSubview(showDiscountLabel)
        view.addSubview(amountTextField)
        view.addSubview(discountPercentLabel)
        view.addSubview(setDiscountRateTextView)
        view.addSubview(discountSlider)
                
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            differenceLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            differenceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            differenceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
            
            showDiscountLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            showDiscountLabel.leadingAnchor.constraint(equalTo: differenceLabel.trailingAnchor, constant: 15),
            showDiscountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            amountTextField.topAnchor.constraint(equalTo: showDiscountLabel.bottomAnchor, constant: 20),
            amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -190),
            
            discountPercentLabel.topAnchor.constraint(equalTo: showDiscountLabel.bottomAnchor, constant: 20),
            discountPercentLabel.leadingAnchor.constraint(equalTo: amountTextField.trailingAnchor, constant: 8),
            discountPercentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            setDiscountRateTextView.topAnchor.constraint(equalTo: discountPercentLabel.bottomAnchor, constant: 50),
            setDiscountRateTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setDiscountRateTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            discountSlider.topAnchor.constraint(equalTo: setDiscountRateTextView.bottomAnchor, constant: 10),
            discountSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            discountSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
