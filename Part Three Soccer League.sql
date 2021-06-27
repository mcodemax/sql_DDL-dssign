-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/bXAh5Q
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "League" (
    "id" INT   NOT NULL,
    "team" INT   NOT NULL,
    CONSTRAINT "pk_League" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Teams" (
    "id" INT   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" INT   NOT NULL,
    "teamid" INT   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Games" (
    "id" INT   NOT NULL,
    "refereeid" INT   NOT NULL,
    "team1" INT   NOT NULL,
    "team2" INT   NOT NULL,
    "winner" INT   NOT NULL,
    "season" INT   NOT NULL,
    "date" DATE   NOT NULL,
    CONSTRAINT "pk_Games" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" INT   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Seasons" (
    "id" INT   NOT NULL,
    "startdate" DATE   NOT NULL,
    "enddate" DATE   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" INT   NOT NULL,
    "gameid" INT   NOT NULL,
    "playerid" INT   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "League" ADD CONSTRAINT "fk_League_team" FOREIGN KEY("team")
REFERENCES "Teams" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_teamid" FOREIGN KEY("teamid")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_refereeid" FOREIGN KEY("refereeid")
REFERENCES "Referees" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team1" FOREIGN KEY("team1")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team2" FOREIGN KEY("team2")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_winner" FOREIGN KEY("winner")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_season" FOREIGN KEY("season")
REFERENCES "Seasons" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_gameid" FOREIGN KEY("gameid")
REFERENCES "Games" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_playerid" FOREIGN KEY("playerid")
REFERENCES "Players" ("id");

