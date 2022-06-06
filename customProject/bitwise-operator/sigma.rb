require_relative("./rightOperator.rb");
require_relative("./add_and_xor.rb");
require_relative("./modifyBits");


def sigma(x, i, usigma)
    if(usigma == true)
        if(i==0)
            ret = xorThreeBits(rightRotate(x,2), rightRotate(x,13), rightRotate(x,22));
        elsif(i==1)
            ret = xorThreeBits(rightRotate(x,6), rightRotate(x,11), rightRotate(x,25));
        end
    else
        if(i==0)
            ret = xorThreeBits(rightRotate(x, 7),rightRotate(x, 18),rightShift(x,3));
            # puts "Sigma0: " + changeDecimaltoBits(ret);
        elsif (i==1)
            ret = xorThreeBits(rightRotate(x,17),rightRotate(x, 19),rightShift(x, 10));
            # puts ("Sigma1: " + modifyBits(ret,32));
        end
    end

    return ret
end

# sigma(12,0)