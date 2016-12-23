
# Attempts to set the JAVA_HOME environment variable
# Author: Olivier Refalo - https://github.com/orefalo

set os (uname)

if test "$os" = "Darwin"
   set -g -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
end

if test "$os" = "Linux"
	set -g -x JAVA_HOME (dirname (dirname (readlink -f (which javac))))
end

set -g -x PATH $JAVA_HOME/bin $PATH


