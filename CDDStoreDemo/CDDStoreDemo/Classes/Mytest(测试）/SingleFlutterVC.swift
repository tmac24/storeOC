//
//  SingleFlutterVC.swift
//  CDDStoreDemo
//
//  Created by cdql10103 on 2023/7/14.
//  Copyright © 2023 RocketsChen. All rights reserved.
//

import Flutter
import FlutterPluginRegistrant
import UIKit

class SingleFlutterVC: FlutterViewController, DataModelObserver {
    private var channel: FlutterMethodChannel?

    init(withEntrypoint entryPoint: String?) {
      let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
      let newEngine = appDelegate.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: nil)
      GeneratedPluginRegistrant.register(with: newEngine)
      super.init(engine: newEngine, nibName: nil, bundle: nil)
      DataModel.shared.addObserver(observer: self)
    }

    deinit {
      DataModel.shared.removeObserver(observer: self)
    }

    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    func onCountUpdate(newCount: Int64) {
      if let channel = channel {
        channel.invokeMethod("setCount", arguments: newCount)
      }
    }
    
    //导航栏显示与隐藏
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = UIColor.white

      channel = FlutterMethodChannel(
        name: "multiple-flutters", binaryMessenger: self.engine!.binaryMessenger)
      channel!.invokeMethod("setCount", arguments: DataModel.shared.count)
      let navController = self.navigationController!
      channel!.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        if call.method == "incrementCount" {
          DataModel.shared.count = DataModel.shared.count + 1
          result(nil)
        } else if call.method == "next" {
//          let storyboard = UIStoryboard(name: "Main", bundle: nil)
//          let vc = storyboard.instantiateViewController(withIdentifier: "NativeViewCount")
          let vc = HostViewController();
          navController.pushViewController(vc, animated: true)
          result(nil)
        } else if call.method == "dissmissVC" {
            navController.popViewController(animated: true)
        }else {
          result(FlutterMethodNotImplemented)
        }
      }
    }
  }
