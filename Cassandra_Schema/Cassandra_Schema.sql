-- CASSANDRA SCHEMA
-- Author : Karthik Chaganti


CREATE KEYSPACE stockportfolio WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};
USE stockportfolio;


-- All the trades that happen every second. From here the users' latest k trades can be extracted onto the dashboard
CREATE TABLE db_trades_stream (userId uuid,
userName text,
tickerName text,
tickerSector text,
tickerPrice float,
tradeQuantity bigint,
total_val double,
tradeTime timestamp,
tradeType text,
PRIMARY KEY(userId,tickerName,tradeTime)) WITH CLUSTERING ORDER BY (tradeTime DESC);


-- User vs Company Portfolio: Contains user id , company stock name, the total no.of. shares and the value along with its sector
-- userid, tickername, quantity, total value, sector
-- 123456, GOOG, 254 shares, 1100, information technology
-- 123456, AAPL, 135 shares, 1256, information technology

CREATE TABLE db_user_portfolio (userId uuid,
tickerName text,
tickerQuant bigint,
tickerValue double,
PRIMARY KEY(userId,tickerName));

-- each user's portfolio counts
CREATE TABLE db_user_portCount (userId uuid,
portfolio_count bigint,
portfolio_value double,
PRIMARY KEY(userId));

-- each user's live trades to be extracted onto the database!
CREATE TABLE  db_trades_live (userId uuid,
userName text,
tickerName text,
tickerSector text,
tickerPrice float,
tradeQuantity bigint,
total_val double,
tradeTime timestamp,
tradeType text,
tradeDate date,
PRIMARY KEY(tradeDate,tradeTime)) WITH CLUSTERING ORDER BY (tradeTime DESC);
