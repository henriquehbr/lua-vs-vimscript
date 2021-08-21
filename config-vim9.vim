vim9script

def VimNew(): number
    var sum: number = 0
    for i in range(1, 2999999)
        sum = sum + 1
    endfor

    return sum
enddef

defcompile
VimNew()
