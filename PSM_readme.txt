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