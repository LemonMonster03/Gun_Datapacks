# 初始化新加入的玩家
execute as @a unless score @s gun_init matches 1 run function gun:gun/init_player

# ===== 装弹检测（副手放入枪械触发）=====
execute as @a[nbt={equipment:{offhand:{id:"minecraft:carrot_on_a_stick"}}}] at @s run function gun:gun/reload

# 检测玩家右键胡萝卜钓竿
execute as @a[scores={use_gun=1..}] at @s run function gun:gun/shoot

# 重置右键检测
scoreboard players set @a use_gun 0

# 冷却时间处理
scoreboard players remove @a[scores={gun_cooldown=1..}] gun_cooldown 1

# ===== 弹药同步（检测换枪 → 从物品读取弹药）=====
# 读取当前选中槽位
execute as @a store result score @s gun_slot run data get entity @s SelectedItemSlot

# 槽位变化时清除同步标记（强制重新读取弹药）
execute as @a unless score @s gun_slot = @s gun_slot_prev run tag @s remove gun_ammo_synced

# 槽位变化时打断正在进行的装弹（防止切枪后把弹药装错给其他物品）
execute as @a unless score @s gun_slot = @s gun_slot_prev run scoreboard players set @s reloading 0
execute as @a unless score @s gun_slot = @s gun_slot_prev run scoreboard players set @s reload_cooldown 0

# 更新上一次槽位
scoreboard players operation @a gun_slot_prev = @a gun_slot

# 持枪且未同步 → 从物品读取弹药
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] unless entity @s[tag=gun_ammo_synced] run function gun:gun/sync_ammo_from_item
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run tag @s add gun_ammo_synced

# 不持枪 → 清除同步标记
execute as @a[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run tag @s remove gun_ammo_synced

# 显示弹药 / 装弹状态
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run tag @s add gun_display_ammo
 execute as @a[tag=gun_display_ammo] at @s run function gun:gun/display_ammo

# 装弹CD减少
function gun:gun/reloading

# 持枪时冻结附近的猪（防止胡萝卜钓竿吸引猪）
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] at @s run execute as @e[type=pig,distance=..16] run data modify entity @s NoAI set value 1b
execute as @e[type=pig] at @s unless entity @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}},distance=..17] run data modify entity @s NoAI set value 0b

# 抖动
function gun:gun/shake
