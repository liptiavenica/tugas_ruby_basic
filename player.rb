class Player
	attr_accessor :nama, :blood, :manna
	
	def initialize nama
		@blood=100
		@manna=40
		@nama = nama
	end
	
	def serang
		@manna -=20
	end
	
	def diserang
		@blood -=20
	end
	
	def game_over
		@manna == 0 || @blood == 0
	end
end
