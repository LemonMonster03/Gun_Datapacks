# 初始化记分板
scoreboard objectives add use_gun minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add gun_cooldown dummy
scoreboard objectives add ammo dummy
scoreboard objectives add reloading dummy
scoreboard objectives add reload_cooldown dummy
scoreboard objectives add gun_shake dummy
scoreboard objectives add gun_shake_up dummy
scoreboard objectives add gun_shake_down dummy
scoreboard objectives add gun_shake_gap dummy
scoreboard objectives add gun_init dummy

# 枪械属性记分板（从物品 custom_data 动态读取）
scoreboard objectives add gun_dmg dummy
scoreboard objectives add gun_rng dummy
scoreboard objectives add gun_pen dummy
scoreboard objectives add gun_pen_left dummy
scoreboard objectives add gun_max_ammo dummy
scoreboard objectives add gun_reload_t dummy
scoreboard objectives add gun_slot dummy
scoreboard objectives add gun_slot_prev dummy

# 初始化当前在线玩家
scoreboard players set @a reloading 0
scoreboard players set @a reload_cooldown 0
scoreboard players set @a gun_shake 0
scoreboard players set @a gun_shake_up 0
scoreboard players set @a gun_shake_down 0
scoreboard players set @a gun_shake_gap 0

# 通知加载成功
tellraw @a {text:"枪械数据包已加载!",color:"gold"}
