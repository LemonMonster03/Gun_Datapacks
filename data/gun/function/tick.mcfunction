# 每tick运行的内容
# 检测玩家右键胡萝卜钓竿
execute as @a[scores={use_gun=1..}] at @s run function gun:gun/shoot

# 重置右键检测
scoreboard players set @a use_gun 0

# 冷却时间处理
scoreboard players remove @a[scores={gun_cooldown=1..}] gun_cooldown 1

# 检测装弹
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:gunpowder"}]}] as @s run function gun:gun/reload

# 显示弹药
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] at @s run tag @s add gun_display_ammo
execute as @a[tag=gun_display_ammo] at @s run function gun:gun/display_ammo

# 装弹CD减少
function gun:gun/reloading

# 让猪离开
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] at @s if entity @e[type=pig,distance=..16] run \
execute as @e[type=pig,distance=..16] run data modify entity @s NoAI set value 1b

execute as @e[type=pig] at @s unless entity @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},distance=..17] run data modify entity @s NoAI set value 0b