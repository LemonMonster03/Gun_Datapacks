# 检查冷却
# 若冷却比1大，则返回0
execute if score @s gun_cooldown matches 1.. run return 0

# 检查装弹
execute if score @s reloading matches 1.. run return 0

# 检查弹药
execute unless score @s ammo matches 1.. run return 0

# 减少弹药
scoreboard players remove @s ammo 1

# 播放射击音效
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 0.5 2

# 减速
# effect give @s slowness 1 3 true

# 视角抖动
# execute as @s at @s run tp @s ~ ~ ~ ~ ~-2.5

# 设置冷却时间
scoreboard players set @s gun_cooldown 1

# 调用子弹飞行函数
execute as @s at @s positioned ~ ~0.7 ~ run function gun:gun/bullet_raycast
