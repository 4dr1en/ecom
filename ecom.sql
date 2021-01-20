-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 20 jan. 2021 à 09:37
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ecom`
--
CREATE DATABASE IF NOT EXISTS `ecom` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `ecom`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Fiction'),
(2, 'Comedy'),
(3, 'Romance'),
(4, 'Youth'),
(5, 'Adult'),
(6, 'Historical');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`) VALUES
(1, 'adrien', 'charrier', 'adrien.charrier@orange.fr', '$argon2id$v=19$m=65536,t=4,p=1$dW5ORFdhNEg5NnRISnJZSw$xuXHvH9W5R1kpfoFa8Zjfbrv42yHGeKSI8niRTqmfK8', '0477294453'),
(2, 'adrien', 'charrier', 'adrien.charrier@orange.fr', '$argon2id$v=19$m=65536,t=4,p=1$RElnbi5YNVVwcjRvVkVOeQ$hnXqw8dAKt5EtXtgcW8XzmLh1cAlUjHoR6MCUSzQg8A', '0602713633'),
(3, 'admin', 'michel', 'ar7awn@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$QXdJYTVJam15d1hZTVBYaw$1TIMvIWeliW1ddOtKk+dk7SY7PaRSl3qZdVZJU+18ow', '1234567890');

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_client` int(11) UNSIGNED NOT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `dateCommand` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`id`, `id_client`, `paid`, `dateCommand`) VALUES
(34, 1, 1, '2021-01-18 15:35:22'),
(35, 1, 1, '2021-01-18 15:37:02'),
(36, 1, 1, '2021-01-19 15:59:19'),
(37, 2, 0, NULL),
(38, 4, 0, NULL),
(39, 1, 1, '2021-01-19 18:43:45'),
(40, 1, 1, '2021-01-20 00:48:30'),
(41, 1, 1, '2021-01-20 09:20:33'),
(42, 1, 1, '2021-01-20 10:01:06'),
(43, 1, 1, '2021-01-20 10:15:13'),
(44, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `command_item_smapshot`
--

DROP TABLE IF EXISTS `command_item_smapshot`;
CREATE TABLE IF NOT EXISTS `command_item_smapshot` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_command` int(11) UNSIGNED NOT NULL,
  `name_item` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_command` (`id_command`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `command_item_smapshot`
--

INSERT INTO `command_item_smapshot` (`id`, `id_command`, `name_item`, `price`, `category`, `quantity`) VALUES
(22, 34, 'Harry Potter: Complete 8-Film Collection', 39.99, 'Fiction', 1),
(23, 34, 'Blade Runner 2049', 24.99, 'Fiction', 1),
(24, 35, 'Harry Potter: Complete 8-Film Collection', 39.99, 'Fiction', 1),
(25, 36, 'The crown', 30.78, 'Historical', 4),
(26, 36, 'Harry Potter: Complete 8-Film Collection', 39.99, 'Fiction', 1),
(27, 36, 'Ted & Ted 2', 12.71, 'Comedy', 1),
(28, 39, 'Frozen', 15.63, 'Youth', 1),
(29, 40, 'The crown', 30.78, 'Historical', 1),
(30, 40, 'Harry Potter: Complete 8-Film Collection', 39.99, 'Fiction', 5),
(31, 40, 'Frozen', 15.63, 'Youth', 2),
(32, 40, 'Rover, The', 12.92, 'Youth', 6),
(33, 41, 'Harry Potter: Complete 8-Film Collection', 39.99, 'Fiction', 2),
(34, 41, 'Ted & Ted 2', 12.71, 'Comedy', 4),
(35, 42, 'Harry Potter: Complete 8-Film Collection', 39.99, 'Fiction', 1),
(36, 43, 'Harry Potter: Complete 8-Film Collection', 39.99, 'Fiction', 2);

-- --------------------------------------------------------

--
-- Structure de la table `content_command`
--

DROP TABLE IF EXISTS `content_command`;
CREATE TABLE IF NOT EXISTS `content_command` (
  `id_command` int(11) UNSIGNED NOT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_command`,`id_item`),
  KEY `id_item` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `content_command`
--

