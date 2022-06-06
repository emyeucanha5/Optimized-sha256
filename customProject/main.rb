require "tk"
require 'tkextlib/tile'
require_relative('./finalHash.rb');
require_relative('./block.rb');
TkOption.add '*tearOff', 0
root = TkRoot.new do
    background 'lightblue'
end
root.grid_rowconfigure(0, :weight => 1)
root.grid_columnconfigure(0, :weight => 1)
root.overrideredirect(true)
root.overrideredirect(false)
# root.attributes(:fullscreen => 1)
root.title('Blockchain demo application')

$menuItem = ['SHA256', 'Block', 'Block Chain']



$header = TkFrame.new(root) do
    background 'black'
    pack('side' => 'top', 'fill' => 'x')
end
$menuItem.each do |item|
    menu = TkButton.new($header) do
        text item
        background 'black'
        foreground  "white"
        height 2
        borderwidth 0
        padx 20
        font TkFont.new('times 15 bold') 
        pack 'side' => 'left'
    end
    menu.bind("ButtonRelease") do
        if(item == "SHA256")
            $f1.pack()
            root.background = 'lightblue';
            $f2.pack_forget()
            $f3.pack_forget()
        end
        if(item == "Block")
            $f1.pack_forget()
            $f2.pack()
            $input_nonce.value = 10
            $input_block.value = ''
            $f2.background = 'lightblue';
            root.background = 'lightblue';
            $data_label.background = 'lightblue';
            $hash_label.background = 'lightblue';
            $block_label.background = 'lightblue';
            $nonce_label.background = 'lightblue';
            $output_block.background = 'lightblue';
            $f3.pack_forget()
        end
        if(item == "Block Chain")
            $f1.pack_forget()
            root.background = 'lightblue';
            $f2.pack_forget()
            $f3.pack()
        end
    end
end

$f1 = TkFrame.new(root) do
    relief 'sunken'
    background "lightblue"
    padx 15
    pack('side' => 'left', 'fill' => 'both')
end

text_label = TkLabel.new($f1) do
    text 'SHA256 enryption algorithm'
    background "lightblue"
    pady 25
    font TkFont.new('times 30 bold') 
    pack("side" => "top", "pady"=> "15", )
end
TkLabel.new($f1) do
    text 'Data'
    background "lightblue"
    font TkFont.new('times 20 bold') 
    pack("side" => "left", "pady"=> "25")
end
$input = TkText.new($f1) do 
    width 300
    height 20
    borderwidth 1 
    font TkFont.new('times 15 bold') 
    pack("side" => "top",  "padx"=> "15", "pady"=> "25") 
end 
# finalCompress

$input.bind('KeyRelease'){
    $output.text = finalCompress $input.value
}
 
labelforoutput = TkLabel.new($f1) do
    background "lightblue"
    text 'SHA256 enrypt algorithm: '
    font TkFont.new('times 18 bold') 
    pack("side" => "left",  "padx"=> "15", "pady"=> "10") 
end


$output = TkLabel.new($f1) do
    text finalCompress ''
    background "lightblue"
    font TkFont.new('times 18 bold') 
    pack("side" => "left",  "padx"=> "15", "pady"=> "25") 
end


# block

$f2 = TkFrame.new(root) do
    background "lightblue"
    pack('side' => 'left', 'fill' => 'both')
end


$block_label = TkLabel.new($f2) do
    text 'Block'
    background "lightblue"
    font TkFont.new('times 30 bold') 
    pack("side" => "top", "pady"=> "25", "fill"=>'both')
end
$nonce_label = TkLabel.new($f2) do
    text 'Nonce'
    background "lightblue"
    font TkFont.new('times 20 bold') 
    anchor='w'
    pack( "pady"=> "2", "fill"=>'both')
end

$input_nonce = TkText.new($f2) do 
    width 150
    height 1
    borderwidth 1 
    font TkFont.new('times 15 bold') 
    pack("side" => "top",  "padx"=> "15", "pady"=> "25") 
end 
$data_label = TkLabel.new($f2) do
    text 'Data'
    background "lightblue"
    font TkFont.new('times 20 bold') 
    pack( "pady"=> "2", )
