# psm
Professional Sound Maker

A little help from creator, Voluntar D: (in russian)


Pro SOUND MAKER Documentation v1.1
Author: Dratov Denis aka Dexus (c) 1994-2019

*** PSM_TRACK_KEYS (EDITABKEYS@ED4):

menu:
q,a,o,p = arrow moving
space = main arrow action
  menu (top part): hitting on "numbers" + q/a = increment/decrement (with acceleration)
  positions editor: q/a= increment/decrement value, o/p = delete position/insert cloned position
m = secondary action
  positions editor: change loop beginning (second hit = no loop), NOTE: loop is only for compiled music

track:
cs + ss = ext mode change
1-8 = octave change(note column)
ss + 1-8 = octave change
cs + 1-4 = ext octave change
cs + 5-8 = cursor move
q = go to pattern beginning
ss + q = delete & move up
w = go to pattern ending
ss + w = insert blank & move down
r = R (reset)
t = transpose selected (+1 semitone)
ss + t = transpose selected (-1 semitone)
y = copy selected to current line
u = erase selected
i,o,p = A,B,C channel on/off
s = C# (note column)
ss + s = swap selected with current line (must be diffent channels if same pattern)
d = D# (note column)
g = F# (note column)
h = G# (note column)
j = A# (note column)
enter = play
k = clear selection (deselect)
l = clear note (note column)
z = C (note column)
x = D (note column)
c = E (note column)
v = F (note column)
b = G (note column)
n = A (note column)
m = B (note column)
space = select
1-9, a-f = hexadecimal number (number column)
cs+space = leave edit mode (also leave positions editor)

*** PSM_SNDEDIT_KEYS:

common keys:
n = clear sample/ornament numbers, mixer, graph (wherever cursor/arrow are)
i = restart sound
cs+space = leave sample editor (if not number/test editor)

arrow keys:
q,a,o,p = arrow moving
space = main arrow action
  menu (right part): hitting on "numbers" + q/a = increment/decrement (with acceleration)
  sound editor:
    hitting on "graphs" = change value
    hitting on "numbers" + q/a = increment/decrement, + o/p= great decrement/increment
    hitting on "example" = example editor
    hitting on "repeating lane" + q/a = changing sample/ornament length
m = secondary action
  sound editor:
    hitting on "graphs" = line drawing; space/m = end of line; n = cancel
    hitting on "numbers" = number editing (enter=leave number editor)
    hitting on "example" = example editor
    hitting on "repeating lane" + q/a = moving loop start up/down

numbers editor:
q, a, o, p, left, right, up, down = move cursor
w,s = increment/decrement value
e,d = increment/decrement value greatly
m = change value sign
ss + q = delete "line" (sample or ornament)
ss + w = insert cloned "line" (sample or ornament)
enter, cs+space = leave number editor

test line editor works the same way as "track" editor.
with these exceptions:
enter, cs+space = leave test line
l, r = doesn't work
can't set zero volume, sample, env/ornament mode
also "block/selection" keys don't work


*** PSM_KEYCODES (KEY_TAB@BIOS, KEY_TABC@BIOS, KEY_TABS@BIOS):
cs+3    =#04 (4) ( true vid )
cs+4    =#05 (5) ( inv vid )
cs+2    =#06 (6) ( caps lock )
cs+1    =#07 (7) ( edit )
cs+5    =#08 (8) ( left )
cs+8    =#09 (9) ( right )
cs+7    =#0a(10) ( up )
cs+6    =#0b(11) ( down )
cs+0    =#0c(12) ( backspace )
enter   =#0d(13)
cs+ss   =#0e(14) ( ext )
cs+0    =#0f(15) ( graphics mode )
cs+enter=#10(16)
ss+enter=#11(17)
cs+space=#12(18) ( break )
ss+space=#13(19)
ss+q    =#14(20) ( <= )
ss+w    =#15(21) ( <> )
ss+e    =#16(22) ( >= )
ss+y    =#5b(91) ( [ )
ss+u    =#5d(93) ( ] )
ss+i    =#7f(127)( (c) )
ss+a    =#7e(126)( ~ )
ss+s    =#7c(124)( | )
ss+d    =#5c(92) ( \ )
ss+f    =#7b(123)( { )
ss+g    =#7d(125)( } )
Other keys = Usual ZX.