INSERT INTO `content_command` (`id_command`, `id_item`, `quantity`) VALUES
(34, 54, 1),
(34, 61, 1),
(35, 54, 1),
(36, 51, 4),
(36, 54, 1),
(36, 62, 1),
(37, 54, 1),
(39, 67, 1),
(40, 51, 1),
(40, 54, 5),
(40, 67, 2),
(40, 74, 6),
(41, 54, 2),
(41, 62, 4),
(42, 54, 1),
(43, 54, 2);

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `id_category` int(11) UNSIGNED DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `name`, `description`, `image`, `id_category`, `price`) VALUES
(51, 'The crown', 'The British Empire is in decline, the political world is in disarray, and a young woman takes the throne... a new era is dawning. Queen Elizabeth II is a 25-year-old newlywed faced with the daunting prospect of leading the world’s most famous monarchy while forging a relationship with legendary Prime Minister Sir Winston Churchill. Golden Globe winner for Best TV Drama Series, “The Crown,” created by Peter Morgan, explores the Queen’s private journey behind the public facade with daring frankness. ', '/public/img/products/the_crown.jpg', 6, 30.78),
(52, 'Victoria', 'Created by Daisy Goodwin, this ambitious drama presents the early years of one of history\'s greatest monarchs. Stretching from the upper echelons of the royal court to the below-stairs staff, this is a story of passionate affairs, power struggles, and unrequited love, at the center of which stands the new Queen (Jenna Coleman) a strong, complex, and willful woman who must, somehow, become an enduring icon. ', '/public/img/products/victoria.jpg', 6, 15.33),
(53, 'Bonaparte: The Egyptian Campaign', 'Spring of 1798: Napoleon sets out with 38,000 men and 10,000 sailors to conquer Egypt. He also brought along 167 men of science and arts to start a scientific mission to explore the land. It is the beginning of a scholarly encounter between the West and the Muslim world.', '/public/img/products/the_Egyptian_Campaign.jpg', 6, 7.78),
(54, 'Harry Potter: Complete 8-Film Collection', 'When Harry Potter learns on his eleventh birthday that he is, in fact, a wizard, he is quickly swept up into the spellbinding world of Hogwarts School of Witchcraft and Wizardry alongside new best friends, Ron Weasley and Hermione Granger. He soon discovers, though, that there is a much darker side to the wizarding world than any of them could have imagined. ', '/public/img/products/Harry_Potter.jpg', 1, 39.99),
(55, 'Tenet', 'Fighting for the survival of the entire world, the Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.', '/public/img/products/tenet.jpg', 1, 24.49),
(56, 'Man of Steel', 'A young boy learns that he has extraordinary powers and is not of this Earth. As a young man, he journeys to discover where he came from and what he was sent here to do. But the hero in him must emerge if he is to save the world from annihilation and become the symbol of hope for all mankind. ', '/public/img/products/Man_of_Steel.jpg', 1, 7.99),
(57, 'Interstellar', 'From director Christopher Nolan (Inception) comes the story of ex-pilot Cooper (Matthew McConaughey), who must leave his family and Earth behind to lead an expedition beyond this galaxy to discover whether mankind has a future among the stars.', '/public/img/products/interstellar.jpg', 1, 14.98),
(58, 'Wonder Woman', 'Before she was Wonder Woman, she was Diana, princess of the Amazons, trained to be an unconquerable warrior. Raised on a sheltered island paradise, when an American pilot crashes on their shores and tells of a massive conflict raging in the outside world, Diana leaves her home, convinced she can stop the threat. Fighting alongside man in a war to end all wars, Diana will discover her full powers…and her true destiny.', '/public/img/products/Wonder_Woman.jpg', 1, 12.65),
(59, 'Aquaman', 'An action-packed adventure that spans the vast, visually breathtaking underwater world of the seven seas, \'Aquaman\' reveals the origin story of half-human, half-Atlantean Arthur Curry and takes him on the journey of his lifetime - one that will not only force him to face who he really is, but to discover if he is worthy of who he was born to be…a king. ', '/public/img/products/Aquaman.jpg', 1, 9.99),
(60, 'Ready Player One', 'From filmmaker Steven Spielberg comes the science fiction action adventure “Ready Player One,” based on Ernest Cline’s estseller of the same name. The film is set in 2045, with the world on the brink of chaos and collapse. But the people have found salvation in the OASIS, an expansive virtual reality universe created by the brilliant and eccentric James Halliday (Mark Rylance). When Halliday dies, he leaves his immense fortune to the first person to find a digital Easter egg he has hidden somewhere in the OASIS, sparking a contest that grips the entire world. When an unlikely young hero named Wade Watts (Tye Sheridan) decides to join the contest, he is hurled into a reakneck, realitybending treasure hunt through a fantastical universe of mystery, discovery and danger', '/public/img/products/Ready_Player_One.jpg', 1, 9.99),
(61, 'Blade Runner 2049', 'Three decades after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what’s left of society into chaos. K’s discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years. ', '/public/img/products/Blade_Runner_2049.jpg', 1, 24.99),
(62, 'Ted & Ted 2', 'Ted Family Guy creator She MacFarlane delivers his signature boundary-pushing humor in the outrageous comedy-blockbuster critics are calling \"hysterically funny!\" (Peter Travers, Rolling Stone). John Bennett (Mark Wahlberg) is a grown man whose cherished teddy bear came to life as the result of a childhood wish…and hasn\'t left his side since. Can John\'s relationship with longtime girlfriend Lori (Mila Kunis), move forward with his lovably profane buddy in the picture? Ted 2 Everyone\'s favorite foulmouthed teddy bear is back for a second round of hilarious antics and outrageous adventures. When Ted (voiced by Family Guy creator Seth MacFarlane) is declare property by the Commonwealth of Massachusetts, Ted and his best friend John (Mark Wahlberg, Transformers: Age of Extinction, The Other Guys) must go to court to fight for Ted\'s personhood. With the help of their smart, beautiful, (and pot-loving) lawyer (Amanda Seyfried, Mamma Mia!, Les Misérables), the thunder buddies for life battle to legalize Ted in this \"wickedly funny\" (Los Angeles Times) sequel that will keep fans laughing right up to the very end.', '/public/img/products/Ted_&_Ted_2.jpg', 2, 12.71),
(63, 'This is the End', 'The comedy This Is The End follows six friends trapped in a house after a series of strange and catastrophic events devastate Los Angeles. As the world unravels outside, dwindling supplies and cabin fever threaten to tear apart the friendships inside. Eventually, they are forced to leave the house, facing their fate and the true meaning of friendship and redemption. ', '/public/img/products/This_is_the_End.jpg', 2, 6.99),
(64, 'The Wolf of Wall Street', 'Sex. Money. Power. Drugs. Brace yourself for an outrageous true story from legendary filmmaker Martin Scorsese. Leonardo DiCaprio stars as a young stockbroker hungry for a life of non-stop thrills, where corruption was king and more was never enough. ', '/public/img/products/Wolf_of_Wall_Street.jpg', 2, 4.99),
(65, 'The Night Before', 'Ethan (Joseph Gordon-Levitt), Isaac (Seth Rogen), and Chris (Anthony Mackie) have been friends since childhood, and for a decade their yearly Christmas Eve reunion has been an annual night of debauchery and hilarity. Now that they’re entering adulthood the tradition is coming to an end, and to make it as memorable as possible, they set out to find the Nutcracka Ball – the Holy Grail of Christmas parties.', '/public/img/products/Night_Before.jpg', 2, 8.01),
(66, 'Titanic', 'See Titanic as you have never seen it before. Leonardo DiCaprio and Kate Winslet shine in the timeless love story born of tragedy that created an international phenomenon as memorable as the legendary \'ship of dreams\'. Winner of 11 Academy Awards, including Best Picture, this epic masterpiece is destined to sweep audiences anew into the journey of a lifetime. ', '/public/img/products/titanic.jpg', 3, 9.96),
(67, 'Frozen', 'Princess Anna, Mountain Man Kristoff and Olaf the Snowman set out to save Princess Elsa and the magical land of Arendelle in this blockbuster musical treat. Oscar winner for Best Animated Feature.', '/public/img/products/frozen.jpg', 4, 15.63),
(68, 'Jungle Fever', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'http://dummyimage.com/237x293.jpg/5fa2dd/ffffff', 6, 10.39),
(69, 'Muppet Christmas Carol, The', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/237x296.jpg/cc0000/ffffff', 5, 11.86),
(70, 'Reef, The', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/247x210.jpg/dddddd/000000', 5, 14.14),
(71, 'Night Stalker, The', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'http://dummyimage.com/243x296.jpg/dddddd/000000', 3, 10.36),
(72, 'Everybody Wants to Be Italian', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/235x294.jpg/5fa2dd/ffffff', 2, 9.39),
(73, 'Reaching for the Moon', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/243x214.jpg/5fa2dd/ffffff', 4, 14.21),
(74, 'Rover, The', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/224x250.jpg/cc0000/ffffff', 4, 12.92),
(75, 'Will Success Spoil Rock Hunter?', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/222x201.jpg/dddddd/000000', 4, 5.76),
(76, 'Road Hard', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/241x244.jpg/dddddd/000000', 6, 11.31),
(77, 'Double Solitaire', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/247x206.jpg/5fa2dd/ffffff', 3, 6.47),
(78, 'Paradise Lost 2: Revelations', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/226x284.jpg/cc0000/ffffff', 6, 6.04),
(79, 'Exiled (Fong juk)', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/224x282.jpg/ff4444/ffffff', 3, 9.57),
(80, 'All at Sea', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/213x284.jpg/dddddd/000000', 3, 6.64),
(81, 'Palindromes', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/203x210.jpg/cc0000/ffffff', 6, 7.55),
(82, 'Family Tree (L\'arbre et la forêt)', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/211x241.jpg/dddddd/000000', 3, 5.09),
(83, 'Immaculate Conception of Little Dizzle', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/201x274.jpg/cc0000/ffffff', 2, 12.82),
(84, 'Vibrator', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/235x256.jpg/dddddd/000000', 4, 7.3),
(85, 'Confiance règne, La', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/218x224.jpg/cc0000/ffffff', 1, 13.66),
(86, 'Machete Maidens Unleashed!', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/221x203.jpg/dddddd/000000', 3, 9.64),
(87, 'Oslo, August 31st (Oslo, 31. august)', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/246x235.jpg/dddddd/000000', 2, 14.75),
(88, 'Stars in Shorts', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/241x219.jpg/ff4444/ffffff', 5, 11.06),
(89, 'Seventh Continent, The (Der siebente Kontinen', 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/226x262.jpg/dddddd/000000', 3, 9.42),
(90, 'Corporation, The', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/231x254.jpg/cc0000/ffffff', 3, 5.37),
(91, 'Waltzes from Vienna', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/244x284.jpg/cc0000/ffffff', 6, 13.94),
(92, 'Big Hangover, The', 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'http://dummyimage.com/245x262.jpg/dddddd/000000', 2, 12.46),
(93, 'Deadly Trap, The (La maison sous les arbres)', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/245x257.jpg/cc0000/ffffff', 2, 8.31),
(94, 'Devil\'s Pond', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/234x245.jpg/cc0000/ffffff', 3, 9.6),
(95, 'Butcher Boy, The', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/230x274.jpg/dddddd/000000', 2, 10.48),
(96, 'Wanted', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/247x229.jpg/cc0000/ffffff', 2, 12.76),
(97, 'When Animals Dream (Når dyrene drømmer)', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/249x245.jpg/ff4444/ffffff', 2, 13.73),
(98, 'I Hate Christian Laettner', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/217x278.jpg/cc0000/ffffff', 4, 6.82),
(99, 'Knucklehead', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://dummyimage.com/212x285.jpg/dddddd/000000', 3, 8.05),
(100, 'Happy New Year (La Bonne Année)', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/244x286.jpg/dddddd/000000', 1, 14.63),
(101, 'Junior', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/235x217.jpg/dddddd/000000', 6, 6.89),
(102, 'Los Bandoleros', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/245x278.jpg/5fa2dd/ffffff', 1, 10.4),
(103, 'Kingdom of Shadows', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/218x256.jpg/5fa2dd/ffffff', 4, 13.89),
(104, 'Girl Next Door, The', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/207x207.jpg/dddddd/000000', 6, 6.02),
(105, 'Latin Music USA', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/240x229.jpg/dddddd/000000', 2, 12.02),
(106, 'Story of Me, The (O contador de histórias)', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/243x234.jpg/ff4444/ffffff', 1, 13.52),
(107, 'Loft (Rofuto)', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/246x213.jpg/dddddd/000000', 4, 7.72),
(108, 'Man Who Could Work Miracles, The', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\n\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/243x264.jpg/cc0000/ffffff', 1, 8.75),
(109, 'Henry: Portrait of a Serial Killer', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'http://dummyimage.com/230x236.jpg/5fa2dd/ffffff', 1, 13.48),
(110, 'Vessel of Wrath', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'http://dummyimage.com/229x233.jpg/5fa2dd/ffffff', 4, 6.69),
(111, 'Kickboxer 3: The Art of War (Kickboxer III: T', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/235x255.jpg/dddddd/000000', 1, 11.93),
(112, 'Competition, The', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/214x215.jpg/dddddd/000000', 4, 12.55),
(113, 'Auto Focus', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/234x265.jpg/5fa2dd/ffffff', 1, 8.69),
(114, 'Yesterday Was a Lie', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/228x247.jpg/5fa2dd/ffffff', 1, 11.4),
(115, 'Yumeji', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/207x253.jpg/5fa2dd/ffffff', 1, 6.24),
(116, 'Officer Down', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'http://dummyimage.com/208x289.jpg/cc0000/ffffff', 4, 5.14),
(117, 'Trust Me', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/204x216.jpg/cc0000/ffffff', 5, 12.55),
(118, 'Life, Above All', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'http://dummyimage.com/220x276.jpg/5fa2dd/ffffff', 5, 11.68),
(119, 'Midnight (Primeiro Dia, O)', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/247x294.jpg/cc0000/ffffff', 6, 14.1),
(120, 'The Heavy', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/239x238.jpg/5fa2dd/ffffff', 6, 5.67),
(121, 'Day The Earth Froze, The (Sampo)', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/201x282.jpg/ff4444/ffffff', 4, 12.57),
(122, 'Bionicle: The Legend Reborn', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/211x283.jpg/cc0000/ffffff', 5, 14.9),
(123, 'Our Daily Bread', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/210x294.jpg/dddddd/000000', 3, 9.45),
(124, 'Head in the Clouds', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.\n\nDuis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/202x287.jpg/ff4444/ffffff', 6, 5.54),
(125, 'Husk', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/231x286.jpg/dddddd/000000', 1, 7.48),
(126, 'I Want Candy', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/201x291.jpg/dddddd/000000', 4, 12.2),
(127, 'Big, Large and Verdone', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'http://dummyimage.com/241x234.jpg/ff4444/ffffff', 6, 7.52),
(128, 'Parked', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/243x263.jpg/dddddd/000000', 1, 12.53),
(129, 'Kill Your Darlings', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.\n\nCurabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/231x300.jpg/cc0000/ffffff', 6, 9.69),
(130, 'Claire of the Moon', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/235x296.jpg/5fa2dd/ffffff', 2, 11.6),
(131, 'Workingman\'s Death', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/247x265.jpg/cc0000/ffffff', 1, 9.73),
(132, 'Bridge to the Sun', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/208x203.jpg/cc0000/ffffff', 6, 12.2),
(133, 'My Life and Times With Antonin Artaud (En com', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/238x283.jpg/cc0000/ffffff', 4, 8.63),
(134, 'Love Letter ', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/224x269.jpg/ff4444/ffffff', 5, 9.14),
(135, 'Zero Day', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/235x214.jpg/ff4444/ffffff', 3, 5.35),
(136, 'Alice in Wonderland', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/203x203.jpg/dddddd/000000', 4, 14.36),
(137, 'Transporter 2', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/239x252.jpg/ff4444/ffffff', 3, 11.85),
(138, 'Bless the Beasts & Children', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/237x200.jpg/dddddd/000000', 5, 14.47),
(139, 'Bringing Up Bobby', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/220x214.jpg/dddddd/000000', 2, 8.41),
(140, '13 Assassins (Jûsan-nin no shikaku)', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.\n\nPhasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'http://dummyimage.com/204x289.jpg/cc0000/ffffff', 6, 9.22),
(141, 'And So It Is', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/233x209.jpg/dddddd/000000', 2, 10.02),
(142, 'Counsellor at Law', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/214x243.jpg/cc0000/ffffff', 6, 5.52),
(143, 'Contempt (Mépris, Le)', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/224x280.jpg/5fa2dd/ffffff', 3, 14.72),
(144, 'Legend, The (Legend of Fong Sai-Yuk, The) (Fo', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/248x255.jpg/ff4444/ffffff', 4, 10.28),
(145, 'The Gun That Won the West', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/210x250.jpg/dddddd/000000', 2, 13.37),
(146, 'Million Dollar Mermaid', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/202x224.jpg/dddddd/000000', 2, 9.51),
(147, 'Black Sea', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'http://dummyimage.com/238x211.jpg/dddddd/000000', 1, 5.58),
(148, 'Volcano', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/233x263.jpg/dddddd/000000', 2, 11.69),
(149, 'Ashik Kerib', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/202x279.jpg/5fa2dd/ffffff', 6, 10.59),
(150, 'Ashes and Diamonds (Popiól i diament)', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 'http://dummyimage.com/249x265.jpg/cc0000/ffffff', 4, 8.99),
(151, 'Four Nights of a Dreamer (Quatre nuits d\'un r', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/214x266.jpg/dddddd/000000', 2, 9.88),
(152, 'You Only Live Twice', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/246x246.jpg/5fa2dd/ffffff', 3, 14.08),
(153, 'Spaghetti West, The', 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/225x236.jpg/5fa2dd/ffffff', 2, 12.67),
(154, 'Strange Voyage', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'http://dummyimage.com/249x270.jpg/cc0000/ffffff', 4, 13.37),
(155, 'Craig\'s Wife', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/215x212.jpg/ff4444/ffffff', 1, 11.64),
(156, 'PT 109', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/248x209.jpg/ff4444/ffffff', 5, 5.33),
(157, 'House of Branching Love, The (Haarautuvan rak', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'http://dummyimage.com/227x266.jpg/dddddd/000000', 4, 9.05),
(158, 'Staten Island', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/226x244.jpg/5fa2dd/ffffff', 3, 12.33),
(159, 'Day the Earth Caught Fire, The', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/223x217.jpg/cc0000/ffffff', 4, 12.31),
(160, 'Doubting Thomas', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/215x263.jpg/5fa2dd/ffffff', 5, 12.03),
(161, 'Big Trouble', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'http://dummyimage.com/205x278.jpg/ff4444/ffffff', 3, 12.92),
(162, 'Sin of Harold Diddlebock, The', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 'http://dummyimage.com/212x299.jpg/5fa2dd/ffffff', 3, 5.29),
(163, 'Endurance', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/241x223.jpg/ff4444/ffffff', 6, 8.02),
(164, 'Roadkill (a.k.a. Roadkill: Move or Die)', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://dummyimage.com/242x262.jpg/ff4444/ffffff', 5, 8.35),
(165, 'From the Journals of Jean Seberg', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/234x214.jpg/ff4444/ffffff', 4, 5.29),
(166, 'Common Threads: Stories from the Quilt', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/229x241.jpg/ff4444/ffffff', 2, 14.98),
(167, 'Molière', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'http://dummyimage.com/242x235.jpg/dddddd/000000', 4, 9.05),
(168, 'Mother (Mat)', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.', 'http://dummyimage.com/214x290.jpg/ff4444/ffffff', 4, 12.93),
(169, 'Sucker Punch', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'http://dummyimage.com/219x257.jpg/ff4444/ffffff', 3, 5.92),
(170, 'The Living Idol', 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'http://dummyimage.com/238x281.jpg/ff4444/ffffff', 3, 7.31),
(171, 'The Referees', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/223x299.jpg/cc0000/ffffff', 4, 14.7),
(172, 'Aries Spears: Hollywood, Look I\'m Smiling', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/244x248.jpg/ff4444/ffffff', 6, 8.5),
(173, 'Tough Enough (Knallhart)', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/236x206.jpg/ff4444/ffffff', 1, 9.42),
(174, 'Post Mortem', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/218x241.jpg/cc0000/ffffff', 5, 12.89),
(175, 'After the Rehearsal (Efter repetitionen)', 'In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/216x276.jpg/5fa2dd/ffffff', 6, 6.13),
(176, 'Hi Diddle Diddle', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/218x233.jpg/dddddd/000000', 3, 6.13),
(177, 'Honeymoon', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'http://dummyimage.com/243x284.jpg/ff4444/ffffff', 6, 10.93),
(178, 'Blood and Wine (Blood & Wine)', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/249x264.jpg/dddddd/000000', 4, 12.18),
(179, 'Autumn Spring (Babí léto)', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 'http://dummyimage.com/221x280.jpg/cc0000/ffffff', 4, 5.93),
(180, 'Charlie Chan at the Opera', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'http://dummyimage.com/245x290.jpg/5fa2dd/ffffff', 1, 9.83),
(181, 'Nomi Song, The', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/227x291.jpg/dddddd/000000', 5, 5.53),
(182, 'Eat Sleep Die (Äta sova dö)', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'http://dummyimage.com/237x283.jpg/cc0000/ffffff', 4, 12.49),
(183, 'Private Hell 36', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/213x212.jpg/ff4444/ffffff', 3, 6.3),
(184, 'Quicksilver Highway', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/233x246.jpg/dddddd/000000', 5, 12.71),
(185, 'Old Man Drinking a Glass of Beer', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.\n\nPellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'http://dummyimage.com/248x244.jpg/ff4444/ffffff', 2, 10.59),
(186, 'John Tucker Must Die', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/200x222.jpg/cc0000/ffffff', 2, 5.28),
(187, 'Day & Night', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 'http://dummyimage.com/229x237.jpg/5fa2dd/ffffff', 2, 13.58),
(188, 'Tale of Zatoichi, The (Zatôichi monogatari) (', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://dummyimage.com/220x244.jpg/5fa2dd/ffffff', 2, 8.39),
(189, 'Rock Star', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/210x293.jpg/cc0000/ffffff', 4, 13.21),
(190, 'Tales of Ordinary Madness (Storie di Ordinari', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.', 'http://dummyimage.com/211x208.jpg/ff4444/ffffff', 6, 9.5),
(191, 'Pieta', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'http://dummyimage.com/202x225.jpg/cc0000/ffffff', 4, 5.71),
(192, 'Man from Utah, The', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\n\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'http://dummyimage.com/246x269.jpg/dddddd/000000', 5, 9.23);
INSERT INTO `item` (`id`, `name`, `description`, `image`, `id_category`, `price`) VALUES
(193, 'Happythankyoumoreplease', 'Fusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'http://dummyimage.com/201x223.jpg/dddddd/000000', 6, 13.08),
(194, 'Keep the Lights On', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/237x200.jpg/cc0000/ffffff', 5, 7.35),
(195, 'Adrift (Choi Voi)', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/225x287.jpg/5fa2dd/ffffff', 6, 5.48),
(196, 'News from Home', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 'http://dummyimage.com/206x219.jpg/cc0000/ffffff', 6, 5.19),
(197, 'Schooled: The Price of College Sports ', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/201x222.jpg/cc0000/ffffff', 2, 7.07),
(198, 'The Substitute 2: School\'s Out', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 'http://dummyimage.com/221x297.jpg/5fa2dd/ffffff', 3, 11.57),
(199, 'American Movie', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://dummyimage.com/222x293.jpg/cc0000/ffffff', 3, 11.09),
(200, 'Big Girls Don\'t Cry... They Get Even (Stepkid', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'http://dummyimage.com/206x262.jpg/5fa2dd/ffffff', 5, 11.9),
(201, 'Hundred-Foot Journey, The', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/211x242.jpg/5fa2dd/ffffff', 5, 11.26),
(202, 'Love Don\'t Cost a Thing', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.\n\nDuis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 'http://dummyimage.com/222x221.jpg/5fa2dd/ffffff', 3, 12.56),
(203, 'Stage Fright (Deliria)', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'http://dummyimage.com/248x217.jpg/ff4444/ffffff', 1, 7.18),
(204, 'Horror of Dracula (Dracula)', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'http://dummyimage.com/217x269.jpg/ff4444/ffffff', 2, 8.51),
(205, 'Latcho Drom', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://dummyimage.com/203x260.jpg/ff4444/ffffff', 3, 11.24),
(206, 'Tequila Sunrise', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\n\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'http://dummyimage.com/243x289.jpg/cc0000/ffffff', 3, 9.51),
(207, 'More', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.\n\nQuisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 'http://dummyimage.com/202x240.jpg/cc0000/ffffff', 1, 8.61),
(208, 'Import/Export', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.\n\nSed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://dummyimage.com/217x291.jpg/5fa2dd/ffffff', 6, 14.17),
(209, 'Man on the Flying Trapeze', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 'http://dummyimage.com/202x255.jpg/5fa2dd/ffffff', 3, 9.77),
(210, 'Jam', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'http://dummyimage.com/226x247.jpg/ff4444/ffffff', 3, 7.47),
(211, 'Fame', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 'http://dummyimage.com/224x222.jpg/dddddd/000000', 2, 8.72),
(212, 'Sword in the Stone, The', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'http://dummyimage.com/247x299.jpg/cc0000/ffffff', 5, 7.38),
(213, 'Vive L\'Amour (Ai qing wan sui)', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'http://dummyimage.com/226x243.jpg/5fa2dd/ffffff', 4, 5.3),
(214, 'Tunnel, The (Tunnel, Der)', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 'http://dummyimage.com/230x202.jpg/dddddd/000000', 2, 12.31),
(215, 'Band of the Hand', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 'http://dummyimage.com/235x241.jpg/5fa2dd/ffffff', 1, 5.65),
(216, 'Raintree County', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 'http://dummyimage.com/227x290.jpg/dddddd/000000', 5, 14.48),
(217, 'Adventures of Felix, The (a.k.a. Funny Felix)', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'http://dummyimage.com/205x275.jpg/dddddd/000000', 6, 11.39);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_ht` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  `id_command` int(11) UNSIGNED NOT NULL,
  `id_payment_method` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_command` (`id_command`),
  KEY `id_payment_method` (`id_payment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `total_ht`, `tva`, `id_command`, `id_payment_method`) VALUES
(7, 54.15, 10.83, 34, 16),
(8, 33.32, 6.67, 35, 16),
(9, 146.52, 29.3, 36, 16),
(10, 13.02, 2.61, 39, 16),
(11, 282.92, 56.59, 40, 17),
(12, 109.02, 21.8, 41, 23),
(13, 33.32, 6.67, 42, 21),
(14, 66.65, 13.33, 43, 21);

-- --------------------------------------------------------

--
-- Structure de la table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `method` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `id_client` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment_method`
--

INSERT INTO `payment_method` (`id`, `method`, `value`, `id_client`) VALUES
(16, 'creditCard', NULL, 1),
(17, 'creditCard', NULL, 1),
(18, 'paypal', NULL, 1),
(19, 'creditCard', NULL, 1),
(20, 'creditCard', NULL, 1),
(21, 'creditCard', '1234 1234 1234 1234&01/2021&charrier', 1),
(22, 'creditCard', NULL, 1),
(23, 'creditCard', '1111 1111 1111 1111&12/2031&charrier', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `command_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `command_item_smapshot`
--
ALTER TABLE `command_item_smapshot`
  ADD CONSTRAINT `command_item_smapshot_ibfk_1` FOREIGN KEY (`id_command`) REFERENCES `command` (`id`);

--
-- Contraintes pour la table `content_command`
--
ALTER TABLE `content_command`
  ADD CONSTRAINT `content_command_ibfk_1` FOREIGN KEY (`id_command`) REFERENCES `command` (`id`),
  ADD CONSTRAINT `content_command_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`);

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_command`) REFERENCES `command` (`id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`id_payment_method`) REFERENCES `payment_method` (`id`);

--
-- Contraintes pour la table `payment_method`
--
ALTER TABLE `payment_method`
  ADD CONSTRAINT `payment_method_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
