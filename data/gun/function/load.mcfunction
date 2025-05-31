# 初始化记分板
tellraw @a {"text":"枪械数据包加载中……","color":"gold"}
scoreboard objectives add use_gun minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add gun_cooldown dummy
scoreboard objectives add ammo dummy
scoreboard objectives add reloading dummy
scoreboard objectives add reload_cooldown dummy
scoreboard objectives add gun_shake dummy
scoreboard objectives add gun_shake_up dummy
scoreboard objectives add gun_shake_down dummy
scoreboard objectives add gun_shake_gap dummy
scoreboard players set @a ammo 0

# 初始化枪械数据
scoreboard players set @a reloading 0
scoreboard players set @a reload_cooldown 0
scoreboard players set @a gun_shake 0
scoreboard players set @a gun_shake_up 0
scoreboard players set @a gun_shake_down 0
scoreboard players set @a gun_shake_gap 0

# 通知加载成功
tellraw @a {"text":"枪械数据包已加载!","color":"gold"}