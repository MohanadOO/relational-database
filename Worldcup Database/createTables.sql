CREATE TABLE teams(
  team_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE games(
  game_id SERIAL PRIMARY KEY NOT NULL,
  year INT NOT NULL,
  round VARCHAR(60) NOT NULL,
  winner_id INT NOT NULL,
  opponent_id INT NOT NULL,
  FOREIGN KEY (winner_id) REFERENCES teams(team_id),
  FOREIGN KEY (opponent_id) REFERENCES teams(team_id),
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
);