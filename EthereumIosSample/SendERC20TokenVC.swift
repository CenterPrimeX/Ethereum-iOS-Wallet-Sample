//
//  SendERC20TokenVC.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK
import BigInt

class SendERC20TokenVC: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var senderAddressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var contractAddressTxtField: UITextField!
    @IBOutlet weak var receiverAddressTxtLabel: UITextField!
    @IBOutlet weak var amountTxtField: UITextField!
    @IBOutlet weak var gasLimitTxtField: UITextField!
    @IBOutlet weak var txHashTxtField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager.init(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        do{
            /**
                if function successfully completes result can be caught in this block
             */
            let gas = BigUInt(gasLimitTxtField.text!)
            let tx = try eth.sendERC20Token(walletAddress: senderAddressTxtField.text!, password: passwordTxtField.text!, receiverAddress: receiverAddressTxtLabel.text!, tokenAmount: amountTxtField.text!, tokenContractAddress: contractAddressTxtField.text!, gasPrice: "50", gasLimit: gas!)
            txHashTxtField.text = tx
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
}

