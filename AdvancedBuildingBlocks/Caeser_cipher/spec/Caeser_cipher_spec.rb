require './Caeser_cipher'

describe "#caeser_cipher" do 
    it 'returns a shifted lowercase string' do
        expect(caeser_cipher("abc", 2).to eql("cde"))
    end
end