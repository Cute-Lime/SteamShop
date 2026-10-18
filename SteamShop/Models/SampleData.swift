import SwiftUI

// 遊戲資料
enum SampleData {
    /// 精選與推薦
    static let featured: [Game] = [
        Game(title: "Astral Party", imageName: "AstralParty",
             reviewRating: "褒貶不一", reviewCount: "1,293 篇評論", reviewColor: Theme.mixed, price: "免費遊玩"),
        Game(title: "女王遊戲", imageName: "女王遊戲",
             reviewRating: "極度好評", reviewCount: "324 篇評論", price: "NT$ 188"),
        Game(title: "PUBG: BATTLEGROUNDS", imageName: "PUBG",
             reviewRating: "褒貶不一", reviewCount: "32,671 篇評論", reviewColor: Theme.mixed, price: "免費遊玩"),
        Game(title: "伊莫", imageName: "伊莫",
             reviewRating: "褒貶不一", reviewCount: "473 篇評論", reviewColor: Theme.mixed, price: "免費遊玩"),
        Game(title: "SiNiSistar Lite Version", imageName: "SiNiSistar",
             reviewRating: "極度好評", reviewCount: "885 篇評論", price: "NT$ 102"),
        Game(title: "Valheim", imageName: "Valheim",
             reviewRating: "極度好評", reviewCount: "3,310 篇評論", price: "NT$ 648"),
    ]

    /// 折扣與活動
    static let deals: [DealItem] = [
        DealItem(games: [
            Game(title: "", imageName: "SIFU", badge: "週末特價",
                 discount: 75, originalPrice: "NT$ 569", price: "NT$ 142")]),
        DealItem(games: [
            Game(title: "", imageName: "MachineGames", badge: "週末特價",
                 discount: 85, discountPrefix: "最高可省")]),
        DealItem(games: [
            Game(title: "", imageName: "ADInfinitum", badge: "今日特惠",
                 discount: 90, originalPrice: "NT$ 499", price: "NT$ 50"),
            Game(title: "", imageName: "CityStatesMedieval", badge: "今日特惠",
                 discount: 30, originalPrice: "NT$ 328", price: "NT$ 229")]),
        DealItem(games: [
            Game(title: "", imageName: "TheLongDark", badge: "週末特價",
                 discount: 75, originalPrice: "NT$ 349", price: "NT$ 87")]),
        DealItem(games: [
            Game(title: "", imageName: "ARCRaiders", badge: "週末特價",
                 discount: 50, originalPrice: "NT$ 1,290", price: "NT$ 645")]),
        DealItem(games: [
            Game(title: "", imageName: "KULONIKU", badge: "今日特惠",
                 discount: 40, originalPrice: "NT$ 226", price: "NT$ 135"),
            Game(title: "", imageName: "DICEOMANCER", badge: "今日特惠",
                 discount: 30, originalPrice: "NT$ 268", price: "NT$ 187")]),
        DealItem(games: [
            Game(title: "", imageName: "TwoPoint", badge: "系列作特賣")])

    ]

    /// 個人行事曆
    static let calendar: [CalendarDay] = [
        CalendarDay(label: "今天", games: [
            Game(title: "", imageName: "BARFENDER"),
            Game(title: "", imageName: "怪奇餐廳")]),
        CalendarDay(label: "週二  10/13", games: [
            Game(title: "", imageName: "DoubleDealer"),
            Game(title: "", imageName: "DeepDishDungeon")]),
        CalendarDay(label: "週三  10/14", games: [
            Game(title: "", imageName: "TrashDay"),
            Game(title: "", imageName: "OverTheHill")]),
        CalendarDay(label: "週四  10/15", games: [
            Game(title: "", imageName: "ENSHROUDED"),
            Game(title: "", imageName: "終末地")]),
        CalendarDay(label: "週五  10/16", games: [
            Game(title: "", imageName: "繁星之海"),
            Game(title: "", imageName: "ChainedBeasts")]),
        CalendarDay(label: "週一  10/19", games: [
            Game(title: "", imageName: "LoopDungeon"),
            Game(title: "", imageName: "考古致富")]),
        CalendarDay(label: "週二  10/20", games: [
            Game(title: "", imageName: "WeWereHereTomorrow"),
            Game(title: "", imageName: "NomadDrive")]),
        CalendarDay(label: "週三  10/21", games: [
            Game(title: "", imageName: "PYRAMIDION"),
            Game(title: "", imageName: "DearBNB")]),
        CalendarDay(label: "週四  10/22", games: [
            Game(title: "", imageName: "Test1"),
            Game(title: "", imageName: "Test2")]),
        CalendarDay(label: "週五  10/23", games: [
            Game(title: "", imageName: "航海王"),
            Game(title: "", imageName: "莎拉的黑店")])
    ]

    /// 根據遊玩推薦
    static let recommended: [Game] = [
        Game(title: "", imageName: "PLANET_S", price: "免費"),
        Game(title: "", imageName: "幻獸帕魯",
             discount: 30, originalPrice: "NT$ 488", price: "NT$ 341"),
        Game(title: "", imageName: "Trove"),
        Game(title: "", imageName: "Overcooked2", price: "NT$ 675"),
        Game(title: "", imageName: "英勇之地", price: "免費")
    ]

