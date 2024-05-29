require_relative '../lib/player'

describe Player do
    describe '#get_pos' do
        let(:player) { Player.new('white') }

        before do
            # Mock the gets method to simulate user input
            allow(player).to receive(:gets).and_return(input)
        end

        context 'when input is a1' do
            let(:input) { 'a1' }

            it 'returns [7, 0]' do
                expect(player.get_pos).to eq([7, 0])
            end
        end

        context 'when input is e2' do
            let(:input) { 'e2' }

            it 'returns [6, 4]' do
                expect(player.get_pos).to eq([6, 4])
            end
        end

        context 'when input is h8' do
            let(:input) { 'h8' }

            it 'returns [0, 7]' do
                expect(player.get_pos).to eq([0, 7])
            end
        end

        context 'when input is d4' do
            let(:input) { 'd4' }

            it 'returns [4, 3]' do
                expect(player.get_pos).to eq([4, 3])
            end
        end
    end
end
