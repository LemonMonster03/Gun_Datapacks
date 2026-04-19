# 检查是否正在装弹
execute if score @s reloading matches 1.. run return 0

# 检查装弹冷却
execute if score @s reload_cooldown matches 1.. run return 0

# 设置装弹状态
scoreboard players set @s reloading 1

# 清除副手火药
item replace entity @s weapon.offhand with minecraft:air

# 播放装弹音效
playsound minecraft:item.crossbow.loading_middle player @s ~ ~ ~ 1

# 设置装弹冷却时间（40 ticks = 2秒）
scoreboard players set @s reload_cooldown 40

execute as @s at @s run function gun:gun/reloading
