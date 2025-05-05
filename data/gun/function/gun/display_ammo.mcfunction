# 显示弹药数量
title @s actionbar {"text":"弹药: ","color":"white","extra":[{"score":{"name":"@s","objective":"ammo"},"color":"green"}]} 
execute as @a[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run tag @s remove gun_display_ammo
title @a[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] actionbar {"text":""}