# 重置装弹状态
scoreboard players set @s reloading 0

# 设置弹药数量（例如30发）
scoreboard players set @s ammo 30

# 播放装弹完成音效
# playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1

# 显示装弹完成提示
tellraw @s {"text":"装弹完成！","color":"green"}