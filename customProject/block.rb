require_relative('./finalHash.rb')
Maxnonce = 100000;
$difficulty = "00";

class Block
    attr_accessor :prev, :digest, :data,:nonce
    def initialize (digest,prev,data,nonce)
      @data = data
      @prev = prev
      @digest = digest
      @nonce = nonce
    end
end

def mine str, previousBlock
    starting = Time.now
    nonce = 1;
    checked = true;
    # previousBlock = '0000000000000000000000000000000000000000000000000000000000000000'
    while ((nonce < Maxnonce) && checked)
        tmp = '1' + nonce.to_s + str + previousBlock;
        digest = finalCompress tmp;
        # puts digest[0,2]
        if(digest[0,2] == $difficulty)
            ending = Time.now
            elapsed = ending - starting
            puts elapsed;
            return Block.new(
                digest,
                previousBlock,
                str,
                nonce,
            )
            checked = false
        end
        # puts nonce
        nonce += 1;
        # puts tmp
    end
    ending = Time.now
    elapsed = ending - starting
    puts elapsed;
end

def getText str, nonce , previousBlock
    tmp = '1' + nonce.to_s + str + previousBlock;
    return finalCompress tmp
end
# getText str