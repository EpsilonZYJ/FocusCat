import SwiftUI

// TODO
// 未修复

class MainState{
    //专注的时间
    var time :CatTime =  LocalSetting.initTime
    //休息的时间
    var breakTime : CatTime = LocalSetting.breakTime
    //记录专注开始的时间
    var startTime : NowTime = NowTime(0,0,0,0,0)
    //猫猫列表
    var catList : List<Cat> = emptyList()
    //专注状态
    var focusState: FocusState = FocusState.UnFocus
    //屏幕状态，用来出错提示
    var screenState: TriState = TriState.Idle
    //标签列表
    var labelList: List<Label> = listOf()
    //弹窗状态
    var popUpsWindowsStates: PopUpsWindowsStates = PopUpsWindowsStates()
    //是否可以上下拉动到统计界面
    var scrollEnable : Boolean = true
    //当前标签
    var nowLabel: Label = LocalSetting.nowLabel
    //专注开始后当前使用的猫咪
    var nowCatIndex: Int = LocalSetting.nowCatIndex
    //休息时间，全局变量需observer监测
    var initBreakTime : CatTime = LocalSetting.breakTime
    //初始时间，全局变量需要observer监测
    var initTime :  CatTime =LocalSetting.initTime
    //专注模式，全局变量需要observer监测
    var focusMode: FocusMode = LocalSetting.focusMode
    //提示音许可，全局变量需要observer监测
    var notifyPermission : Boolean = LocalSetting.notifyPermission
    //注意力记录许可，全局变量需要observer监测
    var openAttentionRecord : Boolean = LocalSetting.openAttentionRecord
    //猫粮数量，全局变量需要observer监测
    var catFood : Int = AuthorUtils.catFood
    //提示音Map集合，全局变量需要observer监测
    var notify: Map<BreakOutType, NotifyType> = LocalSetting.notify
    //音乐播放器状态
    var musicPlayerState: MusicPlayerState = MusicPlayerState()
    //是否需要登出
    var needLogout:Boolean = false
}
