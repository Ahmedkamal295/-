//
//  ViewController.swift
//  searchBook
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import Foundation

struct dictModel {
    let title: String
    let index: Int
}

class srarchData {
    static var pageIndex: Int {
        get {
            return UserDefaults.standard.value(forKey: "pageIndex") as? Int ?? 1
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "pageIndex")
        }
    }

    static let dict: [dictModel] = [dictModel(title: "تقديم", index: 3),
                                    dictModel(title: "تمهید", index: 5),
                                    dictModel(title: "تعريف البحث لغة", index: 6),
                                    dictModel(title: "تعريف البحث العلمي اصطلاحا", index: 7),
                                    dictModel(title: "أهمية البحث العلمي وفوائده", index: 8),
                                    dictModel(title: "خصائص البحث الجيد", index: 9),
                                    dictModel(title: "سمات الباحث", index: 14),
                                    dictModel(title: "القسم الأول: خطوات البحث", index: 18),
                                    dictModel(title: "اختيار الموضوع وتحديده", index: 20),
                                    dictModel(title: "مصادر اختيار الموضوع", index: 20),
                                    dictModel(title: "العوامل المؤثرة في اختيار الموضوع", index: 20),
                                    dictModel(title: "تغيير الموضوع", index: 23),
                                    dictModel(title: "تحديد الموضوع", index: 24),
                                    dictModel(title: "التحديد بالمنهج العلمي", index: 24),
                                    dictModel(title: "التحديد بالأهداف", index: 26),
                                    dictModel(title: "التحديد بالتساؤلات", index: 27), //
                                    dictModel(title: "التحديد بالفروض", index: 28),
                                    dictModel(title: "التحديد بجزء من الموضوع", index: 28),
                                    dictModel(title: "التحديد بالزمان", index: 29),
                                    dictModel(title: "التحديد بالمكان", index: 29),
                                    dictModel(title: "التحديد بمجتمع البحث", index: 29),
                                    dictModel(title: "صياغة عنوان البحث", index: 30),
                                    dictModel(title: "بناء مخطط البحث", index: 31),
                                    dictModel(title: "عناصر مخطط البحث", index: 32),
                                    dictModel(title: "مراحل مخطط البحث", index: 33), //
                                    dictModel(title: "جمع المعلومات", index: 35),
                                    dictModel(title: "مصادر المعلومات", index: 35),
                                    dictModel(title: "طرق الحصول على المصادر", index: 37), //
                                    dictModel(title: "طرق تدوين المعلومات", index: 38),
                                    dictModel(title: "أنواع المعلومات وقيمتها العلمية", index: 40),
                                    dictModel(title: "البحث عن المعلومات في الشبكة العالمية", index: 43), //
                                    dictModel(title: "تنظيم المعلومات", index: 47),
                                    dictModel(title: "تصنيف المعلومات حسب (مخطط البحث)", index: 47),
                                    dictModel(title: "ترتيب المعلومات لكل مبحث أو مسألة", index: 47),
                                    dictModel(title: "مراجعة خطة البحث", index: 49),
                                    dictModel(title: "كتابة البحث", index: 50),
                                    dictModel(title: "نقل النصوص وعرض الأفكار ومناقشتها", index: 51),
                                    dictModel(title: "الحاشية وتوثيق النصوص والمعلومات", index: 53), //
                                    dictModel(title: "التعبير والإملاء والإخراج الفني", index: 55),
                                    dictModel(title: "الفهارس", index: 55),
                                    dictModel(title: "ترتیب محتويات البحث وترقيم صفحاته", index: 57),
                                    dictModel(title: "مراجعة البحث", index: 59),
                                    dictModel(title: "مجالات البحث في موضوعات علوم اللغة العربية،ومصادرها", index: 60),
                                    dictModel(title: "ألفاظ اللغة", index: 62),
                                    dictModel(title: "فقه اللغة", index: 66),
                                    dictModel(title: "الصرف", index: 69), //
                                    dictModel(title: "النحو", index: 71),
                                    dictModel(title: "البلاغة", index: 74),
                                    dictModel(title: "الأدب", index: 79),
                                    dictModel(title: "النقد الأدبي", index: 82),
                                    dictModel(title: "تراجم علماء العربية", index: 84),
                                    dictModel(title: "مصادر أخرى لموضوعات علوم العربية", index: 86),
                                    dictModel(title: "کتب القراءات، والاحتجاج لها", index: 86),
                                    dictModel(title: "كتب التجويد", index: 87),
                                    dictModel(title: "كتب التفسير", index: 88),
                                    dictModel(title: "كتب معاني القرآن", index: 89),
                                    dictModel(title: "كتب غريب القرآن", index: 90),
                                    dictModel(title: "كتب إعراب القرآن", index: 91),
                                    dictModel(title: "كتب المتشابه اللفظي في القرآن", index: 92),
                                    dictModel(title: "كتب الإعجاز القرآني", index: 93),
                                    dictModel(title: "کتب علوم القرآن", index: 94),
                                    dictModel(title: "کتب غريب الحديث", index: 94),
                                    dictModel(title: "كتب إعراب الحديث", index: 95),
                                    dictModel(title: "كتب شروح الحديث", index: 95),
                                    dictModel(title: "كتب أصول الفقه", index: 96),
                                    dictModel(title: "كتب الأمالي والمجالس", index: 98),
                                    dictModel(title: "خاتمة", index: 99),
                                    dictModel(title: "ثبت المراجع", index: 100)]
}
