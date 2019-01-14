rasm compiler.za -o comp -sw -sa
rasm player.za -o play -sw
rasm ed4.za -o ed4 -s -sl
rasmlabel ed4.sym ed4.l

trdtool # psm.trd
trdtool + psm.trd boot.$B boot2.$B
trdtool + psm.trd ed4.bin comp.bin play.bin mi.PSM
trdtool + psm.trd m20.$C m16.$C m11.$C m33.$C msx1.$C msx2.$C msx2c.$C msx3.$C ms1.$C ms11.$C

trdetz psm.trd ren ed4.bin ed4.C
trdetz psm.trd fprop ed4.C start 25000

trdetz psm.trd ren comp.bin comp.C
trdetz psm.trd fprop comp.C start 28000

trdetz psm.trd ren play.bin play.C
trdetz psm.trd fprop play.C start 30000

trdetz psm.trd ren mi.psm mi.C
trdetz psm.trd fprop mi.C start 49152

