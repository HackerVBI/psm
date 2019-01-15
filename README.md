# psm
Professional Sound Maker

A little help from creator, Voluntar D: (in russian)

Клавиши управления скроллером:  вверх - Q,9,Up   вниз  - A,8,Dоwn
Выход - 0,Enter

Pro SOUND MAKER™   Demo version    © 1995  Team V     only 128K                      

Расчитано  на тех, кто имеет опыт работы с ASMом или с SOUND  TRACKERом  или  с другим подобным редактором.

Главные отличия: 
возможность изменения  громкости; 
автоматический ввод делителя огибающей;независимая установка  длины PATTERNа и DELAY; 
визуально-слуховой полноэкранный редактор звуков;независимый автоповтор у sample и or-
nament;полутоновый анализатор частот;
улучшенный сканер клавиатуры (AFTER-CAPS); 
отсутствие зоны исчезновения у стрелки;
эффект  Slude  у  sample (ASM);
абсолютный орнамент (ST);
разная  длина звуков (максимум-32), работа с блоками: 
копирование,удаление,  модуляция;  плавное изменение громкости  при автоповторе.
Время создания  музыки  значительно меньше чем в ST,а тем более в ASM. 
При создании редактора учитывался  мой  личный опыт работы с такими  известными  редакторами, как  SOUND TRACKER и ASM.
Кстати,здесь есть пять моих музонов (клавиши от 1 до 5;гасить -Sp)

Help       
В начале  Вы  увидите главное меню, которое  частично  напоминает  меню SOUND TRACKERа.Управление  в  нем  осуществляется при помощи указателя: 
 Q- Движение вверх  
A- -//-//-  вниз  
O- -//-//-  влево 
P- -//-//-  вправо
Space- Активизациявыбранной опции

Надписи делятся на 2 типа: 
1-Пустые (не выде- ляются и вообще  никак не  реагируют) 
2-Действующие (ин- вертируются) 
Действующие,в свою очередь,делятся на 3 типа:           
1-Опции (переход в другую менюшку и т.д. и т.п.)    
2-Переключатели   
3-Перемотки  (при  удержании Space  способны перема- тываться):        
Q-Вперед         A-Назад 

POSITION -Опция.  
Внизу экрана по- является таблица,состоящая из ста позиций.         00+00
Модуляция  
Знак  модуляции      
Раttеrn                     

Текущая  позиция отмечена.  И  Pattern, и модуляция  отдельно перематываются, но  кроме  того,можно удалить или вставить позицию  при   помощи клавиш  "O" и  "P" соответственно.
PATTERN -Нереализованная в демо  опция                             
MODULATE -модуляция (в ST-HEIGH)                  
PATTERN LEN –длина текущего PATTERNа                 
DEL -темп текущегоPATTERNа                          
LINE -строка текущего PATTERNа                     
OCT     -Перемотка указателя те кущей октавы                            
MOD.OCT –Перемотка указателя  дополнительной  октавы                 
В правом  верхнем  углу находится переключатель:      
COMPOSE-Все произведение.         
PATTERN-Часть произведения.                        
PLAY COMPOSE \    
PLAY PATTERN -Вос-произведение.

Клавиши:

Up (СS+7)  - Перемотка назад
Down (СS+6) - Перемотка вперед    
Break (СS+Space) - выход из воспроизведения
I,O,P- Вкл/откл   A,B,C каналов    соответственно                   
EDIT COMPOSE \    

EDIT PATTERN - Ре-дактирование  музыки.
Клавиши:
I,O,P- Вкл/откл   A,B,C каналов    соответственно  Up -Движение на-  зад             Dоwn - Движение   вперед          Left (СS+5) -Движение курсора    влево           Right (СS+8)-Движение курсора    вправо          Break -Выход в    главное меню    Enter -Воспроиз ведение  музыки  до тех пор, пока  нажата клавиша  Space -Отметка  блока.
Блок должен находиться   на одном канале  и  в  пределах   PATTERNа
Q -Переход в начало PATTERNа   
W -Переход в конец PATTERNа
U -Удалить отмеченный блок
Y -Скопировать    блок в место,    начиная от курсора. Что зашло  за предел РАТТЕRNа -теряется T -Весь отмеченный блок повышается на полутон CS+T -понижается  на полутон      K -Убрать от метку Ext(CS+SS)-переключить MODE     
SS+1..8 -переключить октаву     CS+1..4 -переключить   дополни тельную октаву

