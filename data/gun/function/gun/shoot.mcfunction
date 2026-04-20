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

# ===== 读取枪械属性 =====
# 从手持物品的 custom_data 读取属性到记分板
execute store result score @s gun_dmg run data get entity @s SelectedItem.components."minecraft:custom_data".gun_damage
execute store result score @s gun_rng run data get entity @s SelectedItem.components."minecraft:custom_data".gun_range
execute store result score @s gun_pen run data get entity @s SelectedItem.components."minecraft:custom_data".gun_penetration

# 默认值兜底（custom_data 不存在时 data get 返回 0）
execute if score @s gun_dmg matches ..0 run scoreboard players set @s gun_dmg 7
execute if score @s gun_rng matches ..0 run scoreboard players set @s gun_rng 15
execute if score @s gun_pen matches ..0 run scoreboard players set @s gun_pen 1

# 初始化穿透计数器
scoreboard players operation @s gun_pen_left = @s gun_pen

# 将 damage 和 range 复制到 storage 供宏函数使用
execute store result storage gun:temp damage int 1 run scoreboard players get @s gun_dmg
execute store result storage gun:temp range int 1 run scoreboard players get @s gun_rng

# 调用子弹射线检测（传递宏参数）
execute at @s positioned ~ ~1.62 ~ run function gun:gun/bullet_raycast with storage gun:temp

# ===== 保存弹药到枪械物品 =====
execute store result storage gun:temp current_ammo int 1 run scoreboard players get @s ammo
item modify entity @s weapon.mainhand gun:save_ammo