NOTE:
This keyscanner is using anti "shift lag" algorithm. On many ZX keyboards
there is no "pre-shift" action, so default keyscanner often returns
"5", "6" ,"7" ,"8" instead of cursor movement codes. It's because
"shift" code can be scanned after the key, not before. This keyscan
procedure has "make sure" scheme, that avoids results of "fast-key"
changing (including shifts). The only disadvantage - is 1/50 sec lag
that 100% unnoticeable.


*** PSM_RAW format:

base_addr=#B400 (raw song data start)
pattern_addr=#C000 (patterns data, on two pages (128K): 0 and 1)

Position Table (base_addr) Len: 2*100=200:

   [7 6 5 4 3 2 1 0] [7 6 5 4 3 2 1 0] * 100
   \~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~/
    \             /   \             /
     \-----------/     \-----------/-- Pattern number
      \------------------------------- Modulation


Pattern Table (base_addr+200) Len: 2*32=64:

   [7 6 5 4 3 2 1 0] [7 6 5 4 3 2 1 0] * 32
   \~~~~~~~~~~~~~~~/ \~~~~~~~~~~~~~~~/
    \             /   \             /
     \-----------/     \-----------/-- Pattern speed
      \------------------------------- Pattern length


Sample format (base_addr+264) Len: 98*15=1470:

   [7][6 5][4 3 2 1 0] [7 6 5][4 3 2 1 0]
   \~/\~~~/\~~~~~~~~~/ \~~~~~/\~~~~~~~~~/
    |  \ /  \       /   \   /  \       /
    |   \    \-----/     \-/    \-----/-- Repeat Start
    |    \    \           \-------------- Repeat Shift Delay
    |     \    \------------------------- Sample Length
    \      \----------------------------- Volume Shift
     \----------------------------------- Volume Shift Sign

   [7][x x][4][3 2 1 0] [7 6 5 4 3][2][1 0] [7 6 5 4 3 2 1 0] * 32
   \~/~~~~~\~/\~~~~~~~/ \~~~~~~~~~/\~/\~~~~ ~~~~~~~~~~~~~~~~/
    |       |  \     /   \       /  |  \                   /
    |       |   \---/     \-----/   \   \-----------------/-- Devidor Shift
    |       |    \         \         \----------------------- Devidor Shift Sign
    |       |     \         \-------------------------------- Noise Devidor
    |       \      \----------------------------------------- Volume
    \        \----------------------------------------------- Tone Absence (Mix) 0=tone 1=no tone
     \------------------------------------------------------- Noise Absence (Mix) 0=noise 1=no noise

Ornament format (base_addr+1734) Len: 34*32=1088:

   [x x x][4 3 2 1 0] [7][x x][4 3 2 1 0]
   ~~~~~~~\~~~~~~~~~/ \~/~~~~~\~~~~~~~~~/
           \       /   |       \       /
            \-----/    \        \-----/-- Repeat Start
             \          \---------------- Repeat Exist 
              \-------------------------- Ornament Length

   [7 6 5 4 3 2 1 0] * 32
   \~~~~~~~~~~~~~~~/
    \             /
     \-----------/-- Semitone Shift

Remark text (base_addr+2822) Len: 1*128=128

