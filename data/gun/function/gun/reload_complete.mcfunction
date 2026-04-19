# 重置装弹状态
scoreboard players set @s reloading 0

# 设置弹药数量
scoreboard players set @s ammo 30

# 播放上膛完成音效
playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 1 1
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.5 1.2

# 显示装弹完成提示
tellraw @s {text:"装弹完成！",color:"green"}
