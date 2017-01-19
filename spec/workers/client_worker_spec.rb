describe ClientWorker do
  describe 'scheduling' do
    it 'will be scheduled secondly' do
      Timecop.freeze(Time.now.beginning_of_day + 1.second)
      valid, invalid = times

      expect(next_occurrence).to eq(valid)
      expect(next_occurrence).not_to eq(invalid)

      Timecop.freeze(Time.now.beginning_of_day + 6.seconds)

      valid, invalid = times(5.seconds)

      expect(next_occurrence).to eq(valid)
      expect(next_occurrence).not_to eq(invalid)
    end
  end

  def next_occurrence
    ClientWorker.schedule.next_occurrence
  end

  def times(offset = 0.days)
    valid = Time.now.beginning_of_day + 5.seconds + offset
    invalid = valid + 7.seconds

    [valid, invalid]
  end
end
