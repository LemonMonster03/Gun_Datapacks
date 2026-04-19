# 装弹中 → 显示装弹进度
execute if score @s reloading matches 1.. run title @s actionbar {text:"装弹中 ",color:"yellow",extra:[{text:"■■■■■",color:"gold",obfuscated:true}]}
execute if score @s reloading matches 1.. run return 0

# 正常状态 → 显示弹药数量
title @s actionbar {text:"弹药: ",color:"white",extra:[{score:{name:"@s",objective:"ammo"},color:"green"}]}

# 不再持枪时移除显示标签
execute if entity @s[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run tag @s remove gun_display_ammo
execute if entity @s[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run title @s actionbar {text:""}
