-- Table definitions for the tournament project.

--Remove tables from database that exist
DROP VIEW IF EXISTS standing;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS player;

--Creates table that holds player information
CREATE TABLE player (
	playerID SERIAL PRIMARY KEY NOT NULL,
	playerName TEXT NOT NULL
);

--Creates table that holds match information
CREATE TABLE matches (
	matchID SERIAL PRIMARY KEY NOT NULL,
	matchWinner INT REFERENCES player(playerID) NOT NULL,
	matchLoser INT REFERENCES player(playerID) NOT NULL
);

CREATE VIEW standing AS
	SELECT player.playerID, player.playerName, COALESCE(wins.wins,0) AS wins, COALESCE(wins.wins,0)+COALESCE(losses.losses,0) AS matches
	FROM player
	LEFT JOIN (
		SELECT player.playerID AS playerID, COUNT(matches.matchID) AS wins
		FROM player
		JOIN matches
			ON player.playerID=matches.matchWinner
		GROUP BY player.playerID
		) wins
		ON player.playerID=wins.playerID
	LEFT JOIN (
		SELECT player.playerID AS playerID, COUNT(matches.matchID) AS losses
		FROM player
		JOIN matches
			ON player.playerID=matches.matchLoser
		GROUP BY player.playerID
		) losses
		ON player.playerID=losses.playerID
;
	