end
$input_block = TkText.new($f2) do 
    width 150
    height 10
    borderwidth 1 
    font TkFont.new('times 15 bold') 
    pack("side" => "top",  "padx"=> "15", "pady"=> "25") 
end 
# finalCompress


$button = TkButton.new($f2) do
    text "Mine"
    background "#265a88"
    foreground "white"
    font TkFont.new('times 15 bold') 
    pack("side" => "top")
end
$input_nonce.bind('KeyRelease'){
    $output_block.text = getText($input_block.value, $input_nonce.value, $defaultHash);
    if($output_block.text[0,2] != $difficulty)
        $f2.background = 'red';
        root.background = 'red';
        $hash_label.background = 'red';
        $block_label.background = 'red';
        $nonce_label.background = 'red';
        $data_label.background = 'red';
        $output_block.background = 'red';
    else
        $f2.background = 'lightblue';
        root.background = 'lightblue';
        $hash_label.background = 'lightblue';
        $block_label.background = 'lightblue';
        $nonce_label.background = 'lightblue';
        $data_label.background = 'lightblue';
        $output_block.background = 'lightblue';
    end
}
$input_block.bind('KeyRelease'){
    $output_block.text = getText($input_block.value, $input_nonce.value, $defaultHash);
    if($output_block.text[0,2] != $difficulty)
        $f2.background = 'red';
        root.background = 'red';
        $hash_label.background = 'red';
        $block_label.background = 'red';
        $data_label.background = 'red';
        $nonce_label.background = 'red';
        $output_block.background = 'red';
    else
        $f2.background = 'lightblue';
        root.background = 'lightblue';
        $data_label.background = 'lightblue';
        $hash_label.background = 'lightblue';
        $block_label.background = 'lightblue';
        $nonce_label.background = 'lightblue';
        $output_block.background = 'lightblue';
    end
}

    

$button.bind('ButtonRelease'){
    x = mine($input_block.value, $defaultHash)
    $output_block.text = x.digest;
    $input_nonce.value = x.nonce;
    $f2.background = 'lightblue';
    root.background = 'lightblue';
    $data_label.background = 'lightblue';
    $hash_label.background = 'lightblue';
    $block_label.background = 'lightblue';
    $nonce_label.background = 'lightblue';
    $output_block.background = 'lightblue';
}
 
$hash_label = TkLabel.new($f2) do
    background "lightblue"
    text 'Hash: '
    font TkFont.new('times 18 bold') 
    pack("side" => "left",  "padx"=> "15", "pady"=> "15") 
end


$output_block = TkLabel.new($f2) do
    text getText '',10,$defaultHash
    background "lightblue"
    font TkFont.new('times 18 bold') 
    pack("side" => "left",'fill' => 'x',  "padx"=> "15", "pady"=> "15") 
end

$f3 = TkFrame.new do
    background "lightblue"
    pack('side' => 'top')
end
$block_chain_label = TkLabel.new($f3) do
    text "Block chain"
    pady 10
    background "lightblue"
    font TkFont.new('times 25 bold') 
    pack('side' => 'top')
end
$f3_1 = TkFrame.new($f3) do
    background "lightblue"
    pack('side' => 'top')
end
$f3_2 = TkFrame.new($f3) do
    background "lightblue"
    pack('side' => 'bottom', "pady" => "5")
end

$block_chain_value = [];

