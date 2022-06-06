require_relative("./modifyBits");


def rightRotate(b, i)
    # print "Input: message: ", modifyBits(b, 32).to_s,", number of bits to move: ", i.to_s;
    # puts;
    ret = ((((b >> i) & 2**32-1)|(( b << 32-i) & 2**32-1)) & 2**32-1);
    # puts "Right rotate:   " + modifyBits(ret, 32)
    return ret;
end
# rightRotate(0b01111111111111111111111111111111,1);

def rightShift (b,i)
    # print "Input: message: ", modifyBits(b, 32).to_s,", number of bits to move: ", i.to_s;
    # puts;
    ret = (b >> i);
    # puts "RightShift:     " + modifyBits(ret,32);
    return ret
end
# rightShift(0b01111111111111111111111111111111,1);




