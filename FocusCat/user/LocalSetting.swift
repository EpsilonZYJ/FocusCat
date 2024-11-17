//
//  LocalSetting.swift
//  FocusCat
//

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
    
    // TODO:消除此处的错误
    val notifyPermission: Bool{
        get() = SP.get(Setting.NOTIFY_PERMISSION.name)?.toBoolean() ? true : false
        set(value){
            SP.set(Setting.NOTIFY_PERMISSION.name, value.toString())
            notifyObservers()
        }
    }
    
    
    enum Setting：Int{
        case NOW_CAT_INDEX
        case LABEL_TEXT
        case LABEL_COLOR
        case NOTIFY_PERMISSION
        case FINISH_NOTIFY
        case INTERRUPT_NOTIFY
        case CONTINUE_NOTIFY
        case FOCUS_MODE
        case INIT_TIME
        case BREAK_TIME
        case MAP_SCROLL
        case OPEN_ATTENTION_RECORD
        case LAST_SYNC
        case VERSION
        case AUTO_SYNC
    }
}
