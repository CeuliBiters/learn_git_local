class Player
	attr_accessor :nama, :blood, :manna
	def initialize
		@nama = nama
		@blood = 100
		@manna = 40
	end
end

class MainMenu
	attr_accessor :i, :players
	def initialize
		@i = 0
		@players = Array.new
	end
	
	def begin 
		puts "\n
		#==============================#\n
		# Welcome to Battle Arena #\n
		#-----------------------------------------------------#\n
		# Description : #\n
		# 1. ketik “new” untuk membuat karakter #\n
		# 2. ketik “start” untuk memulai pertarungan #\n
		#-----------------------------------------------------#\n
		# Current Player : #{i} #\n
		# * max player 2 atau 3 #\n
		#-----------------------------------------------------#\n"
	end
	
	def menu
		n = 0
		pl = @players
		puts "\n
		#==============================#\n
		# Welcome to Battle Arena #\n
		#-----------------------------------------------------#\n
		# Description : #\n
		# 1. ketik “new” untuk membuat karakter #\n
		# 2. ketik “start” untuk memulai pertarungan #\n
		#-----------------------------------------------------#\n
		# Current Player : #{i} #\n"
		until n == @i
			puts "		#		- #{pl[n].nama}" 
			n += 1
		end
		puts "
		# * max player 2 atau 3 #\n
		#-----------------------------------------------------#\n"
	end
	
	def start
		pl = @players
		begin
		puts "
		#==============================#
		# Welcome to Battle Arena #
		#-----------------------------------------------------#
		Battle Start :
		siapa yang akan menyerang :"
			input = gets.chomp
			patk = Player.new
			pdef = Player.new
			n = 0
			until n == @i
				if input == pl[n].nama
					pl[n].manna -= 20
					patk = pl[n]
				end
				n += 1
			end
			puts "		siapa yang di serang :"
			input = gets.chomp
			x = 0
			until x == @i
				if input == pl[x].nama
					pl[x].blood -= 20
					pdef = pl[x]
				end
				x += 1
			end
			puts "		Description :
			#{patk.nama} : manna = #{patk.manna}, blood = #{patk.blood}\n   
			#{pdef.nama} : manna = #{pdef.manna}, blood = #{pdef.blood}"
		end while patk.manna != 0 and pdef.blood != 0
		puts "game over"
		
	end
end

main = MainMenu.new
main.begin
input = gets.chomp

begin 
	if input == "new"
		if main.i == 3
			puts 'player sudah penuh'
		else
			main.players << Player.new
			puts "masukan nama player:"
			main.players[main.i].nama = gets.chomp
			main.i += 1
			main.menu
		end
	else
		puts 'pemain kurang'
	end
	input = gets.chomp
end while input != "start" or main.i < 2
main.start