$input_size = 40
tmpBlock = 2
$font_size = 10
$pad_x = 2
$pad_y = 10
$input_block_chain_nonce = []
$input_block_chain = []
$output_block_chain = [] 
$button_block_chain = []
$index_chain_label = []
$previous_label = []
$nonce_chain_label = []
$data_chain_label = []
$tmpArray = [0,1,2]
$tmp2Array = [3,4,5]
$f4 = []
$tmpArray.each do |i|
    $f4[i] = TkFrame.new($f3_1) do
        background "lightgreen"
        width 300
        pack('side' => 'left', "padx" => "5")
        # height 10
    end
    $index_chain_label[i] = TkLabel.new($f4[i]) do
        text 'Block: ' + (i+1).to_s
        background "lightgreen"
        font TkFont.new("times #{$font_size} bold") 
        anchor='w'
        pack( "pady"=> "2", "fill"=>'both')
    end
    $nonce_chain_label[i] = TkLabel.new($f4[i]) do
        text 'Nonce'
        background "lightgreen"
        font TkFont.new("times #{$font_size} bold") 
        anchor='w'
        pack( "pady"=> "2", "fill"=>'both')
    end

    $input_block_chain_nonce[i] = TkText.new($f4[i]) do 
        width $input_size
        height 1
        borderwidth 1 
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "top",  "padx"=> "#{$pad_x}", "pady"=> "#{$pad_y}") 
    end 
    $data_chain_label[i] = TkLabel.new($f4[i]) do
        text 'Data'
        background "lightgreen"
        font TkFont.new("times #{$font_size} bold") 
        pack( "pady"=> "2", )
    end
    $input_block_chain[i] = TkText.new($f4[i]) do 
        width $input_size
        height 5
        borderwidth 1 
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "top",  "padx"=> "#{$pad_x}", "pady"=> "#{$pad_y}") 
    end 
    $button_block_chain[i] = TkButton.new($f4[i]) do
        text "Mine"
        background "#265a88"
        foreground "white"
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "top")   
    end
    $previous_label[i] = TkLabel.new($f4[i]) do
        background "lightgreen"
        text 'Prev: ' + getText( '',10,$defaultHash ).to_s
        width 70
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "top",  "padx"=> "#{$pad_x}", "pady"=> "#{$pad_y-4}") 
    end
    $output_block_chain[i] = TkLabel.new($f4[i]) do
        text 'Hash: ' + getText( '',10,$defaultHash ).to_s
        background "lightgreen"
        width 70
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "bottom",'fill' => 'x',  "padx"=> "#{$pad_x}", "pady"=> "#{$pad_y-4}") 
    end
    if (i==0)
        $previous_label[i].text = 'Prev: ' + $defaultHash
        tmp = mine($input_block_chain[i].value, $previous_label[i].text[6,64]);
        $input_block_chain_nonce[i].value = tmp.nonce
        $output_block_chain[i].text = "Hash: " + tmp.digest
        $block_chain_value[0] =  Block.new(tmp.digest,$previous_label[i].text[6,64],$input_block_chain[i].value ,$input_block_chain_nonce[i])
        # puts $output_block_chain[0].text 
    else
        $previous_label[i].text = 'Prev: ' + $block_chain_value[i-1].digest.to_s
        tmp = mine($input_block_chain[i].value, $previous_label[i].text[6,64]);
        $input_block_chain_nonce[i].value = tmp.nonce
        $output_block_chain[i].text = "Hash: " + tmp.digest
        $block_chain_value[i] =  Block.new(tmp.digest,$previous_label[i].text[6,64],$input_block_chain[i].value ,$input_block_chain_nonce[i])
        # puts tmp.digest
    end
    $input_block_chain_nonce[i].bind('KeyRelease'){
        for j in 0..5
            if(j < i)
            else
                if(i==j)
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                else
                    $previous_label[j].text = 'Prev: ' + $block_chain_value[j-1].digest.to_s
                    $block_chain_value[j].prev = $previous_label[j].text[6,64]
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                end
                $block_chain_value[j] = Block.new($output_block_chain[j].text[6,64], $previous_label[j].text[6,64],$input_block_chain[j].value ,$input_block_chain_nonce[j].value)
            end
        end
        for j in 0..5
            if($output_block_chain[j].text[6,64][0,2] != $difficulty)
                $output_block_chain[j].background = 'red'
                $previous_label[j].background = 'red'
            else
                $output_block_chain[j].background = 'lightgreen'
                $previous_label[j].background = 'lightgreen'
            end
        end
    }
    $input_block_chain[i].bind('KeyRelease'){
        for j in 0..5
            if(j < i)
            else
                if(i==j)
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                else
                    $previous_label[j].text = 'Prev: ' + $block_chain_value[j-1].digest.to_s
                    $block_chain_value[j].prev = $previous_label[j].text[6,64]
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                end
                $block_chain_value[j] = Block.new($output_block_chain[j].text[6,64], $previous_label[j].text[6,64],$input_block_chain[j].value ,$input_block_chain_nonce[j].value)
            end
        end
        for j in 0..5
            if($output_block_chain[j].text[6,64][0,2] != $difficulty)
                $output_block_chain[j].background = 'red'
                $previous_label[j].background = 'red'
            else
                $output_block_chain[j].background = 'lightgreen'
                $previous_label[j].background = 'lightgreen'
            end
        end
    }
    $button_block_chain[i].bind('ButtonRelease'){
        x = mine($input_block_chain[i].value, $previous_label[i].text[6,64])
        $output_block_chain[i].text = 'Hash: ' + x.digest;
        $input_block_chain_nonce[i].value = x.nonce;
        $block_chain_value[i] = Block.new($output_block_chain[i].text[6,64], $previous_label[i].text[6,64],$input_block_chain[i].value ,$input_block_chain_nonce[i].value)
        for j in 0..5
            if(j < i)
            else
                if(i==j)
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                else
                    $previous_label[j].text = 'Prev: ' + $block_chain_value[j-1].digest.to_s
                    $block_chain_value[j].prev = $previous_label[j].text[6,64]
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                end
                $block_chain_value[j] = Block.new($output_block_chain[j].text[6,64], $previous_label[j].text[6,64],$input_block_chain[j].value ,$input_block_chain_nonce[j].value)
            end
        end
        for j in 0..5
            if($output_block_chain[j].text[6,64][0,2] != $difficulty)
                $output_block_chain[j].background = 'red'
                $previous_label[j].background = 'red'
            else
                $output_block_chain[j].background = 'lightgreen'
                $previous_label[j].background = 'lightgreen'
            end
        end
    }
