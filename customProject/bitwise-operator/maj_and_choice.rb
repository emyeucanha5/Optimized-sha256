require_relative("./rightOperator.rb");
require_relative("./add_and_xor.rb");
require_relative("./modifyBits");

def majority(x,y,z)
    ret = xorThreeBits((x & y),(x & z),(y & z))
    return ret;
end
# majority(0b00000000111111110000000011111111,
#          0b11111111111111111111111111111111,
#          0b00000000000000000000000000000000);

         
def makeDecision(x,y,z)
    ret = (x & y) ^ (~(x) & z);
    return ret;
end

# makeDecision(0b00000000111111110000000011111111,0b00000000000000001111111111111111,0b11111111111111110000000000000000);
