load 'player.rb'

class MainMenu
  @@players = Array.new
  
   def initialize
	choose()
		while(true) do
			get_player_input()
		end
	end


  def choose
	puts "#=============================================#"
	puts "#		Welcome to Battle Arena#"
	puts "#=============================================#"
	puts "# Description :#"
	puts "# 1. ketik “new” untuk membuat karakter#"
	puts "# 2. ketik “start” untuk memulai pertarungan 	#"
	puts "#---------------------------------------------#"
	puts "# Current Player : #{@@players.count}	#"
	if @@players.count.eql? 0
		puts "#	-									#"
	else
		puts "#{player_name()}"
	end
	puts "# * max player 2 atau 3	#"
	puts "#---------------------------------------------#"
  end



  def get_player_input
	@input= gets.chomp
	if @input.eql? "new"
	  puts "Masukan nama pemain:"
	  @nama = gets.chomp
	  @@players.push Player.new @nama
	  choose()
	elsif @input.eql? "start"
	  if @@players.count < 2
		puts "Pemain kurang dari 2, ketik new untuk tambah pemain"
	  elsif @@players.count.eql? 2
		#begin battle
		battle_start()
		for player in @@players do
			puts "#{player.nama}  manna:  #{player.manna}  blood:  #{player.blood}"
		end
		
	  end

	else
	  puts "Input tidak diketahui"
	end
  end
  
	
	def player_name
		tmp = ""
		for player in @@players do
			tmp = tmp + "#"+player.nama+ "#\n"
		end
		tmp
	end
	
	
	def battle_start
		puts "Battle Start :"
		puts "siapa yang akan menyerang :"
		@penyerang= gets.chomp
		puts "siapa yang diserang :"
		@diserang= gets.chomp
		for player in @@players do
			if @penyerang==player.nama then
				player.serang()
			else
				player.diserang()
			end
		end
	end
	

end

main= MainMenu.new