Position loop (base_addr+2950):

   [7 6 5 4 3 2 1 0]
   \~~~~~~~~~~~~~~~/
    \             /
     \-----------/-- Position number after Song end (#FF = No loop)

Pattern (pattern_addr) Len: (4*3)*64=768

   [7][6 5 4][3][2 1 0] [x x x x][3 2 1 0] [7 6 5 4][3 2 1 0] [7 6 5 4 3 2 1 0] * 3 (A B C) * 64
   \~/\~~~~~/\~/\~~~~~/ ~~~~~~~~~\~~~~~~~/ \~~~~~~~/\~~~~~~~/ \~~~~~~~~~~~~~~~/
    |  \   /  |  \   /            \     /   \     /  \     /   \             /
    |   \-/   |   \-/              \---/     \---/    \---/     \-----------/-- Envelope Devisor/Ornament
    |    \    |    \                \         \        \                         Env:#00-#F0=#00-#F0 (short)
    |     \   |     \                \         \        \                            #F1-#FF=#0100-#0F00 (long)
    |      \  |      \                \         \        \--------------------- 0=None 1-7=No Ornament/Envelope
    |       \ \       \                \         \                                8-E=Envelope Type F=Ornament
    |        \ \       \                \         \---------------------------- Sample Number
    |         \ \       \                \------------------------------------- Volume
    |          \ \       \----------------------------------------------------- Octave 
    |           \ \------------------------------------------------------------ # (Diez)
    \            \------------------------------------------------------------- Note (1-7=A-G)
     \------------------------------------------------------------------------- R (Reset)


*** PSM_COMP format:
Compiled PSM module.

   /======0 = Position Addr
   |/=====2 = Samples Table Addr
   ||/====4 = Ornaments Table Addr
   |||/===6 = Patterns Table Addr
   ||||   8 = Remark [0-128].."psm1\n"+custom
   \=====>Positions (0=pattern 1=modulation) #FF = Loop; Position (#FF = Stop)
    \====>Samples Table (0&1 = sample addr)
     ||   Samples Data ..
     \===>Ornaments Table (0&1 = ornament addr)
      |   Ornaments Data ..
      \==>Patterns Table (0=delay 1&2=A 3&4=B 5&6=C)
          Patterns Data ..

Pattern Data "language":

#00-#5F	= NOTE (0-95) (Shift, #00=same note, #01=semitone lower, #5f=semitone higher) First_Note=#30+modulation
#60	= R (Reset)
#61-#6F	= Change Sample (1-15)
#70-#8F	= Change Ornament (0-31)
#90	= No note (To prolongate pause, or set different parameter on the fly, without sample stopping)
#91-#9F	= Change Volume (1-15)
#A0	= No Ornament
#A1-#B0	= Spec Mode*
#B1-#B7	= Env Type (8-14) (1=Devisor)
#B8-#F8	= Pause (0-63)
#F9	= Gosub (Use previous fragment) (1&2=address; 3=len) //(+)Not implemented
#FA	= Envelope Init OFF
#FB	= Envelope Init ON
#FC	= Change Delay (1=Delay)	//(+)Not implemented
#FF	= End of track

* Spec Mode table (make possible modulation of enveloped sounds - envelope
devisor must agree with appropriate note devisor (any of 4 upper octaves) ):

\  8  A  C  E  <==< Envelope Type
 \===========
1|A1 A2 A3 A4
2|A5 A6 A7 A8
3|A9 AA AB AC
4|AD AE AF B0
^
|
\=================< Devisor Octave Shift


*** PL_VARS (for player)
IX+
   0 = delay counter
   1 = delay
   2 = current address
   3 /
   4 = current note (7bit=no note)
   5 = current sample
   6 = sample tick (7bit=ended)
   7 = current ornament
   8 = ornament tick (5bit=ended; 6bit=env; 7bit=no ornament)
   9 = volume counter
  10 = current volume
  11 = tone shift
  12 /
  13 = loop delay counter
  14 = current env type
  15 = current env devisor

  16 = return counter
  17 = return address
  18 /
  
  ABOUT EDITOR:

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

