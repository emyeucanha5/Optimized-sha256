require_relative("./modifyBits");

def addBit (x,y)
    ret = (x + y) % (2 ** 32)
    return ret
end

def xorThreeBits(x, y, z)
    ret = (x.to_i ^ y.to_i ^ z.to_i)
    return ret
end

# addBit(
#     0b1111111111111100000000000000,
#     0b00000000000000000011111111111111);

# xorThreeBits( 
#     0b11111110000000000000000001111111,
#     0b00000000000000000011111111111111,
#     0b11111111111111000000000000000000);