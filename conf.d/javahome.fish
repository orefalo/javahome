
# Attempts to set the JAVA_HOME environment variable
# Author: Olivier Refalo - https://github.com/orefalo

set os (uname)

if test "$os" = "Darwin"
   if test -x /usr/libexec/java_home
	   set -g -x JAVA_HOME (/usr/libexec/java_home)
   else
   		set javapath (which java)
   		# resolve the link
   		if test -L "$javapath"
   			set javapath (readlink "$javapath")
   		end
   		set -g -x JAVA_HOME (dirname (dirname "$javapath"))
   end
end

if test "$os" = "Linux"
	set -g -x JAVA_HOME (dirname (dirname (readlink -f (which javac))))
end

#set -g -x PATH $JAVA_HOME/bin $PATH
fish_add_path --path $JAVA_HOME/bin
