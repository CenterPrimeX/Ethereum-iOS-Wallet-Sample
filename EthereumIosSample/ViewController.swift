//
//  ViewController.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createWalletBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "CreateWalletVC")
    }
    @IBAction func exportKeystorebtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "ExportKeystoreVC")
    }
    @IBAction func exportPrivateKeyBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "ExportPrivateKeyVC")
    }
    @IBAction func importKeystoreBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "ImportByKeystore")
    }
    @IBAction func importPrivateKeyBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "ImportByPrivateKeyVC")
    }
    @IBAction func checkBalanceBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "CheckBalanceVC")
    }
    @IBAction func checkTokenBalanceBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "CheckERC20TokenBalanceVC")
    }
    @IBAction func sendEthBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "SendEthereumVC")
    }
    @IBAction func sendTokenBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "SendERC20TokenVC")
    }
    
    func moveToNextVC(storyBoardID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: storyBoardID)
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}

//MARK: dismiss keyboard when tapped around for all ViewControllers
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

