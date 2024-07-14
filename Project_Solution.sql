use loaddatademo;

show tables;
-- Q1. Show how many medal counts present for entire data.

select count(medal) as Medal_Count,Medal from olympics
group by medal;

-- Q2. Show count of unique sports present in Olympics.

Select count(distinct(Sport)) as Count_of_Sports from olympics;

-- Q3. Show how many different medals won by team India.

select Team,Medal,count(Medal) from olympics
where (Team = 'India' and Medal!='NoMedal')
group by medal;

-- Q4. Show event wise medals won by India show from highest to lowest medals won in order.

select Team, count(Medal) as MedalCount,Event from olympics
where (Team = 'India' and Medal<>'NoMedal')
group by Event
order by MedalCount desc;

-- Q5. Show event wise medals won by India in order of year.

Select Team, Count(Medal) as MedalCount,Event,Year from olympics
where (Team = 'India' and Medal<>'NoMedal')
group by event,YEAR
order by Year asc;

-- Q6. show country who won maximum medals.

Select Team,Count(Medal) as MedalCount from olympics
where Medal<>"NoMedal"
Group by Team
order by MedalCount desc
limit 1;

-- Q7.show top 10 countries who won Max Medal.

Select Team,count(Medal) as MedalCount from olympics
where Medal<>"NoMedal"
group by Team
order by MedalCount desc
limit 10;

--  Q8. show in which year did United states won most gold medal.

Select Team,Count(Medal),Year from olympics
where (medal<>"NoMedal" and Team = 'United States')
Group by Year
order by count(Medal) desc
limit 1;

-- Q9. In which sports United States has most medals.

Select Team, Count(Medal) as MedalCount, Sport from olympics
where (Team = 'United States' and Medal<>'NoMedal')
group by Sport
order by MedalCount desc
limit 1;

-- Q10. Find top three players who won most medals along with their sports and country.

Select Name, Team, Sport, count(Medal) from olympics
where Medal<>'NoMedal'
GROUP BY Name,Sport,Team
order by count(Medal) desc
limit 3;

-- Q11.Find Top 7 players with most medals (Gold+Silver+Bronze) in Basketball also show their country.

Select Name,Team,Sport, count(Medal) from olympics
Where sport = 'Basketball' and Medal<>'NoMedal'
Group by Name,Team,Sport
order by count(Medal) desc
limit 7;

-- Q12. Find out the count of different medals of the top basketball player Teresa Edwards.

Select Name, Medal,count(Medal) as MedalCount from olympics
where Name = 'Teresa Edwards' and Medal<>'NoMedal'
group by Medal
order by MedalCount desc;

-- Q13. Find out medals won by male,female each year.

Select Sex,Year,Count(Medal) As MedalCount from olympics
Where medal<>'NoMedal'
Group by Sex,Year
order by Year asc;