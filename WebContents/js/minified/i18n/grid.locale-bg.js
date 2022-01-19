!function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","../grid.base"],e):e(jQuery)}(function(e){e.jgrid=e.jgrid||{},e.jgrid.hasOwnProperty("regional")||(e.jgrid.regional=[]),e.jgrid.regional.bg={defaults:{recordtext:"{0} - {1} от {2}",emptyrecords:"Няма запис(и)",loadtext:"Зареждам...",savetext:"Записвам...",pgtext:"Стр. {0} от {1}",pgfirst:"Първа Стр.",pglast:"Последна Стр.",pgnext:"Следваща Стр.",pgprev:"Предишна Стр.",pgrecs:"Брой записи на Стр.",showhide:"Свиване/Разтягане на таблицата",pagerCaption:"Таблица::Настр. Страница",pageText:"Страница:",recordPage:"Записи на стр.",nomorerecs:"Няма повече записи...",scrollPullup:"Издърпайте нагоре за повече...",scrollPulldown:"Дръпнете надолу за опресняване...",scrollRefresh:"Освободете за да опресните..."},search:{caption:"Търсене...",Find:"Намери",Reset:"Изчисти",odata:[{oper:"eq",text:"равно"},{oper:"ne",text:"различно"},{oper:"lt",text:"по-малко"},{oper:"le",text:"по-малко или="},{oper:"gt",text:"по-голямо"},{oper:"ge",text:"по-голямо или ="},{oper:"bw",text:"започва с"},{oper:"bn",text:"не започва с"},{oper:"in",text:"се намира в"},{oper:"ni",text:"не се намира в"},{oper:"ew",text:"завършва с"},{oper:"en",text:"не завършава с"},{oper:"cn",text:"съдържа"},{oper:"nc",text:"не съдържа"},{oper:"nu",text:"е NULL"},{oper:"nn",text:"не е NULL"},{oper:"bt",text:"между"}],groupOps:[{op:"AND",text:"&nbsp;И "},{op:"OR",text:"ИЛИ"}],operandTitle:"Натисни за избор на операнд.",resetTitle:"Изчисти стойността",addsubgrup:"Добави група",addrule:"Добави правило",delgroup:"Изтрий група",delrule:"Изтрий правило"},edit:{addCaption:"Нов Запис",editCaption:"Редакция Запис",bSubmit:"Запиши",bCancel:"Изход",bClose:"Затвори",saveData:"Данните са променени! Да съхраня ли промените?",bYes:"Да",bNo:"Не",bExit:"Отказ",msg:{required:"Полето е задължително",number:"Въведете валидно число!",minValue:"стойността трябва да е по-голяма или равна от",maxValue:"стойността трябва да е по-малка или равна от",email:"не е валиден ел. адрес",integer:"Въведете валидно цяло число",date:"Въведете валидна дата",url:"e невалиден URL. Изискава се префикс('http://' или 'https://')",nodefined:" е недефинирана!",novalue:" изисква връщане на стойност!",customarray:"Потреб. Функция трябва да върне масив!",customfcheck:"Потребителска функция е задължителна при този тип елемент!"}},view:{caption:"Преглед запис",bClose:"Затвори"},del:{caption:"Изтриване",msg:"Да изтрия ли избраният запис?",bSubmit:"Изтрий",bCancel:"Отказ"},nav:{edittext:" ",edittitle:"Редакция избран запис",addtext:" ",addtitle:"Добавяне нов запис",deltext:" ",deltitle:"Изтриване избран запис",searchtext:" ",searchtitle:"Търсене запис(и)",refreshtext:"",refreshtitle:"Обнови таблица",alertcap:"Предупреждение",alerttext:"Моля, изберете запис",viewtext:"",viewtitle:"Преглед избран запис",savetext:"",savetitle:"Съхрани запис",canceltext:"",canceltitle:"Отказ редакция",selectcaption:"Действия..."},col:{caption:"Избери колони",bSubmit:"Ок",bCancel:"Изход"},errors:{errcap:"Грешка",nourl:"Няма посочен url адрес",norecords:"Няма запис за обработка",model:"Модела не съответства на имената!"},formatter:{integer:{thousandsSeparator:" ",defaultValue:"0"},number:{decimalSeparator:".",thousandsSeparator:" ",decimalPlaces:2,defaultValue:"0.00"},currency:{decimalSeparator:".",thousandsSeparator:" ",decimalPlaces:2,prefix:"",suffix:" лв.",defaultValue:"0.00"},date:{dayNames:["Нед","Пон","Вт","Ср","Чет","Пет","Съб","Неделя","Понеделник","Вторник","Сряда","Четвъртък","Петък","Събота"],monthNames:["Яну","Фев","Мар","Апр","Май","Юни","Юли","Авг","Сеп","Окт","Нов","Дек","Януари","Февруари","Март","Април","Май","Юни","Юли","Август","Септември","Октомври","Ноември","Декември"],AmPm:["","","",""],S:function(e){return 7==e||8==e||27==e||28==e?"ми":["ви","ри","ти"][Math.min((e-1)%10,2)]},srcformat:"Y-m-d",newformat:"d/m/Y",parseRe:/[#%\\\/:_;.,\t\s-]/,masks:{ISO8601Long:"Y-m-d H:i:s",ISO8601Short:"Y-m-d",ShortDate:"n/j/Y",LongDate:"l, F d, Y",FullDateTime:"l, F d, Y g:i:s A",MonthDay:"F d",ShortTime:"g:i A",LongTime:"g:i:s A",SortableDateTime:"Y-m-d\\TH:i:s",UniversalSortableDateTime:"Y-m-d H:i:sO",YearMonth:"F, Y"},reformatAfterEdit:!1,userLocalTime:!1},baseLinkUrl:"",showAction:"",target:"",checkbox:{disabled:!0},idName:"id"},colmenu:{sortasc:"Сортирай възходящо",sortdesc:"Сортирай низходящо",columns:"Колони",filter:"Филтрирай",grouping:"Групирай по",ungrouping:"Разгрупиране",searchTitle:"Търси данни със стойност, която",freeze:"Неподвижна",unfreeze:"Отмяна неподвижност",reorder:"Премести за пренареждане"}}});