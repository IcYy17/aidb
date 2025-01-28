INSERT INTO team (team_id, name, region, world_titles) VALUES
(1, 'T1', 'South Korea', 5), -- 3 previous titles + 2023 and 2024
(2, 'DRX', 'South Korea', 1), -- 2022 winner
(3, 'Weibo Gaming', 'China', 0), -- 2023 finalist
(4, 'Bilibili Gaming', 'China', 0); -- 2024 finalist

INSERT INTO player (player_id, name, role, country, team_id) VALUES
-- T1 Players
(1, 'Faker', 'Mid', 'South Korea', 1),
(2, 'Zeus', 'Top', 'South Korea', 1),
(3, 'Oner', 'Jungle', 'South Korea', 1),
(4, 'Gumayusi', 'ADC', 'South Korea', 1),
(5, 'Keria', 'Support', 'South Korea', 1),

-- DRX Players
(6, 'Deft', 'ADC', 'South Korea', 2),
(7, 'Kingen', 'Top', 'South Korea', 2),
(8, 'Pyosik', 'Jungle', 'South Korea', 2),
(9, 'Zeka', 'Mid', 'South Korea', 2),
(10, 'BeryL', 'Support', 'South Korea', 2),

-- Weibo Gaming Players
(11, 'Xiaohu', 'Mid', 'China', 3),
(12, 'TheShy', 'Top', 'China', 3),
(13, 'WeiWei', 'Jungle', 'China', 3),
(14, 'Light', 'ADC', 'China', 3),
(15, 'Crisp', 'Support', 'China', 3),

-- Bilibili Gaming Players
(16, 'Bin', 'Top', 'China', 4),
(17, 'Xun', 'Jungle', 'China', 4),
(18, 'Yagao', 'Mid', 'China', 4),
(19, 'Elk', 'ADC', 'China', 4),
(20, 'ON', 'Support', 'China', 4);

INSERT INTO matches (match_id, year, team1_id, team2_id, winner_id) VALUES
(1, 2024, 1, 4, 1), -- T1 vs. BLG, T1 wins
(2, 2023, 1, 3, 1), -- T1 vs. WBG, T1 wins
(3, 2022, 1, 2, 2); -- T1 vs. DRX, DRX wins

INSERT INTO playerStats (stats_id, player_id, match_id, kda, cs, vision) VALUES
-- 2024 Finals (T1 vs. BLG)
(1, 1, 1, 6.8, 350, 28), -- Faker
(2, 2, 1, 5.7, 310, 20), -- Zeus
(3, 3, 1, 6.0, 320, 22), -- Oner
(4, 4, 1, 8.4, 360, 25), -- Gumayusi
(5, 5, 1, 7.2, 300, 23), -- Keria
(6, 16, 1, 5.5, 330, 24), -- Bin
(7, 17, 1, 6.0, 310, 22), -- Xun
(8, 18, 1, 5.8, 340, 26), -- Yagao
(9, 19, 1, 7.5, 355, 29), -- Elk
(10, 20, 1, 6.3, 300, 21), -- ON

-- 2023 Finals (T1 vs. WBG)
(11, 1, 2, 7.2, 340, 27), -- Faker
(12, 2, 2, 6.5, 320, 25), -- Zeus
(13, 3, 2, 6.7, 330, 24), -- Oner
(14, 4, 2, 8.1, 350, 28), -- Gumayusi
(15, 5, 2, 7.0, 310, 22), -- Keria
(16, 11, 2, 5.8, 330, 24), -- Xiaohu
(17, 12, 2, 6.0, 300, 20), -- TheShy
(18, 13, 2, 5.9, 320, 21), -- WeiWei
(19, 14, 2, 6.7, 340, 26), -- Light
(20, 15, 2, 6.4, 310, 23), -- Crisp

-- 2022 Finals (T1 vs. DRX)
(21, 1, 3, 6.9, 330, 26), -- Faker
(22, 2, 3, 6.0, 310, 23), -- Zeus
(23, 3, 3, 5.8, 320, 24), -- Oner
(24, 4, 3, 7.0, 340, 28), -- Gumayusi
(25, 5, 3, 6.8, 310, 21), -- Keria
(26, 6, 3, 7.7, 350, 29), -- Deft
(27, 7, 3, 6.5, 320, 24), -- Kingen
(28, 8, 3, 6.3, 330, 26), -- Pyosik
(29, 9, 3, 8.5, 360, 30), -- Zeka
(30, 10, 3, 7.1, 300, 22); -- BeryL
