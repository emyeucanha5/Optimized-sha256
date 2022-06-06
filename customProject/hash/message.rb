require_relative "./initHash";
require_relative "../bitwise-operator/index";
require_relative "../function/cubeRootOfPrime"
require_relative "../function/messageSchedule"


# function

def temporary1 i, w
    k = $randNum[i];
    p1 = xorThreeBits(rightRotate($compressArray[4],6),
    rightRotate($compressArray[4],11), rightRotate($compressArray[4],25));

    p2 = makeDecision($compressArray[4],$compressArray[5],$compressArray[6])
    p3 = $compressArray[7];
    p4 = k 
    p5 = w[i];
    m1 = addBit(addBit(addBit(p1, p2), addBit(p3, p4)), p5);
    return m1;
end
def temporary2
    p1 = xorThreeBits(rightRotate($compressArray[0],2),
    rightRotate($compressArray[0],13), rightRotate($compressArray[0],22));
    
    p2 = majority($compressArray[0], $compressArray[1],$compressArray[2]);
    m2 = addBit(p1,p2);
    return m2;
end


# temporary1 0