$location = 1 	#sets the starting location
$g = 10
$inv = ["sword","moneypouch","potion", "potion"] #gives you your starting items
$hp = 65 #sets you initial hp

def commands
    puts ('Available commands are: inventory, goto, lookaround, health, use, quit') 
    end

def lookaround #lookarounds insists on being 1, even when goto forest
    case $location
    when 1
    puts ('You are currently in the starting location')
    when 2
    puts ('You are currently in the forest')
    end
    end

def inventory #displays inventory
     puts ('Items in your inventory: ' + $inv[0..-1].to_s)
     end

def goto
    puts ("Where would you like to go?")
    x=gets.chomp
    x=x.to_s
    case x
    when x = ("forest")
    $location = 2
    puts ("You have arrived at the forest")
    when x = ("start")
    $location = 1
    puts ("You have returned to the starting area")
    else 
    puts ("Invalid location. Try to \'lookaround\'")
    end
end

def health #didnt like inspect for method name
    puts ("You have #{$hp} health points")
    end

def use #trying to make it so when you type use X, it checks if itemlist, checks if you have it, and uses it
    puts ("Which item would you like to use?")
    y=gets.chomp
    y=y.to_s
    case y
    when y = ("potion")
        if $inv.include?('potion')
            if $hp + 30 >= 100
            $hp=100
            else   
            $hp+=30
            end
        $inv.delete_at($inv.find_index("potion"))
        puts ("You used a health potion. You restored 30 health")
        else
        puts ("You don\'t have a #{y} in your inventory")
        end
    when y = ("sword")
        if $inv.include?('sword')
        $inv.delete("sword")
	puts ("You equip your trusty sword")
        else
        puts ("You don\'t have a #{y} in your inventory")
        end
    when y = ("moneypouch")
        puts ("You have #{$g} gold in your moneypouch")
    else
    puts ("Invalid item name. Try inspecting your \'inventory\'")
    end
    end

def inspect
    puts ("You have #{$hp} health points")
    end

puts ("Welcome to the game. If this is your first time playing type \'commands\' to see the list of available commands.")
puts ("Input a command")
while 0==0
cmnd=''
cmnd=gets.chomp
cmnd.downcase!
cmnd.to_s
case cmnd
     when 'commands'
     commands
     when 'inventory'
     inventory
     when 'lookaround'
     lookaround
     when 'health'
     health
     when 'quit'
     break
     when 'use'
     use
     when 'goto'
     goto
     else
     puts ("Invalid command. Try \'commands\' for the list of commands")
end
end
