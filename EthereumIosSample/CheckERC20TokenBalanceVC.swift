//
//  CheckERC20TokenBalanceVC.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK
class CheckERC20TokenBalanceVC: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var walletAddressTxtField: UITextField!
    @IBOutlet weak var contractAddressTxtField: UITextField!
    @IBOutlet weak var balanceTxtField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkBalanceBtnAction(_ sender: Any) {
        let walletAddress = walletAddressTxtField.text!
        let contract = contractAddressTxtField.text!
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let balance = try eth.getERC20TokenBalance(tokenContractAddress: contract, walletAddress: walletAddress)
            balanceTxtField.text = balance
        }catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}
extension CheckERC20TokenBalanceVC {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(CheckERC20TokenBalanceVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}