    /// 因為曾玩過
    static let because: [Game] = [
        Game(title: "", imageName: "PERMAFROST",
             tags: [["開放世界生存工藝", "線上合作", "探索"], ["末日之後", "第三人稱視角", "動作冒險"]],
             discount: 20, originalPrice: "NT$ 549", price: "NT$ 439"),
        Game(title: "", imageName: "Valheim",
             tags: [["開放世界生存工藝", "線上合作"], ["基地建設", "探索", "冒險", "低容錯"]],
             price: "NT$ 648"),
        Game(title: "", imageName: "ZOMBOID",
             tags: [["開放世界生存工藝", "建造", "喪屍"], ["沙盒", "末日之後", "合作", "模擬"]],
             price: "NT$ 469"),
        Game(title: "", imageName: "RUST",
             tags: [["開放世界生存工藝", "建造", "玩家對戰"], ["沙盒", "冒險", "裸露", "動作"]],
             price: "NT$ 699"),
        Game(title: "", imageName: "DragonWilds",
             tags: [["開放世界生存工藝", "線上合作"], ["基地建設", "探索", "冒險", "角色扮演"]],
             price: "NT$ 648"),
        Game(title: "", imageName: "OnceHuman",
             tags: [["開放世界生存工藝", "線上合作", "多人"], ["基地建設", "冒險"]],
             price: "免費")
    ]

    /// 可愛標籤
    static let cute: [Game] = [
        Game(title: "", imageName: "BOMBANANA", discount: 40, originalPrice: "NT$ 175", price: "NT$ 105"),
        Game(title: "", imageName: "Museum", discount: 33, originalPrice: "NT$ 999",
             price: "NT$ 669"),
        Game(title: "", imageName: "美少女夢工廠", discount: 20, originalPrice: "NT$ 566", price: "NT$ 452"),
        Game(title: "", imageName: "SengokuRance", discount: 20, originalPrice: "NT$ 351", price: "NT$ 280")
    ]

    /// 運動遊戲標籤
    static let sports: [Game] = [
        Game(title: "", imageName: "REMATCH", discount: 60, originalPrice: "NT$ 650", price: "NT$ 260"),
        Game(title: "", imageName: "超級高爾夫大亂鬥", discount: 35, originalPrice: "NT$ 229", price: "NT$ 148"),
        Game(title: "", imageName: "PGATour", discount: 55, originalPrice: "NT$ 1,190", price: "NT$ 535"),
        Game(title: "", imageName: "TT", discount: 90, originalPrice: "NT$ 438", price: "NT$ 43")
    ]

    static let tabs = ["熱門新品", "暢銷遊戲", "熱門即將發行", "特惠", "話題"]

    /// 熱門新品
    static let newReleases: [Game] = [
        Game(title: "怪奇餐廳", imageName: "怪奇餐廳2", subtitle: "管理, 烹飪, 建造, 可愛",
             releaseDate: "發行於: 2026 年 10 月 12 日", discount: 35, originalPrice: "NT$ 458.00", price: "NT$ 297.00"),
        Game(title: "塔防山賊模擬器", imageName: "塔防山賊", subtitle: "放置, 塔防, 仙俠, 打寶",
             releaseDate: "發行於: 2026 年 10 月 12 日", discount: 10, originalPrice: "NT$ 286.00", price: "NT$ 257.00"),
        Game(title: "Genome Guardian 2", imageName: "GenomeGuardianII", subtitle: "槍械改造, 逆彈幕, 輕度 Rogue, 動作",
             releaseDate: "發行於: 2026 年 10 月 12 日", discount: 59, originalPrice: "NT$ 409.00", price: "NT$ 166.00"),
        Game(title: "PAPERHEAD", imageName: "PAPERHEAD", subtitle: "第一人稱射擊, 快節奏, 鮮血, 老式射擊",
             releaseDate: "發行於: 2026 年 10 月 10 日", discount: 20, originalPrice: "NT$ 328.00", price: "NT$ 262.00"),
        Game(title: "It Hears You: Together", imageName: "ItHearYou", subtitle: "模擬, 動作, 角色扮演, 動作冒險",
             releaseDate: "發行於: 2026 年 10 月 10 日", discount: 20, originalPrice: "NT$ 95.00", price: "NT$ 76.00"),
        Game(title: "Truckful / 鄉野奇運", imageName: "鄉野奇運", subtitle: "駕駛, 動作冒險, 懸疑, 動作",
             releaseDate: "發行於: 2026 年 10 月 9 日", discount: 10, originalPrice: "NT$ 377.00", price: "NT$ 339.00"),
        Game(title: "Do Disciplinary Comittee Member", imageName: "Test3", subtitle: "冒險, 色情內容, 角色扮演, 日系角色扮演",
             releaseDate: "發行於: 2026 年 10 月 9 日", discount: 20, originalPrice: "NT$ 308.00", price: "NT$ 246.00"),
        Game(title: "CELESTAY Craft&Slowlife", imageName: "CELESTAY", subtitle: "休閒, 放置, 2D, 工具",
             releaseDate: "發行於: 2026 年 10 月 9 日", discount: 20, originalPrice: "NT$ 198.00", price: "NT$ 158.00"),
        Game(title: "幻想放置遠征隊", imageName: "幻想放置遠征隊", subtitle: "桌面夥伴, 日系角色扮演, 像素風格, 放置",
             releaseDate: "發行於: 2026 年 10 月 9 日", discount: 20, originalPrice: "NT$ 178.00", price: "NT$ 142.00"),
        Game(title: "Silver Pines", imageName: "銀松鎮", subtitle: "探索, 恐怖, 類銀河戰士惡魔城, 假 3D",
             releaseDate: "發行於: 2026 年 10 月 9 日", discount: 36, originalPrice: "NT$ 708.00", price: "NT$ 456.00")


    ]

