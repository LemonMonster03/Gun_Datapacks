# 检查是否正在装弹
execute if score @s reloading matches 1.. run return 0

# 检查装弹冷却
execute if score @s reload_cooldown matches 1.. run return 0

# 设置装弹状态
scoreboard players set @s reloading 1

# 从副手枪械读取装弹时间
execute store result score @s gun_reload_t run data get entity @s equipment.offhand.components."minecraft:custom_data".gun_reload_time

# 默认值兜底（无 custom_data 时为 40 ticks = 2秒）
execute if score @s gun_reload_t matches ..0 run scoreboard players set @s gun_reload_t 40

# 设置装弹冷却时间（使用读取的值）
scoreboard players operation @s reload_cooldown = @s gun_reload_t

# 将枪械从副手移回主手（立即归还，不占用副手）
# 将枪械从副手移回主手，同时将原主手物品放回副手（使用 armor_stand 防止吞物品）
summon armor_stand ~ ~ ~ {Tags:["tmp_gun_swap"],Invisible:1b,Marker:1b}
item replace entity @e[type=armor_stand,tag=tmp_gun_swap,limit=1] weapon.mainhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @e[type=armor_stand,tag=tmp_gun_swap,limit=1] weapon.mainhand
kill @e[type=armor_stand,tag=tmp_gun_swap]

# 播放装弹音效
playsound minecraft:item.crossbow.loading_middle player @s ~ ~ ~ 1

execute as @s at @s run function gun:gun/reloading
