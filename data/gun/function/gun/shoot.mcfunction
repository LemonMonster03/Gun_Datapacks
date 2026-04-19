# 检查冷却
execute if score @s gun_cooldown matches 1.. run return 0

# 检查装弹中
execute if score @s reloading matches 1.. run return 0

# 检查弹药
execute unless score @s ammo matches 1.. run return 0

# 减少弹药
scoreboard players remove @s ammo 1

# 播放射击音效
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 0.5 2

# 视角抖动
scoreboard players set @s gun_shake_gap 1
execute if entity @s[scores={gun_shake=..30}] run scoreboard players add @s gun_shake 10

# 设置冷却时间
scoreboard players set @s gun_cooldown 4

# 调用子弹射线检测
execute at @s positioned ~ ~1.62 ~ run function gun:gun/bullet_raycast
