//
//  ImportByPrivateKeyVC.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK
class ImportByPrivateKeyVC: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var privateKeyTxtField: UITextField!
    @IBOutlet weak var walletAddressLabel: UILabel!
    @IBOutlet weak var copyBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func importWalletBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager.init(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        /**
         * Using this importFromPrivateKey function user can import his wallet from its private key.
         *
         * @param privateKey - private key of wallet address
         *
         * @return walletAddress
         */
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let address = try eth.importByPrivateKey(privateKey: privateKeyTxtField.text!)
            walletAddressLabel.text = address?.walletAddress
            copyBtnOutlet.isHidden = false
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
        
    }
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = walletAddressLabel.text
    }
    
}

