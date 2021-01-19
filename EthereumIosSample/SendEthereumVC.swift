//
//  SendEthereumVC.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK
import BigInt
class SendEthereumVC: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var senderWalletAddressTxtxField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var receiverWalletAddressTxtField: UITextField!
    @IBOutlet weak var ethAmuntTxtField: UITextField!
    @IBOutlet weak var gasLimitTxtFiled: UITextField!
    @IBOutlet weak var txIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sentEthBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager.init(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let gas = BigUInt(gasLimitTxtFiled.text!)
            let tx = try eth.sendEther(walletAddress: senderWalletAddressTxtxField.text!, password: passwordTxtField.text!, receiverAddress: receiverWalletAddressTxtField.text!, etherAmount: ethAmuntTxtField.text!, gasPrice: BigUInt("50"), gasLimit: gas!)
            txIdLabel.text = tx
            
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension SendEthereumVC {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SendEthereumVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
