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
