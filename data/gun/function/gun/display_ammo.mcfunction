# 装弹中 → 显示装弹进度
execute if score @s reloading matches 1.. run title @s actionbar {text:"装弹中 ",color:"yellow",extra:[{text:"■■■■■",color:"gold",obfuscated:true}]}
execute if score @s reloading matches 1.. run return 0

# 读取最大弹药（用于显示 X / MAX）
execute store result score @s gun_max_ammo run data get entity @s SelectedItem.components."minecraft:custom_data".gun_max_ammo
execute if score @s gun_max_ammo matches ..0 run scoreboard players set @s gun_max_ammo 30

# 正常状态 → 显示弹药数量（当前 / 最大）
title @s actionbar {text:"弹药: ",color:"white",extra:[{score:{name:"@s",objective:"ammo"},color:"green"},{text:" / ",color:"gray"},{score:{name:"@s",objective:"gun_max_ammo"},color:"green"}]}

# 不再持枪时移除显示标签
execute if entity @s[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run tag @s remove gun_display_ammo
execute if entity @s[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run title @s actionbar {text:""}
