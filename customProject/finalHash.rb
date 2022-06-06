require_relative './bitwise-operator/index';
require_relative './hash/index.rb';
require_relative './function/index.rb';

$defaultHash = '0000000000000000000000000000000000000000000000000000000000000000';


$finalCompressArray = []
$finalString;
def finalCompress str
    $finalCompressArray.clear 
    $compressArray = initHash.clone
    $blockOfMessages.clear
    message = createMessagesBits str 
    tmpStr = messageSchedule(message);
    w = [];
    j = 1;
    oldcompress = [];
    x = tmpStr.length/16;
    for i in 1..x
        w = tmpStr[(i-1)*16, 16];
        w = messageSchedule64Words(w);
        oldcompress = $compressArray.clone
        compression w
        if(j==1)
            for i in 0..7
                $compressArray[i] =  addBit($compressArray[i], $initialArray[i]);
            end
        else
            for i in 0..7
                $compressArray[i] =  addBit($compressArray[i], oldcompress[i]);
            end
        end
        j+=1;
    end

    
    # #final hash
    k = 0;
    $compressArray.each do |i|
        x = i.to_s(16);
        while x.length < 8
            x = '0' + x;
        end
        $finalCompressArray.push x
        k += 1;
    end
    ret = $finalCompressArray.join("")
    return ret
end
