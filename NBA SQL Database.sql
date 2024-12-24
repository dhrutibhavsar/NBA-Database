-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2024 at 04:11 PM
-- Server version: 8.0.40
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bhav5128`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`bhav5128`@`%` PROCEDURE `GetHighestScoringPlayer` (IN `game_id` INT)   BEGIN
    SELECT 
        ps.PlayerID,
        CONCAT(p.FirstName, ' ', p.LastName) AS PlayerName,
        ps.Points
    FROM 
        `Player Statistics` ps
    JOIN 
        Players p ON ps.PlayerID = p.PlayerID
    WHERE 
        ps.GameID = game_id
    ORDER BY 
        ps.Points DESC
    LIMIT 1;
END$$

--
-- Functions
--
CREATE DEFINER=`bhav5128`@`%` FUNCTION `GetAveragePoints` (`PlayerID` INT) RETURNS FLOAT DETERMINISTIC BEGIN
    DECLARE avgPoints FLOAT;
    
    SELECT AVG(Points)
    INTO avgPoints
    FROM `Player Statistics`
    WHERE PlayerID = PlayerID;
    
    RETURN avgPoints;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Awards`
--

CREATE TABLE `Awards` (
  `PlayerID` int NOT NULL,
  `PlayerName` varchar(50) NOT NULL,
  `AwardName` varchar(50) NOT NULL,
  `YearAwarded` year NOT NULL,
  `Description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Awards`
--

INSERT INTO `Awards` (`PlayerID`, `PlayerName`, `AwardName`, `YearAwarded`, `Description`) VALUES
(1, 'Jayson Tatum', 'All-Star MVP', '2023', 'Representing Team Giannis, Tatum delivered a record-breaking performance, scoring an astonishing 55 points, the highest in All-Star Game history. His electrifying display included 10 rebounds, 6 assists, and a remarkable 10 three-pointers, showcasing his versatility and offensive brilliance. Tatum\'s scoring prowess and captivating playmaking led Team Giannis to victory, solidifying his status as one of the league\'s elite talents and making the 2023 All-Star Game an unforgettable highlight in his career.\r\n'),
(3, 'Jaylen Brown', 'Finals MVP', '2024', 'Jaylen Brown lead the Boston Celtics to their 18th championship. Displaying unmatched determination and two-way brilliance, Brown was the heart and soul of the Celtics\' playoff run. In the Finals, he averaged 28 points, 7 rebounds, and 5 assists per game, delivering clutch performances on both ends of the court. His defensive tenacity and offensive versatility proved pivotal, particularly in crucial moments that turned the series in Boston’s favor. Brown\'s Finals MVP win cemented his legacy as a cornerstone of the Celtics\' storied franchise.\r\n'),
(16, 'Zach Lavine', 'Slam Dunk Contest Champion', '2015', 'Representing the Minnesota Timberwolves as a 19-year-old rookie, LaVine captivated the crowd with his jaw-dropping athleticism and creativity. Paying homage to the Space Jam movie, he donned a Michael Jordan jersey and delivered a series of awe-inspiring dunks, including between-the-legs jams and a dazzling behind-the-back dunk that left judges and fans in awe. LaVine\'s flawless execution and perfect scores secured him the title, solidifying his place as one of the greatest dunkers in NBA history.\r\n\r\n'),
(49, 'Buddy Hield', '3-Point Contest Champion', '2020', 'Representing the Sacramento Kings, Hield delivered a thrilling performance, particularly in the final round. Facing stiff competition from Devin Booker and Davis Bertans, Hield nailed his last shot on the final rack to secure the victory, scoring 27 points and edging Booker by just one point. His clutch display and precision from beyond the arc highlighted why he is regarded as one of the league\'s elite shooters, making the moment a career-defining achievement for the Bahamian sharpshooter.\r\n\r\n'),
(50, 'Andrew Wiggins', 'Rookie of the Year', '2015', 'As the first overall pick in the 2014 NBA Draft, Wiggins lived up to the hype, showcasing his dynamic scoring ability and defensive potential with the Minnesota Timberwolves. Averaging 16.9 points, 4.6 rebounds, and 2.1 assists per game, he led all rookies in scoring and displayed maturity beyond his years. Wiggins\' athleticism, versatility, and consistency set him apart, making him the first Canadian to win the prestigious award and solidifying his place as a cornerstone for the Timberwolves\' future.'),
(51, 'Draymond Green', 'Defensive Player of the Year', '2017', 'As a key figure for the Golden State Warriors, Green\'s versatility was unmatched, as he could guard multiple positions—from point guards to centers—thanks to his speed, intelligence, and physicality. That season, he averaged 2.0 steals, 1.4 blocks, and 7.9 rebounds per game, while anchoring the Warriors’ top-ranked defense. Green\'s leadership, defensive instincts, and ability to disrupt plays were instrumental in Golden State\'s dominant regular-season performance and their eventual championship win, further highlighting his importance to their success.'),
(61, 'Klay Thompson', '3-Point Contest Champion', '2016', 'Known for his quick release and remarkable accuracy, Thompson took down a competitive field, including Stephen Curry and Chris Bosh, with a performance that showcased his elite shooting ability. He set a new contest record by scoring 27 points in the final round, outlasting Curry, his Golden State Warriors teammate, who had been the favorite. Thompson’s victory was a testament to his place among the best shooters in the league, further solidifying his legacy as one of the NBA\'s greatest long-range shooters.'),
(64, 'Chris Paul', 'All-Star MVP', '2013', 'Representing the Western Conference, Paul was instrumental in leading his team to a 143-138 victory over the Eastern Conference. The Los Angeles Clippers point guard finished with 20 points, 15 assists, and 4 steals, displaying his exceptional playmaking and leadership skills. His pinpoint passing, basketball IQ, and ability to control the tempo of the game earned him widespread acclaim, as he orchestrated one of the most entertaining All-Star Games in recent memory. This honor marked the first All-Star MVP of Paul’s career, further cementing his place among the league\'s elite point guards.'),
(64, 'Chris Paul', 'Rookie of the Year', '2006', 'Chris Paul won the NBA Rookie of the Year award after an outstanding debut season with the New Orleans Hornets. Despite being selected as the fourth overall pick in the 2005 draft, Paul quickly established himself as one of the league\'s top point guards. Averaging 16.1 points, 7.8 assists, and 5.1 rebounds per game, Paul impressed with his playmaking, leadership, and defensive ability. His basketball IQ and ability to run the offense from day one set him apart, as he led all rookies in assists and quickly became the face of the Hornets. Paul\'s sensational rookie campaign helped lay the foundation for his future success, and the award marked the beginning of his illustrious NBA career.');

-- --------------------------------------------------------

--
-- Table structure for table `Coaches`
--

CREATE TABLE `Coaches` (
  `CoachID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `TeamName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Coaches`
--

INSERT INTO `Coaches` (`CoachID`, `FirstName`, `LastName`, `TeamName`) VALUES
(100, 'Joe', 'Mazzulla', 'Boston Celtics'),
(101, 'Darko', 'Rajakovic', 'Toronto Raptors'),
(102, 'Billy', 'Donovan', 'Chicago Bulls'),
(103, 'Kenny', 'Atkinson', 'Cleveland Cavaliers'),
(104, 'Charles', 'Lee', 'Charlotte Hornets'),
(105, 'Erik', 'Spoelstra', 'Miami Heat'),
(106, 'Michael', 'Malone', 'Denver Nuggets'),
(107, 'Mark', 'Daigneault', 'Oklahoma City Thunder'),
(108, 'Steve', 'Kerr', 'Golden State Warriors'),
(109, 'Mike', 'Brown', 'Sacramento Kings'),
(110, 'Jason', 'Kidd', 'Dallas Mavericks'),
(111, 'Gregg', 'Popovich', 'San Antonio Spurs');

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE `Games` (
  `GameID` int NOT NULL,
  `GameDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `HomeTeam` varchar(50) NOT NULL,
  `AwayTeam` varchar(50) NOT NULL,
  `HomeScore` int NOT NULL,
  `AwayScore` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`GameID`, `GameDate`, `HomeTeam`, `AwayTeam`, `HomeScore`, `AwayScore`) VALUES
(1, '2024-11-27 12:09:25', 'Charlotte Hornets', 'Boston Celtics', 109, 124),
(2, '2024-11-27 12:19:51', 'Charlotte Hornets', 'Boston Celtics', 103, 113),
(3, '2024-11-27 12:30:18', 'Boston Celtics', 'Toronto Raptors', 126, 123),
(4, '2024-11-27 12:36:59', 'Toronto Raptors', 'Cleveland Cavaliers', 106, 136),
(5, '2024-11-27 12:45:08', 'Toronto Raptors', 'Denver Nuggets', 125, 127);

-- --------------------------------------------------------

--
-- Table structure for table `Players`
--

CREATE TABLE `Players` (
  `PlayerID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Position` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `TeamName` varchar(50) NOT NULL,
  `Height (m)` decimal(10,2) NOT NULL,
  `BirthDate` date NOT NULL,
  `YearDrafted` year DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Players`
--

INSERT INTO `Players` (`PlayerID`, `FirstName`, `LastName`, `Position`, `TeamName`, `Height (m)`, `BirthDate`, `YearDrafted`) VALUES
(1, 'Jayson', 'Tatum', 'F', 'Boston Celtics', 2.03, '1998-03-03', '2017'),
(2, 'Jrue', 'Holiday', 'G', 'Boston Celtics', 1.93, '1990-06-12', '2009'),
(3, 'Jaylen', 'Brown', 'G', 'Boston Celtics', 1.98, '1996-10-24', '2016'),
(4, 'Kristaps', 'Porziņģis', 'F', 'Boston Celtics', 2.18, '1995-08-02', '2015'),
(5, 'Derrick', 'White', 'G', 'Boston Celtics', 1.93, '1994-07-02', '2017'),
(6, 'Al', 'Horford', 'C', 'Boston Celtics', 2.06, '1986-06-03', '2007'),
(7, 'Scottie', 'Barnes', 'F', 'Toronto Raptors', 2.01, '2001-08-01', '2021'),
(8, 'RJ', 'Barrett', 'F', 'Toronto Raptors', 1.98, '2000-06-14', '2019'),
(9, 'Bruce', 'Brown', 'G', 'Toronto Raptors', 1.93, '1996-08-15', '2018'),
(10, 'Jakob', 'Poeltl', 'C', 'Toronto Raptors', 2.13, '1995-10-15', '2016'),
(11, 'Chris', 'Boucher', 'F', 'Toronto Raptors', 2.06, '1993-01-11', NULL),
(12, 'Kelly', 'Olynyk', 'F', 'Toronto Raptors', 2.11, '1991-04-19', '2013'),
(13, 'Coby', 'White', 'G', 'Chicago Bulls', 1.96, '2000-02-16', '2019'),
(14, 'Lonzo', 'Ball', 'G', 'Chicago Bulls', 1.98, '1997-10-27', '2017'),
(15, 'Josh', 'Giddey', 'G', 'Chicago Bulls', 2.03, '2002-10-10', '2021'),
(16, 'Zach', 'Lavine', 'G', 'Chicago Bulls', 1.96, '1995-03-10', '2014'),
(17, 'Nikola', 'Vučević', 'C', 'Chicago Bulls', 2.08, '1990-10-24', '2011'),
(18, 'Caris', 'LeVert', 'G', 'Cleveland Cavaliers', 1.98, '1994-08-25', '2016'),
(19, 'Evan', 'Mobley', 'C', 'Cleveland Cavaliers', 2.11, '2001-06-18', '2021'),
(20, 'Darius', 'Garland', 'G', 'Cleveland Cavaliers', 1.85, '2000-01-26', '2019'),
(21, 'Tristan', 'Thompson', 'C', 'Cleveland Cavaliers', 2.06, '1991-03-13', '2011'),
(22, 'Jarrett', 'Allen', 'C', 'Cleveland Cavaliers', 2.06, '1998-04-21', '2017'),
(23, 'Donovan', 'Mitchell', 'G', 'Cleveland Cavaliers', 1.91, '1996-09-07', '2017'),
(24, 'Craig', 'Porter Jr.', 'G', 'Cleveland Cavaliers', 1.85, '2000-02-26', NULL),
(25, 'Miles', 'Bridges', 'F', 'Charlotte Hornets', 2.01, '1998-03-21', '2018'),
(26, 'LaMelo', 'Ball', 'G', 'Charlotte Hornets', 2.01, '2001-08-22', '2020'),
(27, 'Grant', 'Williams', 'F', 'Charlotte Hornets', 1.98, '1998-11-30', '2019'),
(28, 'Seth', 'Curry', 'G', 'Charlotte Hornets', 1.85, '1990-10-23', NULL),
(29, 'Taj', 'Gibson', 'F', 'Charlotte Hornets', 2.06, '1985-06-24', '2009'),
(30, 'Josh', 'Richardson', 'G', 'Miami Heat', 1.98, '1993-09-15', '2015'),
(31, 'Terry', 'Rozier', 'G', 'Miami Heat', 1.85, '1994-03-17', '2015'),
(32, 'Bam', 'Adebayo', 'C', 'Miami Heat', 2.06, '1997-07-18', '2017'),
(33, 'Tyler', 'Herro', 'G', 'Miami Heat', 1.96, '2000-01-20', '2019'),
(34, 'Jimmy', 'Butler', 'F', 'Miami Heat', 2.01, '1989-09-14', '2011'),
(35, 'Kevin', 'Love', 'F', 'Miami Heat', 2.03, '1988-09-07', '2008'),
(36, 'Duncan', 'Robinson', 'F', 'Miami Heat', 2.01, '1994-04-22', NULL),
(37, 'Michael', 'Porter Jr.', 'F', 'Denver Nuggets', 2.08, '1998-06-29', '2018'),
(38, 'Russell', 'Westbrook', 'G', 'Denver Nuggets', 1.93, '1988-11-12', '2008'),
(39, 'DeAndre', 'Jordan', 'C', 'Denver Nuggets', 2.11, '1988-07-21', '2008'),
(40, 'Dario', 'Šarić', 'F', 'Denver Nuggets', 2.08, '1994-04-08', '2014'),
(41, 'Nikola', 'Jokić', 'C', 'Denver Nuggets', 2.11, '1995-02-19', '2014'),
(42, 'Jamal', 'Murray', 'G', 'Denver Nuggets', 1.93, '1997-02-23', '2016'),
(43, 'Aaron', 'Gordon', 'F', 'Denver Nuggets', 2.03, '1995-09-16', '2014'),
(44, 'Shai', 'Gilgeous-Alexander', 'G', 'Oklahoma City Thunder', 1.98, '1998-07-12', '2018'),
(45, 'Luguentz', 'Dort', 'G', 'Oklahoma City Thunder', 1.93, '1999-04-19', NULL),
(46, 'Alex', 'Caruso', 'G', 'Oklahoma City Thunder', 1.96, '1994-02-28', NULL),
(47, 'Kyle', 'Anderson', 'F', 'Golden State Warriors', 2.06, '1993-09-20', '2014'),
(48, 'Kevon', 'Looney', 'F', 'Golden State Warriors', 2.06, '1996-02-06', '2015'),
(49, 'Buddy', 'Hield', 'G', 'Golden State Warriors', 1.93, '1992-12-17', '2016'),
(50, 'Andrew', 'Wiggins', 'F', 'Golden State Warriors', 2.01, '1995-02-23', '2014'),
(51, 'Draymond', 'Green', 'F', 'Golden State Warriors', 1.98, '1990-03-04', '2012'),
(52, 'Stephen', 'Curry', 'G', 'Golden State Warriors', 1.88, '1988-03-14', '2009'),
(53, 'De\'Aaron', 'Fox', 'G', 'Sacramento Kings', 1.91, '1997-12-20', '2017'),
(54, 'Malik', 'Monk', 'G', 'Sacramento Kings', 1.90, '1998-02-04', '2017'),
(55, 'DeMar', 'DeRozan', 'G', 'Sacramento Kings', 1.98, '1989-08-07', '2009'),
(56, 'Domantas', 'Sabonis', 'F', 'Sacramento Kings', 2.08, '1996-03-03', '2016'),
(57, 'Keegan', 'Murray', 'F', 'Sacramento Kings', 2.03, '2000-08-19', '2022'),
(58, 'Brandon', 'Williams', 'G', 'Dallas Mavericks', 1.85, '1999-11-22', NULL),
(59, 'Kyrie', 'Irving', 'G', 'Dallas Mavericks', 1.88, '1992-03-23', '2011'),
(60, 'Spencer', 'Dinwiddie', 'G', 'Dallas Mavericks', 1.96, '1993-04-06', '2014'),
(61, 'Klay', 'Thompson', 'G', 'Dallas Mavericks', 1.96, '1990-02-08', '2011'),
(62, 'Luka', 'Dončić', 'F', 'Dallas Mavericks', 1.98, '1999-02-28', '2018'),
(63, 'Markieff', 'Morris', 'F', 'Dallas Mavericks', 2.06, '1989-09-02', '2011'),
(64, 'Chris', 'Paul', 'G', 'San Antonio Spurs', 1.83, '1985-05-06', '2005'),
(65, 'Harrison', 'Barnes', 'F', 'San Antonio Spurs', 2.03, '1992-05-30', '2012'),
(66, 'David', 'Duke Jr.', 'G', 'San Antonio Spurs', 1.93, '1999-10-13', NULL),
(67, 'Tre', 'Jones', 'G', 'San Antonio Spurs', 1.85, '2000-01-08', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `Player Statistics`
--

CREATE TABLE `Player Statistics` (
  `PlayerID` int NOT NULL,
  `Player Name` varchar(50) NOT NULL,
  `GameID` int NOT NULL,
  `Points` int NOT NULL,
  `Rebounds` int NOT NULL,
  `Assists` int NOT NULL,
  `Steals` int NOT NULL,
  `Blocks` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Player Statistics`
--

INSERT INTO `Player Statistics` (`PlayerID`, `Player Name`, `GameID`, `Points`, `Rebounds`, `Assists`, `Steals`, `Blocks`) VALUES
(1, 'Jayson Tatum', 1, 32, 11, 3, 3, 1),
(1, 'Jayson Tatum', 2, 29, 7, 3, 0, 0),
(1, 'Jayson Tatum', 3, 24, 11, 9, 0, 0),
(2, 'Jrue Holiday', 1, 14, 5, 1, 1, 0),
(2, 'Jrue Holiday', 2, 13, 5, 6, 0, 0),
(3, 'Jaylen Brown', 1, 25, 6, 5, 1, 1),
(3, 'Jaylen Brown', 3, 27, 6, 7, 0, 1),
(5, 'Derrick White', 1, 17, 2, 5, 1, 1),
(5, 'Derrick White', 2, 18, 8, 2, 1, 2),
(5, 'Derrick White', 3, 18, 5, 4, 0, 2),
(6, 'Al Horford', 2, 0, 6, 5, 1, 0),
(6, 'Al Horford', 3, 18, 4, 2, 1, 1),
(7, 'Scottie Barnes', 4, 9, 6, 5, 0, 0),
(7, 'Scottie Barnes', 5, 21, 12, 9, 5, 1),
(8, 'RJ Barrett', 3, 25, 10, 15, 1, 1),
(8, 'RJ Barrett', 5, 20, 5, 3, 0, 0),
(10, 'Jakob Poeltl', 3, 35, 12, 0, 1, 0),
(10, 'Jakob Poeltl', 4, 6, 9, 2, 0, 0),
(10, 'Jakob Poeltl', 5, 16, 19, 2, 0, 1),
(11, 'Chris Boucher', 3, 15, 5, 0, 0, 0),
(11, 'Chris Boucher', 4, 18, 2, 1, 1, 1),
(11, 'Chris Boucher', 5, 4, 3, 0, 0, 1),
(18, 'Caris LeVert', 4, 19, 1, 4, 0, 0),
(19, 'Evan Mobley', 4, 25, 9, 3, 2, 3),
(20, 'Darius Garland', 4, 7, 1, 6, 0, 0),
(21, 'Tristan Thompson', 4, 2, 1, 0, 0, 0),
(22, 'Jarrett Allen', 4, 14, 7, 1, 1, 4),
(23, 'Donovan Mitchell', 4, 21, 2, 3, 3, 1),
(24, 'Craig Porter Jr.', 4, 4, 0, 1, 0, 0),
(25, 'Miles Bridges', 1, 14, 7, 3, 1, 0),
(25, 'Miles Bridges', 2, 6, 8, 5, 2, 0),
(26, 'LaMelo Ball', 1, 31, 2, 4, 1, 0),
(26, 'LaMelo Ball', 2, 36, 4, 6, 3, 0),
(27, 'Grant Williams', 1, 6, 7, 3, 1, 1),
(27, 'Grant Williams', 2, 5, 3, 2, 0, 0),
(28, 'Seth Curry', 1, 8, 2, 0, 1, 0),
(29, 'Taj Gibson', 2, 2, 4, 0, 0, 0),
(37, 'Michael Porter Jr.', 5, 13, 9, 2, 0, 1),
(38, 'Russell Westbrook', 5, 9, 4, 3, 1, 0),
(40, 'Dario Šarić', 5, 0, 1, 1, 0, 0),
(41, 'Nikola Jokić', 5, 40, 10, 4, 1, 2),
(42, 'Jamal Murray', 5, 17, 9, 7, 1, 0),
(43, 'Aaron Gordon', 5, 16, 11, 8, 2, 1);

--
-- Triggers `Player Statistics`
--
DELIMITER $$
CREATE TRIGGER `CheckNonNegativeStats` BEFORE INSERT ON `Player Statistics` FOR EACH ROW BEGIN
    IF NEW.Points < 0 OR NEW.Rebounds < 0 OR NEW.Assists < 0 OR NEW.Steals < 0 OR NEW.Blocks < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Values for Points, Rebounds, Assists, Steals, and Blocks must be non-negative.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Teams`
--

CREATE TABLE `Teams` (
  `TeamName` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Conference` char(10) NOT NULL,
  `YearFounded` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Teams`
--

INSERT INTO `Teams` (`TeamName`, `City`, `Conference`, `YearFounded`) VALUES
('Boston Celtics', 'Boston', 'East', '1946'),
('Charlotte Hornets', 'Charlotte', 'East', '1988'),
('Chicago Bulls', 'Chicago', 'East', '1966'),
('Cleveland Cavaliers', 'Cleveland', 'East', '1970'),
('Dallas Mavericks', 'Dallas', 'West', '1980'),
('Denver Nuggets', 'Denver', 'West', '1967'),
('Golden State Warriors', 'San Francisco', 'West', '1946'),
('Miami Heat', 'Miami', 'East', '1988'),
('Oklahoma City Thunder', 'Oklahoma City', 'West', '2008'),
('Sacramento Kings', 'Sacramento', 'West', '1945'),
('San Antonio Spurs', 'San Antonio', 'West', '1967'),
('Toronto Raptors', 'Toronto', 'East', '1995');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vPlayerGameStats`
-- (See below for the actual view)
--
CREATE TABLE `vPlayerGameStats` (
`PlayerID` int
,`FirstName` varchar(50)
,`LastName` varchar(50)
,`GameID` int
,`HomeTeam` varchar(50)
,`TeamCity` varchar(50)
,`TeamConference` char(10)
,`Points` int
,`Rebounds` int
,`Assists` int
,`Steals` int
,`Blocks` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vPlayerStats`
-- (See below for the actual view)
--
CREATE TABLE `vPlayerStats` (
`PlayerID` int
,`FirstName` varchar(50)
,`GameID` int
,`Points` int
,`Rebounds` int
,`Assists` int
,`Steals` int
,`Blocks` int
);

-- --------------------------------------------------------

--
-- Structure for view `vPlayerGameStats`
--
DROP TABLE IF EXISTS `vPlayerGameStats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`bhav5128`@`%` SQL SECURITY DEFINER VIEW `vPlayerGameStats`  AS SELECT `ps`.`PlayerID` AS `PlayerID`, `p`.`FirstName` AS `FirstName`, `p`.`LastName` AS `LastName`, `ps`.`GameID` AS `GameID`, `g`.`HomeTeam` AS `HomeTeam`, `t`.`City` AS `TeamCity`, `t`.`Conference` AS `TeamConference`, `ps`.`Points` AS `Points`, `ps`.`Rebounds` AS `Rebounds`, `ps`.`Assists` AS `Assists`, `ps`.`Steals` AS `Steals`, `ps`.`Blocks` AS `Blocks` FROM (((`Player Statistics` `ps` join `Players` `p` on((`ps`.`PlayerID` = `p`.`PlayerID`))) join `Games` `g` on((`ps`.`GameID` = `g`.`GameID`))) join `Teams` `t` on((`g`.`HomeTeam` = `t`.`TeamName`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vPlayerStats`
--
DROP TABLE IF EXISTS `vPlayerStats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`bhav5128`@`%` SQL SECURITY DEFINER VIEW `vPlayerStats`  AS SELECT `Player Statistics`.`PlayerID` AS `PlayerID`, `Players`.`FirstName` AS `FirstName`, `Player Statistics`.`GameID` AS `GameID`, `Player Statistics`.`Points` AS `Points`, `Player Statistics`.`Rebounds` AS `Rebounds`, `Player Statistics`.`Assists` AS `Assists`, `Player Statistics`.`Steals` AS `Steals`, `Player Statistics`.`Blocks` AS `Blocks` FROM (`Player Statistics` join `Players` on((`Player Statistics`.`PlayerID` = `Players`.`PlayerID`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Awards`
--
ALTER TABLE `Awards`
  ADD PRIMARY KEY (`PlayerID`,`AwardName`);

--
-- Indexes for table `Coaches`
--
ALTER TABLE `Coaches`
  ADD PRIMARY KEY (`CoachID`),
  ADD KEY `TeamName` (`TeamName`);

--
-- Indexes for table `Games`
--
ALTER TABLE `Games`
  ADD PRIMARY KEY (`GameID`),
  ADD KEY `HomeTeam` (`HomeTeam`),
  ADD KEY `AwayTeam` (`AwayTeam`);

--
-- Indexes for table `Players`
--
ALTER TABLE `Players`
  ADD PRIMARY KEY (`PlayerID`),
  ADD UNIQUE KEY `Unique_PlayerName` (`FirstName`,`LastName`),
  ADD KEY `TeamName` (`TeamName`);

--
-- Indexes for table `Player Statistics`
--
ALTER TABLE `Player Statistics`
  ADD PRIMARY KEY (`PlayerID`,`GameID`),
  ADD KEY `GameID` (`GameID`);

--
-- Indexes for table `Teams`
--
ALTER TABLE `Teams`
  ADD PRIMARY KEY (`TeamName`),
  ADD KEY `Index_city` (`City`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Games`
--
ALTER TABLE `Games`
  MODIFY `GameID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Players`
--
ALTER TABLE `Players`
  MODIFY `PlayerID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Awards`
--
ALTER TABLE `Awards`
  ADD CONSTRAINT `Awards_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `Players` (`PlayerID`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `Coaches`
--
ALTER TABLE `Coaches`
  ADD CONSTRAINT `Coaches_ibfk_1` FOREIGN KEY (`TeamName`) REFERENCES `Teams` (`TeamName`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Games`
--
ALTER TABLE `Games`
  ADD CONSTRAINT `Games_ibfk_1` FOREIGN KEY (`HomeTeam`) REFERENCES `Teams` (`TeamName`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `Games_ibfk_2` FOREIGN KEY (`AwayTeam`) REFERENCES `Teams` (`TeamName`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `Players`
--
ALTER TABLE `Players`
  ADD CONSTRAINT `Players_ibfk_1` FOREIGN KEY (`TeamName`) REFERENCES `Teams` (`TeamName`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Player Statistics`
--
ALTER TABLE `Player Statistics`
  ADD CONSTRAINT `Player Statistics_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `Players` (`PlayerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Player Statistics_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `Games` (`GameID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
