module UsersHelper
end

def create_all(numUsers = 500)
  @animals = %w(camel 
               chimp 
               horse 
               llama
               moose 
               mouse
               puppy
               rhino
               zebra
               sloth
               sheep
               beaver
               coyote
               jaguar)

  @colors = %w(black
              white
              red
              blue
              yellow
              green
              purple
              pink
              brown
              orange)

  @username = Array.new
  @allUsernames = Array.new
  @password = Array.new
  output = File.open("tmp/users.txt", "a")

  (1..numUsers).each do
    
    @password.clear
    begin
      @username.clear
      @username << @colors.shuffle.first << @animals.shuffle.first << rand(9) << rand(9)
    end while @allUsernames.include? @username.join

    @allUsernames << @username.join
    @password << rand(100000..999999)

    output << @username.join << "\t" << @password.join << "\n"

  end
end

def add_users

end

#create_all
