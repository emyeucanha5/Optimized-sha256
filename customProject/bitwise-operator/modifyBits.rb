def modifyBits (x,n)
    x = changeDecimaltoBits(x)
    while(x.length < n)
        x = '0' + x 
    end
    return x
end

def changeBitsToDecimal (x)
    x =  x.to_i(2);
    # puts x
    return x
end

def changeDecimaltoBits (x)
    return x.to_s(2)
end
 