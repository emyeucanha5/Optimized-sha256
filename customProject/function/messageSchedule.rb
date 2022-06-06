require_relative('../bitwise-operator/index.rb');
require_relative('./messages.rb')
$blockLength;
$blockOfMessages = []

def messageSchedule message
    w = [];
    originL = message.length.to_s(2);
    message += '1';
    l = message.length;
    $blockLength = ((l+64)/512);
    if((l+64)%512 != 0)
        $blockLength += 1;
    end
    n = $blockLength *  512  - l - 64; 
    k = (l/32).floor()*32; # finding the largest divisor of 32 and less than message length
    i = 0;
    if(l>=32)
        while i<k
            tmp = message[i,32].to_i(2);
            w << tmp;
            i+=32;
        end
    end
    lastBit = message[i,l-k].to_i(2)*(2**(32-l+k)) % 2**(32);
    w << lastBit;
    n -= 32-l+k;
    k = (n/32).floor()*32;
    if(n>=32)
        i = 0;
        while i < k
            w << 0;
            i+=32;
        end
    end
    if(originL.length>=32)
        w << originL[0,originL.length-32].to_i(2);
        w << originL[originL.length-32,32].to_i(2);
    else
        w<<0;
        w<<originL.to_i(2);
    end
    return w;
end

def messageSchedule64Words w
    i = 16;
    while i < 64
        w << addBit(addBit(w[i-16],sigma(w[i-15],0,false)), addBit(w[i-7],sigma(w[i-2],1,false)));
        i += 1;
    end
    return w;
end

# message = createMessagesBits "abcdefrstuvwxyzabcderrstuvwxyzabcderstuvwxyzuvwx"; 
# tmpStr = messageSchedule message;
# puts tmpStr;

# messageSchedule "abc"