# 检查是否正在装弹
execute if score @s reloading matches 1.. run return 0

# 检查装弹冷却
execute if score @s reload_cooldown matches 1.. run return 0

# 设置装弹状态
scoreboard players set @s reloading 1

# 清除弹药
# clear @s minecraft:gunpowder 1
item replace entity @s weapon.offhand with minecraft:air

# 播放装弹音效
playsound minecraft:item.crossbow.loading_middle player @s ~ ~ ~ 100

# 设置装弹冷却时间（20 ticks = 1秒）
scoreboard players set @s reload_cooldown 40

execute as @s at @s run function gun:gun/reloading
# 延迟3秒后完成装弹
# schedule function gun:gun/reload_complete 3s