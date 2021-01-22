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
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sentEthBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager.init(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        /**
         * Using this sendEther function you can send ETH from walletAddress to another walletAddress.
         *
         * @param senderWalletAddress - must be provided sender's wallet address
         * @param password - User must enter password of wallet address
         * @param gasPrice - gas price: 30
         * @param gasLimit - gas limit atleast 21000 or more
         * @param bnbAmount - amount of ETH which user want to send
         * @param receiverWalletAddress - wallet address which is user want to send ETH
         *
         * @return if sending completes successfully the function returns transactionHash or returns error name
         */
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let gas = BigUInt(gasLimitTxtFiled.text!)
            let tx = try eth.sendEther(walletAddress: senderWalletAddressTxtxField.text!,
                                       password: passwordTxtField.text!,
                                       receiverAddress: receiverWalletAddressTxtField.text!,
                                       etherAmount: ethAmuntTxtField.text!,
                                       gasPrice: BigUInt("50"),
                                       gasLimit: gas!)
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