    /// 依類別瀏覽
    static let categories: [Game] = [
        Game(title: "", imageName: "科幻和電馭叛客"),
        Game(title: "", imageName: "日本動畫"),
        Game(title: "", imageName: "角色扮演"),
        Game(title: "", imageName: "解謎")
    ]

    /// 來自認識的開發者與發行商
    static let developers: [Developer] = [
        Developer(name: "Fireshine Games", logoName: "FireShine",
                  game: Game(title: "", imageName: "ODINFALL", price: "NT$ 238")),
        Developer(name: "Team17 Digital", logoName: "Team17",
                  game: Game(title: "", imageName: "RitualRaven",
                             discount: 60, originalPrice: "NT$ 330", price: "NT$ 132")),
        Developer(name: "Klei", logoName: "Klei",
                  game: Game(title: "", imageName: "NecroDancer", price: "NT$ 328")),
        Developer(name: "Coffee Stain Studios", logoName: "Coffee",
                  game: Game(title: "", imageName: "Goat", price: "NT$ 288"))
    ]

    /// 社群推薦
    static let communityReviews: [CommunityReview] = [
        CommunityReview(
            game: Game(title: "Silver Pines", imageName: "銀松鎮",
                       discount: 10, originalPrice: "NT$ 519", price: "NT$ 467"),
            text: "很不错的类生化危机游戏，可以打8.5分，主要是剧情不是很合口味，美式超自然双峰、心灵杀手那种剧情，整体还是很推荐的 一周目大约13小时，全收集大约15小时，有解锁要素，可以开新档玩二周目 全价买不亏，打折买...",
            reviewerName: "摸魚", playHours: 15.7, helpfulCount: 2),
        CommunityReview(
            game: Game(title: "王國保衛戰 6：重啟", imageName: "Kingdom6",
                       price: "NT$ 377"),
            text: "\" 8/10 \" 画风/养成★★★★☆ -实际上单从画风来讲我倒是没有抗拒这一作的画风，只不过在宣传图上看到的时候确实感觉颜色过于鲜艳没有以前那种美术味，但实际上手玩了之后也感觉其实没啥问题，不过这个养成玩法的…",
            reviewerName: "佐仓双叶", playHours: 6.2, helpfulCount: 2),

        CommunityReview(
            game: Game(title: "Forever Ago", imageName: "ForeverAgo",
                       discount: 10, originalPrice: "NT$ 349", price: "NT$ 314"),
            text: "爱的影子，第三幕 父母、配偶、孩子，人类最基础的三种社会关系；父母之爱、夫妻之爱、子女之爱，也是“爱”最原始的三种形态。可是个体的生命是有限的——我们对抗不了基因自然的突变，也对抗不了世事难料的波涛—…",
            reviewerName: "The Grumpy Weasel", playHours: 4.2, helpfulCount: 18),

        CommunityReview(
            game: Game(title: "木木屋 - Woodo", imageName: "Woodo",
                       price: "NT$ 399"),
            text: "最喜欢最后一章，夏夜蝉鸣，又静静的，即将离别的氛围，我一下就沉浸了！玩的时候脑海里会出现坐在大门口和我一起嚼馒头喂猫的外婆，说我是幸运星的外公，站在路口等我放学路过拦截我去他家吃烤玉米和火烧的二爷…",
            reviewerName: "一罐卜卜脆", playHours: 6.2, helpfulCount: 8)
    ]

    /// 低於 NT$ 300
    static let under300: [Game] = [
        Game(title: "", imageName: "塔防山賊", discount: 10, originalPrice: "NT$ 286", price: "NT$ 257"),
        Game(title: "", imageName: "魔骰遊戲", discount: 25, originalPrice: "NT$ 249", price: "NT$ 186"),
        Game(title: "", imageName: "Test3", discount: 20, originalPrice: "NT$ 308.00", price: "NT$ 246.00"),
        Game(title: "", imageName: "BigWalk", discount: 20, originalPrice: "NT$ 369.00", price: "NT$ 295.00")
    ]
}

#Preview("Dark") {
    ContentView().preferredColorScheme(.dark)
}
