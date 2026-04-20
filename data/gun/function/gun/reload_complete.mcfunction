# 重置装弹状态
scoreboard players set @s reloading 0

# 从枪械读取弹药容量
execute store result score @s gun_max_ammo run data get entity @s SelectedItem.components."minecraft:custom_data".gun_max_ammo

# 默认值兜底（无 custom_data 时为 30 发）
execute if score @s gun_max_ammo matches ..0 run scoreboard players set @s gun_max_ammo 30

# 设置弹药数量（使用读取的值）
scoreboard players operation @s ammo = @s gun_max_ammo

# 保存弹药到枪械物品
execute store result storage gun:temp current_ammo int 1 run scoreboard players get @s ammo
item modify entity @s weapon.mainhand gun:save_ammo

# 播放上膛完成音效
playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 1 1
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.5 1.2

# 显示装弹完成提示
tellraw @s {text:"装弹完成！",color:"green"}
