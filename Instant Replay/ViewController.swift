//
//  ViewController.swift
//  Instant Replay
//
//  Created by Lucas Caron Albarello on 26/12/2017.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit
import ReplayKit
class ViewController: UIViewController {

    let recorder = RPScreenRecorder.shared()

    @IBAction func registrar(_ sender: UIButton) {
        recorder.startRecording { (error) in
            if let error = error {
                print(error)
            }
        }
    }
    
    @IBAction func parar(_ sender: UIButton) {
        recorder.stopRecording { (previewVC, error) in
            if let previewVC = previewVC {
                previewVC.previewControllerDelegate = self
                self.present(previewVC, animated: true, completion: nil)
            }
            if let error = error {
                print(error)
            }
        }
    }
}

extension ViewController: RPPreviewViewControllerDelegate{
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        dismiss(animated: true, completion: nil)
    }
}
