import SwiftUI

class Cat{
    var id: Int
    var name: String
    var chineseName: String
    var mood: Int
    var favor: Int
    var state: Int
    var level: Int
    
    init(id: Int, name: String, chineseName: String, mood: Int, favor: Int, state: Int, level: Int) {
        self.id = id
        self.name = name
        self.chineseName = chineseName
        self.mood = mood
        self.favor = favor
        self.state = state
        self.level = level
    }
}

class Collection{
    var code: Int
    var number: Int
    
    init(code: Int, number: Int) {
        self.code = code
        self.number = number
    }
}

class Recording{
    var catId: Int
    var date: String
    var startTime: String
    var endTime: String
    var totalTime: Int
    var color: Color
    var text: String
    var focusMode: FocusMode
    
    init(catId: Int, date: String, startTime: String, endTime: String, totalTime: Int, color: Color, text: String, focusMode: FocusMode) {
        self.catId = catId
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.totalTime = totalTime
        self.color = color
        self.text = text
        self.focusMode = focusMode
    }
}

class CatTime{
    var minute: Int
    var second: Int
    
    init(minute: Int, second: Int) {
        self.minute = minute
        self.second = second
    }
}

class NowTime{
    var year: Int
    var month: Int
    var day: Int
    var hour: Int
    var minute: Int
    
    init(year: Int, month: Int, day: Int, hour: Int, minute: Int) {
        self.year = year
        self.month = month
        self.day = day
        self.hour = hour
        self.minute = minute
    }
}

class RankTime{
    var hour: Int
    var minute: Int
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
}

class NowDate{
    var year: Int
    var month: Int
    var day: Int
    
    init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }
}

class Label{
    var text: String
    var color: Color
    
    init(text: String, color: Color) {
        self.text = text
        self.color = color
    }
}

class Location{
    var name: String
    var level: Int
    var catFoodConsume: Int
    
    init(name: String, level: Int, catFoodConsume: Int) {
        self.name = name
        self.level = level
        self.catFoodConsume = catFoodConsume
    }
}

class AttentionReport{
    var time: String
    var focusMode: FocusMode
    var records: List<AttentionRecord>
    var score: Int
    
    init(time: String, focusMode: FocusMode, records: List<AttentionRecord>, score: Int) {
        self.time = time
        self.focusMode = focusMode
        self.records = records
        self.score = score
    }
}

    // TODO: 未修复error

class IOCallback<T>(
    private val onSuccess: ((T) -> Unit)? = null,
    private val onError: ((Throwable) -> Unit)? = null,
    private val onCompleted: (suspend (T) -> Unit)? = null,
    private val onErrorHandler: (suspend (Throwable) -> Unit)? = null,
) {
    suspend fun onCompleted(value: T) {
        withContext(Dispatchers.Main) {
            onSuccess?.invoke(value)
        }

        withContext(Dispatchers.IO) {
            onCompleted?.invoke(value)
        }
    }

    suspend fun onErrorHandler(throwable: Throwable) {
        withContext(Dispatchers.Main) {
            onError?.invoke(throwable)
        }

        withContext(Dispatchers.IO) {
            onErrorHandler?.invoke(throwable)
        }
    }
}

enum NotifyType(val value: String, val fileName: String) {
    Default("无", ""),
    CatSnore("小猫呼噜", "music/notify_1.mp3")
}

enum MusicType(val fileName: String) {
    Music1("music/music1.ogg"),
    Music2("music/music2.mp3")
}

enum BreakOutType(
    val value: String,
    val whenAction: (old: FocusState, new: FocusState) -> Boolean,
) {
    Finish("专注完成", { old, new ->
        new == FocusState.OnFinish(true) && old == FocusState.OnFocus(true)
    }),
    Interrupt("专注中断", { old, new ->
        new == FocusState.OnFinish(false) && old is FocusState.OnFocus
    }),
    Continue("专注继续", { old, new ->
        new == FocusState.OnFocus(true) && old == FocusState.OnFocus(false)
    }),
    Start("专注开始", { old, new ->
        new == FocusState.OnFocus(true) && old == FocusState.UnFocus
    }),
    Pause("专注暂停", { old, new ->
        new == FocusState.OnFocus(false) && old == FocusState.OnFocus(true)
    }),
    Recover("恢复主界面", { old, new ->
        new == FocusState.UnFocus
    })
}

/**
 * 数据埋点的种类
 */
enum DataBuriedPoint(val tag: String) {
    TAG("index:tags:tag"),//点击标签
    EDIT_TAG("index:tags:edit_tag"),//编辑标签
    WORLD_ENTER("index:world_entrance:enter"),//进入浮猫世界
    EDIT_INFO("settings:personal:edit_info"),//编辑个人信息
    OPEN_NOTIFY("settings:notify_tone:open_notify"),//开启提示音
    LOGOUT("settings:logout"),//登出
    REST("focus:rest:rest"),//休息
    RESUME("focus:rest:resume"),//继续专注
    QUIT("focus:rest:quit"),//中断专注
    MUSIC("focus:rest:music"),//开启音乐
    HANDBOOK_ENTER("world:handbook:enter"),//进入图鉴
    EXPLORE("world:explore:explore"),//点击探险
    EXPLORE_FINISH("world:explore:finish"),//结束探险
    CASE_ENTER("world:case:enter"),//进入匣子
}
