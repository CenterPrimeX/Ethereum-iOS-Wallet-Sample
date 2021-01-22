//
//  CreateWalletVC.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK
class CreateWalletVC: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var pwdTextFieldOutlet: UITextField!
    @IBOutlet weak var confirmPwdTxtFieldOutlet: UITextField!
    @IBOutlet weak var yourWalletLblOutlet: UILabel!
    @IBOutlet weak var walletAddressLblOutlet: UILabel!
    @IBOutlet weak var copyBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createWalletBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager.init(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        /**
         * Using this createWallet function user can create a wallet.
         *
         * @param password - must be provided password to wallet address
         *
         * @return walletAddress
         */
        let password = pwdTextFieldOutlet.text
        let confirmPwd = confirmPwdTxtFieldOutlet.text
        if password == confirmPwd {
            
            do {
                /**
                    if function successfully completes result can be caught in this block
                 */
                let walletAddress = try eth.createWallet(walletPassword: password!)
                walletAddressLblOutlet.text = walletAddress?.walletAddress
                yourWalletLblOutlet.text = "Your wallet address!"
                copyBtnOutlet.isHidden = false
                
            } catch{
                /**
                     if function fails error can be catched in this block
                 */
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = walletAddressLblOutlet.text
    }
}