end




$tmp2Array.each do |i|
    $f4[i] = TkFrame.new($f3_2) do
        background "lightgreen"
        pack('side' => 'left', "padx" => "5")
        # height 10
    end
    $index_chain_label[i] = TkLabel.new($f4[i]) do
        text 'Block: ' + (i+1).to_s
        background "lightgreen"
        font TkFont.new("times #{$font_size} bold") 
        anchor='w'
        pack( "pady"=> "2", "fill"=>'both')
    end
    $nonce_chain_label[i] = TkLabel.new($f4[i]) do
        text 'Nonce'
        background "lightgreen"
        font TkFont.new("times #{$font_size} bold") 
        anchor='w'
        pack( "pady"=> "2", "fill"=>'both')
    end

    $input_block_chain_nonce[i] = TkText.new($f4[i]) do 
        width $input_size
        height 1
        borderwidth 1 
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "top",  "padx"=> "#{$pad_x}", "pady"=> "#{$pad_y}") 
    end 
    $data_chain_label[i] = TkLabel.new($f4[i]) do
        text 'Data'
        background "lightgreen"
        font TkFont.new("times #{$font_size} bold") 
        pack( "pady"=> "2", )
    end
    $input_block_chain[i] = TkText.new($f4[i]) do 
        width $input_size
        height 5
        borderwidth 1 
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "top",  "padx"=> "#{$pad_x}", "pady"=> "#{$pad_y}") 
    end 
    $button_block_chain[i] = TkButton.new($f4[i]) do
        text "Mine"
        background "#265a88"
        foreground "white"
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "top")   
    end
    $previous_label[i] = TkLabel.new($f4[i]) do
        background "lightgreen"
        text 'Prev: ' + getText( '',10,$defaultHash ).to_s
        width 70
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "top",  "padx"=> "#{$pad_x}", "pady"=> "#{$pad_y-4}") 
    end
    $output_block_chain[i] = TkLabel.new($f4[i]) do
        text 'Hash: ' + getText( '',10,$defaultHash ).to_s
        background "lightgreen"
        width 70
        font TkFont.new("times #{$font_size} bold") 
        pack("side" => "bottom",'fill' => 'x',  "padx"=> "#{$pad_x}", "pady"=> "#{$pad_y-4}") 
    end
    if (i==0)
        $previous_label[i].text = 'Prev: ' + $defaultHash
        tmp = mine($input_block_chain[i].value, $previous_label[i].text[6,64]);
        $input_block_chain_nonce[i].value = tmp.nonce
        $output_block_chain[i].text = "Hash: " + tmp.digest
        $block_chain_value[0] =  Block.new(tmp.digest,$previous_label[i].text[6,64],$input_block_chain[i].value ,$input_block_chain_nonce[i])
        # puts $output_block_chain[0].text 
    else
        $previous_label[i].text = 'Prev: ' + $block_chain_value[i-1].digest.to_s
        tmp = mine($input_block_chain[i].value, $previous_label[i].text[6,64]);
        $input_block_chain_nonce[i].value = tmp.nonce
        $output_block_chain[i].text = "Hash: " + tmp.digest
        $block_chain_value[i] =  Block.new(tmp.digest,$previous_label[i].text[6,64],$input_block_chain[i].value ,$input_block_chain_nonce[i])
        # puts tmp.digest
    end
    $input_block_chain_nonce[i].bind('KeyRelease'){
        for j in 0..5
            if(j < i)
            else
                if(i==j)
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                else
                    $previous_label[j].text = 'Prev: ' + $block_chain_value[j-1].digest.to_s
                    $block_chain_value[j].prev = $previous_label[j].text[6,64]
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                end
                $block_chain_value[j] = Block.new($output_block_chain[j].text[6,64], $previous_label[j].text[6,64],$input_block_chain[j].value ,$input_block_chain_nonce[j].value)
            end
        end
        for j in 0..5
            if($output_block_chain[j].text[6,64][0,2] != $difficulty)
                $output_block_chain[j].background = 'red'
                $previous_label[j].background = 'red'
            else
                $output_block_chain[j].background = 'lightgreen'
                $previous_label[j].background = 'lightgreen'
            end
        end
    }
    $input_block_chain[i].bind('KeyRelease'){
        for j in 0..5
            if(j < i)
            else
                if(i==j)
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                else
                    $previous_label[j].text = 'Prev: ' + $block_chain_value[j-1].digest.to_s
                    $block_chain_value[j].prev = $previous_label[j].text[6,64]
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                end
                $block_chain_value[j] = Block.new($output_block_chain[j].text[6,64], $previous_label[j].text[6,64],$input_block_chain[j].value ,$input_block_chain_nonce[j].value)
            end
        end
        for j in 0..5
            if($output_block_chain[j].text[6,64][0,2] != $difficulty)
                $output_block_chain[j].background = 'red'
                $previous_label[j].background = 'red'
            else
                $output_block_chain[j].background = 'lightgreen'
                $previous_label[j].background = 'lightgreen'
            end
        end
    }
    $button_block_chain[i].bind('ButtonRelease'){
        
        x = mine($input_block_chain[i].value, $previous_label[i].text[6,64])
        $output_block_chain[i].text = 'Hash: ' + x.digest;
        $input_block_chain_nonce[i].value = x.nonce;
        $block_chain_value[i] = Block.new($output_block_chain[i].text[6,64], $previous_label[i].text[6,64],$input_block_chain[i].value ,$input_block_chain_nonce[i].value)
        for j in 0..5
            if(j < i)
            else
                if(i==j)
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                else
                    $previous_label[j].text = 'Prev: ' + $block_chain_value[j-1].digest.to_s
                    $block_chain_value[j].prev = $previous_label[j].text[6,64]
                    $output_block_chain[j].text = "Hash: " + getText($input_block_chain[j].value, $input_block_chain_nonce[j].value, $previous_label[j].text[6,64]);
                end
                $block_chain_value[j] = Block.new($output_block_chain[j].text[6,64], $previous_label[j].text[6,64],$input_block_chain[j].value ,$input_block_chain_nonce[j].value)
            end
        end
        for j in 0..5
            if($output_block_chain[j].text[6,64][0,2] != $difficulty)
                $output_block_chain[j].background = 'red'
                $previous_label[j].background = 'red'
            else
                $output_block_chain[j].background = 'lightgreen'
                $previous_label[j].background = 'lightgreen'
            end
        end
    }
end




$f2.pack_forget()
$f3.pack_forget()
Tk.mainloop

