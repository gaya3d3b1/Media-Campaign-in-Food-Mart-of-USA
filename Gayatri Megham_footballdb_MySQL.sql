create database if not exists footballdb_1;

use footballdb_1;

select * from games;

select * from appearances;

select * from games_lineups;

select * from game_events;

select * from players;

-- 1. What is the average number of goals scored by teams under different managers? --

SELECT home_club_manager_name, AVG(home_club_goals) AS avg_goals_scored
FROM games
GROUP BY home_club_manager_name;

-- 2. Provide a list of players with the highest number of yellow cards. --

SELECT A.player_name, SUM(A.yellow_cards) AS total_yellow_cards
FROM appearances as A
JOIN games_lineups as GL ON A.player_id = GL.player_id
GROUP BY A.player_name
ORDER BY total_yellow_cards DESC;

-- 3. Can you provide a list of players with a market value higher than a certain threshold? --

SELECT A.player_name, P.market_value_in_eur
FROM appearances A
JOIN players P ON A.player_id = P.player_id
WHERE P.market_value_in_eur > 1000000;

-- 4.Calculate the average attendance for matches played in each stadium. --

SELECT stadium, AVG(attendance) AS avg_attendance
FROM games
GROUP BY stadium;

-- 5. Identify the referee with the highest average red cards per game.--

SELECT G.referee, AVG(A.red_cards) AS avg_red_cards_per_game
FROM games as G
JOIN appearances as A ON G.game_id = A.game_id
GROUP BY G.referee
ORDER BY avg_red_cards_per_game DESC
LIMIT 1;