Поле редактирования делится  на 3канала ( A,B и C)Каждый канал  делится  на  нотную часть  и на  спецчасть.
Нотная часть:    A-5              ||-Октава       |--Диез (#)     ---Нота                          --- Пусто  (продолжение)
R-- Отключение       звука
Спец  часть сос тоит из 5-ти чи сел,представленных в HEX виде.
                   F1A3D                             1-й -громкость    звука (1-F).     0 -предыдущая       громкость                     2-й -Sample(1-F)  0 -предыдущий       sample                        3-й -Тип звучания (1-F):      
0  -предыдущий       тип          1-7-простой звук 8-E-звук с оги бающей
F  -звук с орнаментом                        
4-5-й -Делитель    огибающей или    номер орнамента

В  нотной  части действуют следую-щие клавиши:                      
1-8 -Переключение   текущей октавы                 
Z -C  -До       
 S -C# -До диез  
 X -D  -Ре        
D -D# -Ре диез  
 C -E  -Ми        
V -F  -Фа        
G -F# -Фа диез   
B -G  -Соль      
H -G# -Соль діез
 N -A  -Ля        
J -A# -Ля диез   
M -B  -Си                         
L -Стереть ноту                   
R -Поставить отключение звука                  

В спец части действуют следующие клавиши:
0-9 \                 Ввод числа  A-F /  (0-F)                      
Далее описание главного меню:                     
A- "-" означает,  
B+ что канал вык лючен,"+"-включен                             
MODE -Режим редак- тирования      
NRM -нормальный  EXT -дополнительный :  автоматический ввод спец части  при вводе ноты  ( ставится делитель  огибающей  или  орнамент ,тип, громкость и  sample; делитель  огибающей  ставится с учетом  дополнительной  октавы)                 
ABOUT -информация об авторах                        
DISK OPTIONS -не реализованная в  демо опция                        
PSM COMPILER -не реализованная в  демо опция                        
EDIT SOUND – очен ьобширная  опция - редактор  звуков.                 
В  правой  части находятся различные надписи.     

Самая  верхняя:     A-5 F1F00     -строка редактора (задейсвована на канал C)

Три строки пониже - перемотки , и  имеют то-же значение, что  и  в главном меню
OCTAVE  -        MOD.OCT -        MODE  ---     
Четыре  следующихнадписи  означаюткакой  в  данный момент  орнамент,sаmрlе, громкостьи форма огибающей
PLAY -переключатель режима воспроизведения текущего звука .   
Клавиша   "I"    перезапускает    звук. Если режим выключен  (OFF), то  звук прекращается  при  отпускании  клавиши. Если  режим  включен (ON), то звук  становится постоянным и все изменения  будут сразу услышаны.

REPEAT         DEL:4 VL:+1    -изменение  громкости   звука  на величину VL через каждые DEL циклов автоповтора

Следующие надписи являются сервисными опциями. 
CLEAR -стереть          текущий:    SAMPL ORNAM                     
CLIPBOARD -работа       с буффером                   
SMP-GET-ORN    положить в буффер                   
SMP-PUT-ORN    взять из буффера                  

На все действия, которые ведут к  утере информации задается вопрос:    SURE  Y/N      увераны да/нет                   
 Если вы еще не   запарились ЭТО    читать, то я      продолжу:
В редакторе звуков задействованы еще две клави-ши (Fires):      
N -означает  стереть  шкалу  или обнулить число   
M -в области шкал - резиновая  линия,которая   позволяет по алгоритму прямой быстро заполнить  шкалу. 
 Первое  нажатие  определяет  начало  линии.
Движение  второго кон-ца -QAOP. "M"-заполнить,"N"-не   заполнять.       
В области чисел -редактор чисел.  Курсор передвигается  при помощи клавиш   курсора,либо   клавиши   "QAOP".              
Увеличение:   W -на много      E -на 1             
Уменьшание:   S -на много      D -на 1            (Как в ST)     
Y -позволяет      рамножать число

Все вышауказанные клавиши   можно  комбинировать с  клавишами "Q"и"A"                  
0..9-непосредственный ввод      цифры

Левая шкала -  шумов.
Слева от нее столбец смесителей (полный -есть шум,пустой -нет)             
Правее находится шкала  громкости.Слева  - столбец смесителей (полный-есть звук, пустой-нет)            
Еще правее  находится столбец чисел - относительное изменение делителей  частоты.
Справа от  него -вертикальная шкала  автоповтора  звука. Одиночная линия-не повторяется, двойная -  действует как автоповтор (возможно   изменение   громкости). 
Шкала захватывается при помощи клавиш:   
M -начало автоповтора       
Space -конец автоповтора (и     звука целиком)
Удерживая  одну  или обе этих клавиши , "Q" и "A" двигают то,что вы захватили вверх  или вниз соответственно.

Правее находится столбец чисел -  абсолютное изменение   частоты  звука  в   полутонах (орнамент).Справа от него - шкала автоповтораорнамента, действующая аналогичноавтоповторнику   звука.                            
В любой момент вы можете нажать клавишу "Break"-выход в главное меню.                    


P.S.              Для первого раза это не совсем понятно. Лучше запускайте и проверяйте все сами.                   
Demo,музыка,графика,главные коды,  текст, эффекты:
Дратов Денис                      

Оптимизация,   моральная помощь:                   
Дратов Влад     Демченко А.Н.                     

г.Нижневартовск       Team             \\//          09.07.1995                     
