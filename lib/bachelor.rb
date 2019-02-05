def get_first_name_of_season_winner(data, season)
  # code here
  data[season].find { |contestant| contestant["status"] == "Winner"}["name"].split(" ")[0]
end

def get_contestant_name(data, occupation)
  data.each { |szn, contestants|
    person = contestants.find { |contestant| contestant["occupation"] == occupation}
    if person
      return person["name"]
    end
  }
end

def count_contestants_by_hometown(data, hometown)
  count = 0;
  data.each { |szn, contestants|
    count += contestants.count { |contestant| contestant["hometown"] == hometown }
  }
  count
end

def get_occupation(data, hometown)
  data.each { |szn, contestants|
    person = contestants.find { |contestant| contestant["hometown"] == hometown }
    if person
      return person["occupation"]
    end
  }
end

def get_average_age_for_season(data, season)
  age_avg = 0;
  data[season].each { |contestant|
    age_avg += contestant["age"].to_f
  }
  (age_avg / data[season].length).round
end
