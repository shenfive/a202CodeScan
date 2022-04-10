//
//  ViewController.swift
//  a202CodeScan
//
//  Created by 申潤五 on 2022/4/10.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

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
        
        let avCaptureMetadatOutput = AVCaptureMetadataOutput()
        avCaptureMetadatOutput.setMetadataObjectsDelegate(self, queue: .main)
        avCaptureSession.addOutput(avCaptureMetadatOutput)
        
        
        
        
        
        //先建一個 UIView 做為輸出的影像，把圖層加到畫面中的圖層中，讓使用者可以看到
        let avCaptureVidoePreviewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        
        avCaptureVidoePreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avCaptureVidoePreviewLayer.frame = videoPreview.bounds
        self.videoPreview.layer.addSublayer(avCaptureVidoePreviewLayer)
        
        avCaptureSession.startRunning()
        
    }
    


}

