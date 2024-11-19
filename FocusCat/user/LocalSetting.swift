//
//  LocalSetting.swift
//  FocusCat
//

import Foundation
import UIKit

protocol LocalSettingObserver: AnyObject, Equatable{
    func onLocalSettingChange()
}


class LocalSetting<T: LocalSettingObserver>{
    // 转换为单例模式
    private init(){}
//    static let shared = LocalSetting()
    
    private var localSettingObservers: [T] = []
    
    
    
    func addObserver(localSettingObserver: T){
        localSettingObservers.append(localSettingObserver)
    }
    func removeObserver(localSettingObserver: T){
        if let index = localSettingObservers.firstIndex(of: localSettingObserver){
            localSettingObservers.remove(at: index)
        }
    }
    
    private func notifyObservers(){
        for observer in localSettingObservers {
            observer.onLocalSettingChange()
        }
    }
    
    enum Setting: String{
        case NOW_CAT_INDEX = "NOW_CAT_INDEX"
        case LABEL_TEXT = "LABEL_TEXT"
        case LABEL_COLOR = "LABEL_COLOR"
        case NOTIFY_PERMISSION = "NOTIFY_PERMISSION"
        case FINISH_NOTIFY = "FINISH_NOTIFY"
        case INTERRUPT_NOTIFY = "INTERRUPT_NOTIFY"
        case CONTINUE_NOTIFY = "CONTINUE_NOTIFY"
        case FOCUS_MODE = "FOCUS_MODE"
        case INIT_TIME = "INIT_TIME"
        case BREAK_TIME = "BREAK_TIME"
        case MAP_SCROLL = "MAP_SCROLL"
        case OPEN_ATTENTION_RECORD = "OPEN_ATTENTION_RECORD"
        case LAST_SYNC = "LAST_SYNC"
        case VERSION = "VERSION"
        case AUTO_SYNC = "AUTO_SYNC"
    }
    
    var notifyPermission: Bool{
        get{
            return SP.get(Setting.NOTIFY_PERMISSION.rawValue)?.toBool() != nil ? true : false
        }
        set(value){
            SP.set(Setting.NOTIFY_PERMISSION.name, value.toString())
            notifyObservers()
        }
    }
    
    var notify: [BreakOutType, NotifyType]{
        get{
            var newMap: [BreakOutType, NotifyType] = []
            newMap[BreakOutType.Finish] = NotifyType.valueOf(SP.get(Setting.FINISH_NOTIFY.rawValue)?: NotifyType.Default.name)
                        newMap[BreakOutType.Interrupt]=
                            NotifyType.valueOf(SP.get(Setting.INTERRUPT_NOTIFY.name)?: NotifyType.Default.name)
                        newMap[BreakOutType.Continue]=
                            NotifyType.valueOf(SP.get(Setting.CONTINUE_NOTIFY.name)?: NotifyType.Default.name)
                        return newMap
        }
    }
    
    
}
