# 从手持枪械读取已保存的弹药数量
execute store result score @s ammo run data get entity @s SelectedItem.components."minecraft:custom_data".current_ammo
