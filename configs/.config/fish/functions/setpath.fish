function setpath -d "Set given path if target path exists"
    if test (count $argv) -lt 2
        echo 'Not enough input arguments'
        return 1
    end

    set -l pathvar $argv[1]

    for newpath in $argv[2..-1]
        if test -d $newpath
            set $pathvar $newpath $PATH
        end
    end
end
