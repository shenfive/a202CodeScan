//
//  ViewController.swift
//  a202CodeScan
//
//  Created by 申潤五 on 2022/4/10.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var videoPreview: UIView!
    
    var avCaptureSession = AVCaptureSession()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCodeScan()
    }
    
    func setCodeScan(){
        guard let avCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let avCaptureInput =
        try? AVCaptureDeviceInput(device: avCaptureDevice) else { return }
        avCaptureSession.addInput(avCaptureInput) //session 加上輸入
         
    }
    


}

