#!/usr/bin/ruby

if ENV['USER'] != "root"
   puts "You are not root: terminating"
   exit
end

`cp sneetchalizer /usr/bin/sneetchalizer`
`chown root:root /usr/bin/sneetchalizer`
`chmod 755 /usr/bin/sneetchalizer`

`cp sneetchalizer.1 /usr/share/man/man1/sneetchalizer.1`
`chown root:root /usr/share/man/man1/sneetchalizer.1`
`chmod 644 /usr/share/man/man1/sneetchalizer.1`

if ENV['KDEDIR'] == ""
  puts "Can't determine $KDEDIR. Please copy `sneetchalizer.desktop` to"
  puts "`$KDEDIR/share/apps/konqueror/servicemenus/` manually..."
  puts "If you don't use KDE please ignore this."
  exit
else
  `cp sneetchalizer.desktop #{ENV['KDEDIR']}/share/apps/konqueror/servicemenus/`
end

puts "sneetchalizer is now installed. Enjoy..."

