execute if score @s ncd.virtualhp matches -2147483648.. run scoreboard players operation #hp ncd.temp = @s ncd.virtualhp
execute unless score @s ncd.virtualhp matches -2147483648.. store result score #hp ncd.temp run data get entity @s Health 1000

tellraw @a {"score":{"name":"#hp","objective":"ncd.temp"}}