create table team (
    team_id int primary key,
    name varchar(20) not null,
    region varchar(20) not null,
    world_titles int default 0
);

create table player (
    player_id int primary key,
    name varchar(25) not null,
    role varchar(20) not null,
    country varchar(30) not null,
    team_id int not null,
    foreign key (team_id) references team (team_id)
);

create table matches (
    match_id int primary key,
    year int not null,
    team1_id int not null,
    team2_id int not null,
    winner_id int not null,
    foreign key (team1_id) references team (team_id),
    foreign key (team2_id) references team (team_id),
    foreign key (winner_id) references team (team_id)
);

create table playerStats (
    stats_id int primary key,
    player_id int not null,
    match_id int not null,
    kda float,
    cs int,
    vision int,
    foreign key (player_id) references player (player_id),
    foreign key (match_id) references matches (match_id)
);
