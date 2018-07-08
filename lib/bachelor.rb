require 'pry'

def get_first_name_of_season_winner(data, season)
winner= " "

  data.each do |season_num, info|
    if season_num == season
      info.each do |contestant|
        if contestant.values.last == "Winner"
          winner = contestant.values.first
        end 
      end 
    end
  end

winner.split.shift
end

def get_contestant_name(data, occupation)
  data.each do |season_num, info|
    info.each do |contestant|
      if contestant.values[3]==occupation
        return contestant.values.first
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
count = 0
  data.each do |season_num, info|
    info.each do |contestant|
     if contestant.values.detect{|h| h==hometown}
        count += 1
      end
    end
  end
  count
end 

def get_occupation(data, hometown)
  data.each do |season_num, info|
    info.each do |contestant|
      if contestant.values.find{|h| h==hometown}
        return contestant.values[3]
      end 
    end
  end
end

def get_average_age_for_season(data, season)
average_array = []

  data.each do |season_num, info|
    if season_num == season
      info.each do |contestant|
        average_array << contestant.values[1].to_i
      end
    end
  end

average = average_array.inject{|x,y| x+y}.to_f / average_array.size
  
average.ceil
end
