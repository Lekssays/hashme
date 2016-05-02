#!usr/bin/ruby
# Coded with <3 by Ahmed Lekssays

puts "
#    #   ##    ####  #    # #    # ###### 
#    #  #  #  #      #    # ##  ## #      
###### #    #  ####  ###### # ## # #####  
#    # ######      # #    # #    # #      
#    # #    # #    # #    # #    # #      
#    # #    #  ####  #    # #    # ###### "

$T = gets.to_i
while $T > 0 do 
	hash = gets.chomp
	if(hash.length == 32 )
		puts(hash + " [*] MD5")
		found = true
	elsif (hash.length == 40)
		puts(hash + " [*] SHA1")
		found = true
	elsif (hash.length == 16) 
		puts(hash + " [*] MySQL < 4.1")
		found = true
	elsif (hash[0] == '*' && hash.length == 41) 
		puts(hash + " [*] MySQL 5")
		found = true
	elsif (hash.length == 34 && hash[0] == '$' && hash[1] == 'P' && hash[2] == '$')
		puts(hash + " [*] MD5 Wordpress")
		found = true
	elsif (hash.length == 34 && hash[0] == '$' && hash[1] == 'H' && hash[2] == '$')
		puts(hash + " [*] MD5 PHP BB3")
		found = true
	elsif (hash.include? ':')
		idxS = ""
		idxE = ":"
		newHash = hash[/#{idxS}(.*?)#{idxE}/m, 1]
		if(newHash.length == 32)
			puts(hash + " [*] SALTED MD5")
			found = true
		end
		idxS2 = ":"
		idxE2 = ""
		newHash2 = hash[/#{idxS}(.*?)#{idxE}/m, 1]
		if(newHash2.length == 40)
			puts(hash + " [*] SHA1($username.$pass")
			found = true
		end
	elsif (hash.length == 34 && hash[0] == '$' && hash[1] == '1' && hash[2] == '$')
		puts(hash + " [*] MD5(UNIX)")
		found = true
	elsif (hash.length == 37 && hash[0] == '$' && hash[1] == 'a' && hash[2] == 'p')
		puts(hash + " [*] MD5(APR)")
		found = true
	elsif (hash[0] == 's' && hash[1] == 'h' && hash[2] == 'a' && hash[3] == '1' && hash[4] == '$')
		puts(hash + " [*] SHA1 - DJANGO")
		found = true
	elsif (hash[0] == 's' && hash[1] == 'h' && hash[2] == 'a' && hash[3] == '2' && hash[4] == '6')
		puts(hash + " [*] SHA256 - DJANGO")
		found = true
	elsif (hash[0] == 's' && hash[1] == 'h' && hash[2] == 'a' && hash[3] == '3' && hash[4] == '8')
		puts(hash + " [*]SHA384 - DJANGO")
		found = true
	elsif (hash[0] == '$' && hash[1] == '6' && hash[2] == '$')
		puts(hash + " [*] SHA512(Unix)")
		found = true
	end

	if(!found) 
		puts(hash + " Sorry :( We did not recognize the type of this hash")
	end
	$T -= 1
end
puts("Done :)")
