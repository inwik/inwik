-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Servidor: 188.121.42.5
-- Tiempo de generación: 22-03-2015 a las 09:01:44
-- Versión del servidor: 5.0.96
-- Versión de PHP: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `inwik`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounting`
--

CREATE TABLE `accounting` (
  `id` int(11) NOT NULL auto_increment,
  `concept` varchar(20) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `amount` decimal(15,3) default NULL,
  `treasurer` varchar(9) collate utf8_unicode_ci default NULL,
  `reg_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `speaker` varchar(100) collate utf8_unicode_ci default NULL,
  `recipient` varchar(100) collate utf8_unicode_ci default NULL,
  `action_date` datetime default NULL,
  `city` int(11) default NULL,
  `province` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `treasurer` (`treasurer`),
  KEY `city` (`city`),
  KEY `province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `achievements`
--

CREATE TABLE `achievements` (
  `achievement` varchar(20) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `min_points` int(11) NOT NULL,
  `type` varchar(20) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`achievement`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `achievements_users`
--

CREATE TABLE `achievements_users` (
  `achievement` varchar(20) collate utf8_unicode_ci NOT NULL default '',
  `user` int(11) NOT NULL default '0',
  `count` int(11) NOT NULL,
  `count_date` datetime NOT NULL,
  `unlock_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`achievement`,`user`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `achievement_type`
--

CREATE TABLE `achievement_type` (
  `type` varchar(20) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actions_register`
--

CREATE TABLE `actions_register` (
  `id` int(11) NOT NULL auto_increment,
  `representative` varchar(9) collate utf8_unicode_ci default NULL,
  `who` text collate utf8_unicode_ci,
  `reason` text collate utf8_unicode_ci,
  `expound` text collate utf8_unicode_ci,
  `conclusion` text collate utf8_unicode_ci,
  `resolution` text collate utf8_unicode_ci,
  `explanation` text collate utf8_unicode_ci,
  `city` int(11) default NULL,
  `province` int(11) default NULL,
  `place` text collate utf8_unicode_ci,
  `init_date_action` datetime default NULL,
  `end_date_action` datetime default NULL,
  `recorder` varchar(9) collate utf8_unicode_ci default NULL,
  `reg_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `representative` (`representative`),
  KEY `recorder` (`recorder`),
  KEY `city` (`city`),
  KEY `province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assigned_responsibility`
--

CREATE TABLE `assigned_responsibility` (
  `responsibility` varchar(20) collate utf8_unicode_ci NOT NULL,
  `person` varchar(9) collate utf8_unicode_ci NOT NULL default '',
  `init_date` date NOT NULL default '0000-00-00',
  `end_date` date default NULL,
  PRIMARY KEY  (`responsibility`,`person`,`init_date`),
  KEY `person` (`person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assigned_role`
--

CREATE TABLE `assigned_role` (
  `role` varchar(20) collate utf8_unicode_ci NOT NULL,
  `person` varchar(9) collate utf8_unicode_ci NOT NULL default '',
  `init_date` date NOT NULL default '0000-00-00',
  `end_date` date default NULL,
  PRIMARY KEY  (`role`,`person`,`init_date`),
  KEY `person` (`person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bans`
--

CREATE TABLE `bans` (
  `bofh` varchar(9) collate utf8_unicode_ci default NULL,
  `user_banned` int(11) NOT NULL default '0',
  `lost_privilege` varchar(40) collate utf8_unicode_ci NOT NULL default '',
  `init_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `end_date` datetime default NULL,
  PRIMARY KEY  (`user_banned`,`lost_privilege`,`init_date`),
  KEY `bofh` (`bofh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) collate utf8_unicode_ci NOT NULL,
  `id_province` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `id_province` (`id_province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `user` int(11) default NULL,
  `text` varchar(1000) collate utf8_unicode_ci NOT NULL,
  `type` set('normal','question','problem','fallacy','solution','title') collate utf8_unicode_ci NOT NULL,
  `fallacy_type` int(11) default NULL,
  `finished` tinyint(1) default NULL,
  `father_comment` int(11) default NULL,
  `father_idea_time_idea` int(11) default NULL,
  `father_idea_time_date` datetime default NULL,
  `son_idea_time_idea` int(11) default NULL,
  `son_idea_time_date` datetime default NULL,
  `removed` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `user` (`user`),
  KEY `fallacy_type` (`fallacy_type`),
  KEY `father_comment` (`father_comment`),
  KEY `father_idea_time_idea` (`father_idea_time_idea`,`father_idea_time_date`),
  KEY `son_idea_time_idea` (`son_idea_time_idea`,`son_idea_time_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_proposals`
--

CREATE TABLE `comments_proposals` (
  `comment` int(11) NOT NULL default '0',
  `proposal` int(11) NOT NULL default '0',
  `date_linking` datetime NOT NULL,
  `user_linker` int(11) NOT NULL,
  PRIMARY KEY  (`comment`,`proposal`),
  KEY `proposal` (`proposal`),
  KEY `user_linker` (`user_linker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delegations`
--

CREATE TABLE `delegations` (
  `person` varchar(9) collate utf8_unicode_ci NOT NULL default '',
  `tag` varchar(20) collate utf8_unicode_ci NOT NULL default '',
  `delegate` varchar(9) collate utf8_unicode_ci NOT NULL default '',
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY  (`person`,`tag`,`delegate`,`creation_date`),
  KEY `tag` (`tag`),
  KEY `delegate` (`delegate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL auto_increment,
  `concept` varchar(20) collate utf8_unicode_ci default NULL,
  `amount` decimal(15,3) default NULL,
  `treasurer` varchar(9) collate utf8_unicode_ci default NULL,
  `reg_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `donor` varchar(100) collate utf8_unicode_ci default NULL,
  `action_date` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `treasurer` (`treasurer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elections_surveys`
--

CREATE TABLE `elections_surveys` (
  `survey` int(11) NOT NULL default '0',
  `survey_option` int(11) NOT NULL default '0',
  `election_user` int(11) NOT NULL,
  `election_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`survey`,`survey_option`,`election_user`),
  KEY `election_user` (`election_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(60) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `event_text` text collate utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `init_date` datetime NOT NULL,
  `end_date` datetime default NULL,
  `visits` int(11) NOT NULL default '1',
  `address` varchar(60) collate utf8_unicode_ci default NULL,
  `city` int(11) default NULL,
  `province` int(11) default NULL,
  `web` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(12) collate utf8_unicode_ci default NULL,
  `coordenates` varchar(40) collate utf8_unicode_ci default NULL,
  `platform` varchar(20) collate utf8_unicode_ci default NULL,
  `creator` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `creator` (`creator`),
  KEY `city` (`city`),
  KEY `province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events_participants`
--

CREATE TABLE `events_participants` (
  `event` int(11) NOT NULL default '0',
  `participant` int(11) NOT NULL default '0',
  `confirmation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`event`,`participant`),
  KEY `participant` (`participant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fallacies`
--

CREATE TABLE `fallacies` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(101) collate utf8_unicode_ci default NULL,
  `description` varchar(1000) collate utf8_unicode_ci NOT NULL,
  `rgbcolor` int(11) NOT NULL,
  `icon` varchar(101) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friends`
--

CREATE TABLE `friends` (
  `user1` int(11) NOT NULL default '0',
  `user2` int(11) NOT NULL default '0',
  `friendly_date` datetime default NULL,
  PRIMARY KEY  (`user1`,`user2`),
  KEY `user2` (`user2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ideas`
--

CREATE TABLE `ideas` (
  `id` int(11) NOT NULL auto_increment,
  `proposal` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `proposal` (`proposal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=211 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ideas_time`
--

CREATE TABLE `ideas_time` (
  `idea` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `user` int(11) default NULL,
  `text` varchar(1000) collate utf8_unicode_ci NOT NULL,
  `type` set('p','liul','liol','h') collate utf8_unicode_ci NOT NULL,
  `father_idea` int(11) default NULL,
  `prebrother_idea` int(11) default NULL,
  `removed` tinyint(1) NOT NULL default '0',
  `minor_edit` tinyint(1) NOT NULL default '0',
  `editable` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`idea`,`date`),
  KEY `user` (`user`),
  KEY `father_idea` (`father_idea`),
  KEY `prebrother_idea` (`prebrother_idea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ip_bloq`
--

CREATE TABLE `ip_bloq` (
  `banner` varchar(9) collate utf8_unicode_ci NOT NULL default '',
  `ip` varchar(40) collate utf8_unicode_ci NOT NULL default '',
  `init_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `end_date` datetime default NULL,
  `reason` varchar(200) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`banner`,`ip`,`init_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels`
--

CREATE TABLE `labels` (
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `label_type` varchar(20) collate utf8_unicode_ci NOT NULL,
  `color` varchar(6) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`name`),
  KEY `label_type` (`label_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels_proposals`
--

CREATE TABLE `labels_proposals` (
  `proposal` int(11) NOT NULL default '0',
  `label` varchar(20) collate utf8_unicode_ci NOT NULL default '',
  `labelled_sentence` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `n_label` tinyint(4) NOT NULL default '1',
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `talk_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  PRIMARY KEY  (`proposal`,`label`,`labelled_sentence`,`n_label`),
  KEY `label` (`label`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels_votes`
--

CREATE TABLE `labels_votes` (
  `proposal` int(11) NOT NULL default '0',
  `label` varchar(20) collate utf8_unicode_ci NOT NULL default '',
  `sentence` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `n_label` tinyint(4) NOT NULL default '0',
  `person` varchar(9) collate utf8_unicode_ci NOT NULL default '',
  `vote_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `vote_value` tinyint(1) NOT NULL,
  PRIMARY KEY  (`proposal`,`label`,`sentence`,`n_label`,`person`),
  KEY `person` (`person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `label_types`
--

CREATE TABLE `label_types` (
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legal_text`
--

CREATE TABLE `legal_text` (
  `id` int(11) NOT NULL,
  `title` varchar(60) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `redaction_text` text collate utf8_unicode_ci NOT NULL,
  `visits` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `members`
--

CREATE TABLE `members` (
  `person` varchar(9) collate utf8_unicode_ci NOT NULL,
  `membership_date` date NOT NULL,
  `last_pay` date NOT NULL,
  `next_pay` date NOT NULL,
  `pay_type` set('biannual','annual','biannually','quarterly','monthly') collate utf8_unicode_ci default 'monthly',
  `change_date_pay_type` datetime default NULL,
  PRIMARY KEY  (`person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `member_pays`
--

CREATE TABLE `member_pays` (
  `member` varchar(9) collate utf8_unicode_ci NOT NULL default '',
  `pay_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `amount` decimal(15,3) default NULL,
  PRIMARY KEY  (`member`,`pay_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `speaker` int(11) NOT NULL default '0',
  `message_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `message_text` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`speaker`,`message_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_recipient`
--

CREATE TABLE `message_recipient` (
  `speaker` int(11) NOT NULL default '0',
  `recipient` int(11) NOT NULL default '0',
  `message_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`speaker`,`message_date`,`recipient`),
  KEY `recipient` (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `notif_date` datetime NOT NULL,
  `notif_user` int(11) NOT NULL,
  `notif_from` int(11) default NULL,
  `notif_title` varchar(70) collate utf8_unicode_ci NOT NULL,
  `notif_text` varchar(255) collate utf8_unicode_ci NOT NULL,
  `notif_link` varchar(255) collate utf8_unicode_ci default NULL,
  `notif_type` varchar(20) collate utf8_unicode_ci NOT NULL default 'default',
  `notif_class` varchar(40) collate utf8_unicode_ci default NULL,
  `readon` tinyint(1) NOT NULL default '0',
  `watched` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`notif_date`,`notif_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `options_surveys`
--

CREATE TABLE `options_surveys` (
  `survey` int(11) NOT NULL default '0',
  `survey_option` int(11) NOT NULL default '0',
  PRIMARY KEY  (`survey`,`survey_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

CREATE TABLE `persons` (
  `nif` varchar(9) collate utf8_unicode_ci NOT NULL,
  `name` varchar(40) collate utf8_unicode_ci NOT NULL,
  `surname1` varchar(40) collate utf8_unicode_ci NOT NULL,
  `surname2` varchar(40) collate utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `city` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `security_key` varchar(255) collate utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `email1` varchar(255) collate utf8_unicode_ci NOT NULL,
  `email2` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(12) collate utf8_unicode_ci default NULL,
  `mobile` varchar(12) collate utf8_unicode_ci default NULL,
  `address` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`nif`),
  KEY `city` (`city`),
  KEY `province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_comments`
--

CREATE TABLE `profile_comments` (
  `post_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_publisher` int(11) NOT NULL default '0',
  `comment_date` datetime NOT NULL,
  `comment_publisher` int(11) NOT NULL default '0',
  `comment_text` text collate utf8_unicode_ci NOT NULL,
  `edition_date` datetime default NULL,
  PRIMARY KEY  (`post_date`,`post_publisher`,`comment_date`,`comment_publisher`),
  KEY `post_publisher` (`post_publisher`),
  KEY `comment_publisher` (`comment_publisher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_posts`
--

CREATE TABLE `profile_posts` (
  `post_date` datetime NOT NULL,
  `post_publisher` int(11) NOT NULL,
  `post_text` text NOT NULL,
  `image` varchar(255) default NULL,
  `survey` int(11) default NULL,
  `edition_date` datetime NOT NULL,
  PRIMARY KEY  (`post_date`,`post_publisher`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_posts_published`
--

CREATE TABLE `profile_posts_published` (
  `post_date` datetime NOT NULL,
  `post_publisher` int(11) NOT NULL,
  `profile_user` int(11) NOT NULL,
  `publish_date` datetime NOT NULL,
  PRIMARY KEY  (`post_date`,`post_publisher`,`profile_user`,`publish_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(60) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `project_text` text collate utf8_unicode_ci NOT NULL,
  `creator` int(11) default NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `init_date` datetime default NULL,
  `end_date` datetime default NULL,
  `visits` int(11) NOT NULL default '1',
  `address` varchar(60) collate utf8_unicode_ci default NULL,
  `city` int(11) default NULL,
  `province` int(11) default NULL,
  `web` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(12) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `creator` (`creator`),
  KEY `city` (`city`),
  KEY `province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects_comments`
--

CREATE TABLE `projects_comments` (
  `project_talk` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `creation_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `modification_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `num_mod` int(11) NOT NULL default '0',
  `comment_text` text collate utf8_unicode_ci NOT NULL,
  `comment_state` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`project_talk`,`creator`,`creation_date`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects_participants`
--

CREATE TABLE `projects_participants` (
  `project` int(11) NOT NULL default '0',
  `participant` int(11) NOT NULL default '0',
  `confirmation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `responsability` set('0','1','2','3') collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`project`,`participant`),
  KEY `participant` (`participant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects_talks`
--

CREATE TABLE `projects_talks` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(75) collate utf8_unicode_ci NOT NULL,
  `survey` int(11) default NULL,
  `project` int(11) NOT NULL,
  `project_section` varchar(20) collate utf8_unicode_ci NOT NULL,
  `creator` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `project` (`project`),
  KEY `creator` (`creator`),
  KEY `survey` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proposals`
--

CREATE TABLE `proposals` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(75) collate utf8_unicode_ci NOT NULL,
  `creator` int(11) NOT NULL,
  `creation_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `visits` int(11) NOT NULL default '0',
  `fork_from` int(11) default NULL,
  `urgency` int(11) NOT NULL default '0',
  `importance` int(11) NOT NULL default '0',
  `filter_bias` tinyint(1) NOT NULL default '1',
  `filter_fallacy` tinyint(1) NOT NULL default '1',
  `filter_neutral` tinyint(1) NOT NULL default '1',
  `filter_vp_social` tinyint(1) NOT NULL default '1',
  `filter_vp_econom` tinyint(1) NOT NULL default '1',
  `filter_vp_ecolog` tinyint(1) NOT NULL default '1',
  `filter_intro` tinyint(1) NOT NULL default '1',
  `filter_referencies` tinyint(1) NOT NULL default '1',
  `filters_date` datetime default NULL,
  `urgency_date` datetime default NULL,
  `importance_date` datetime default NULL,
  `approval_date` datetime default NULL,
  `test_cache` text collate utf8_unicode_ci,
  `lastcache_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) collate utf8_unicode_ci NOT NULL,
  `id_state` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id_state` (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsibilities`
--

CREATE TABLE `responsibilities` (
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci NOT NULL,
  `level` enum('1','2','3','4','5') collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) collate utf8_unicode_ci NOT NULL,
  `id_country` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id_country` (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscriptions_propopals_users`
--

CREATE TABLE `subscriptions_propopals_users` (
  `proposal` int(11) NOT NULL default '0',
  `user` int(11) NOT NULL default '0',
  `date_subscription` datetime NOT NULL,
  `date_lastvisit` datetime NOT NULL,
  PRIMARY KEY  (`user`,`proposal`),
  KEY `proposal` (`proposal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surveys`
--

CREATE TABLE `surveys` (
  `id` int(11) NOT NULL auto_increment,
  `question` varchar(255) collate utf8_unicode_ci default NULL,
  `creator` int(11) NOT NULL,
  `multioption` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `tag_parent` varchar(20) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`name`),
  KEY `tag_parent` (`tag_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trackings`
--

CREATE TABLE `trackings` (
  `tracking_user` int(11) NOT NULL default '0',
  `proposal` int(11) NOT NULL default '0',
  `init_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`tracking_user`,`proposal`),
  KEY `proposal` (`proposal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) collate utf8_unicode_ci NOT NULL,
  `email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `password` varchar(40) collate utf8_unicode_ci NOT NULL,
  `person` varchar(9) collate utf8_unicode_ci default NULL,
  `creation_date` datetime NOT NULL,
  `last_date` datetime NOT NULL,
  `creation_ip` varchar(40) collate utf8_unicode_ci NOT NULL,
  `last_ip` varchar(40) collate utf8_unicode_ci NOT NULL,
  `active_account` tinyint(1) default '0',
  `real_name` varchar(60) collate utf8_unicode_ci default NULL,
  `birthdate` date default NULL,
  `birthplace` varchar(60) collate utf8_unicode_ci default NULL,
  `residence_place` varchar(60) collate utf8_unicode_ci default NULL,
  `sex` enum('','man','woman') collate utf8_unicode_ci NOT NULL default '',
  `description` text collate utf8_unicode_ci,
  `studies` text collate utf8_unicode_ci,
  `jobs` text collate utf8_unicode_ci,
  `create_proposals` tinyint(1) default '1',
  `edit_proposals` tinyint(1) default '1',
  `talk_proposals` tinyint(1) default '1',
  `vote_talk_proposals` tinyint(1) default '1',
  `vote_proposals` tinyint(1) default '1',
  `create_projects` tinyint(1) default '1',
  `edit_projects` tinyint(1) default '1',
  `talk_projects` tinyint(1) default '1',
  `create_events` tinyint(1) default '1',
  `edit_events` tinyint(1) default '1',
  `talk_events` tinyint(1) default '1',
  `skin_light` tinyint(1) default '0',
  `annon_mode` tinyint(1) default '0',
  `avatar` tinyint(1) NOT NULL default '0',
  `notification` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  KEY `person` (`person`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votes`
--

CREATE TABLE `votes` (
  `enc_key` varchar(40) collate utf8_unicode_ci NOT NULL,
  `proposal` int(11) NOT NULL,
  `vote` set('pos','null','neg') collate utf8_unicode_ci NOT NULL,
  `vote_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `delegate_vote` tinyint(1) default '0',
  PRIMARY KEY  (`enc_key`),
  KEY `proposal` (`proposal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `accounting`
--
ALTER TABLE `accounting`
  ADD CONSTRAINT `accounting_ibfk_1` FOREIGN KEY (`treasurer`) REFERENCES `persons` (`nif`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `accounting_ibfk_2` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `accounting_ibfk_3` FOREIGN KEY (`province`) REFERENCES `provinces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `achievements`
--
ALTER TABLE `achievements`
  ADD CONSTRAINT `achievements_ibfk_1` FOREIGN KEY (`type`) REFERENCES `achievement_type` (`type`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `achievements_users`
--
ALTER TABLE `achievements_users`
  ADD CONSTRAINT `achievements_users_ibfk_1` FOREIGN KEY (`achievement`) REFERENCES `achievements` (`achievement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `achievements_users_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `actions_register`
--
ALTER TABLE `actions_register`
  ADD CONSTRAINT `actions_register_ibfk_1` FOREIGN KEY (`representative`) REFERENCES `persons` (`nif`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `actions_register_ibfk_2` FOREIGN KEY (`recorder`) REFERENCES `persons` (`nif`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `actions_register_ibfk_3` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `actions_register_ibfk_4` FOREIGN KEY (`province`) REFERENCES `provinces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `assigned_responsibility`
--
ALTER TABLE `assigned_responsibility`
  ADD CONSTRAINT `assigned_responsibility_ibfk_1` FOREIGN KEY (`responsibility`) REFERENCES `responsibilities` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_responsibility_ibfk_2` FOREIGN KEY (`person`) REFERENCES `persons` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `assigned_role`
--
ALTER TABLE `assigned_role`
  ADD CONSTRAINT `assigned_role_ibfk_2` FOREIGN KEY (`person`) REFERENCES `persons` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assigned_role_ibfk_3` FOREIGN KEY (`role`) REFERENCES `roles` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bans`
--
ALTER TABLE `bans`
  ADD CONSTRAINT `bans_ibfk_1` FOREIGN KEY (`bofh`) REFERENCES `persons` (`nif`),
  ADD CONSTRAINT `bans_ibfk_2` FOREIGN KEY (`user_banned`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`id_province`) REFERENCES `provinces` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`fallacy_type`) REFERENCES `fallacies` (`id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`father_comment`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`father_idea_time_idea`, `father_idea_time_date`) REFERENCES `ideas_time` (`idea`, `date`),
  ADD CONSTRAINT `comments_ibfk_5` FOREIGN KEY (`son_idea_time_idea`, `son_idea_time_date`) REFERENCES `ideas_time` (`idea`, `date`);

--
-- Filtros para la tabla `comments_proposals`
--
ALTER TABLE `comments_proposals`
  ADD CONSTRAINT `comments_proposals_ibfk_1` FOREIGN KEY (`comment`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_proposals_ibfk_2` FOREIGN KEY (`proposal`) REFERENCES `proposals` (`id`),
  ADD CONSTRAINT `comments_proposals_ibfk_3` FOREIGN KEY (`user_linker`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `delegations`
--
ALTER TABLE `delegations`
  ADD CONSTRAINT `delegations_ibfk_1` FOREIGN KEY (`person`) REFERENCES `persons` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delegations_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tags` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `delegations_ibfk_3` FOREIGN KEY (`delegate`) REFERENCES `persons` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`treasurer`) REFERENCES `persons` (`nif`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `elections_surveys`
--
ALTER TABLE `elections_surveys`
  ADD CONSTRAINT `elections_surveys_ibfk_1` FOREIGN KEY (`survey`, `survey_option`) REFERENCES `options_surveys` (`survey`, `survey_option`),
  ADD CONSTRAINT `elections_surveys_ibfk_2` FOREIGN KEY (`election_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`province`) REFERENCES `provinces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `events_participants`
--
ALTER TABLE `events_participants`
  ADD CONSTRAINT `events_participants_ibfk_1` FOREIGN KEY (`event`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `events_participants_ibfk_2` FOREIGN KEY (`participant`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user1`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`user2`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ideas`
--
ALTER TABLE `ideas`
  ADD CONSTRAINT `ideas_ibfk_1` FOREIGN KEY (`proposal`) REFERENCES `proposals` (`id`);

--
-- Filtros para la tabla `ideas_time`
--
ALTER TABLE `ideas_time`
  ADD CONSTRAINT `ideas_time_ibfk_1` FOREIGN KEY (`idea`) REFERENCES `ideas` (`id`),
  ADD CONSTRAINT `ideas_time_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ideas_time_ibfk_3` FOREIGN KEY (`father_idea`) REFERENCES `ideas` (`id`),
  ADD CONSTRAINT `ideas_time_ibfk_4` FOREIGN KEY (`prebrother_idea`) REFERENCES `ideas` (`id`);

--
-- Filtros para la tabla `ip_bloq`
--
ALTER TABLE `ip_bloq`
  ADD CONSTRAINT `ip_bloq_ibfk_1` FOREIGN KEY (`banner`) REFERENCES `persons` (`nif`);

--
-- Filtros para la tabla `labels`
--
ALTER TABLE `labels`
  ADD CONSTRAINT `labels_ibfk_1` FOREIGN KEY (`label_type`) REFERENCES `label_types` (`name`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `labels_proposals`
--
ALTER TABLE `labels_proposals`
  ADD CONSTRAINT `labels_proposals_ibfk_1` FOREIGN KEY (`proposal`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `labels_proposals_ibfk_2` FOREIGN KEY (`label`) REFERENCES `labels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `labels_proposals_ibfk_3` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `labels_votes`
--
ALTER TABLE `labels_votes`
  ADD CONSTRAINT `labels_votes_ibfk_1` FOREIGN KEY (`proposal`, `label`, `sentence`, `n_label`) REFERENCES `labels_proposals` (`proposal`, `label`, `labelled_sentence`, `n_label`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `labels_votes_ibfk_2` FOREIGN KEY (`person`) REFERENCES `persons` (`nif`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`person`) REFERENCES `persons` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `member_pays`
--
ALTER TABLE `member_pays`
  ADD CONSTRAINT `member_pays_ibfk_1` FOREIGN KEY (`member`) REFERENCES `persons` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`speaker`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `message_recipient`
--
ALTER TABLE `message_recipient`
  ADD CONSTRAINT `message_recipient_ibfk_1` FOREIGN KEY (`speaker`, `message_date`) REFERENCES `message` (`speaker`, `message_date`),
  ADD CONSTRAINT `message_recipient_ibfk_2` FOREIGN KEY (`recipient`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `options_surveys`
--
ALTER TABLE `options_surveys`
  ADD CONSTRAINT `options_surveys_ibfk_1` FOREIGN KEY (`survey`) REFERENCES `surveys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `persons_ibfk_2` FOREIGN KEY (`province`) REFERENCES `provinces` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `profile_comments`
--
ALTER TABLE `profile_comments`
  ADD CONSTRAINT `profile_comments_ibfk_1` FOREIGN KEY (`comment_publisher`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`province`) REFERENCES `provinces` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `projects_comments`
--
ALTER TABLE `projects_comments`
  ADD CONSTRAINT `projects_comments_ibfk_1` FOREIGN KEY (`project_talk`) REFERENCES `projects_talks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_comments_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `projects_participants`
--
ALTER TABLE `projects_participants`
  ADD CONSTRAINT `projects_participants_ibfk_1` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_participants_ibfk_2` FOREIGN KEY (`participant`) REFERENCES `projects` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `projects_talks`
--
ALTER TABLE `projects_talks`
  ADD CONSTRAINT `projects_talks_ibfk_1` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_talks_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_talks_ibfk_3` FOREIGN KEY (`survey`) REFERENCES `surveys` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `provinces`
--
ALTER TABLE `provinces`
  ADD CONSTRAINT `provinces_ibfk_1` FOREIGN KEY (`id_state`) REFERENCES `states` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `subscriptions_propopals_users`
--
ALTER TABLE `subscriptions_propopals_users`
  ADD CONSTRAINT `subscriptions_propopals_users_ibfk_1` FOREIGN KEY (`proposal`) REFERENCES `proposals` (`id`),
  ADD CONSTRAINT `subscriptions_propopals_users_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`tag_parent`) REFERENCES `tags` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `trackings`
--
ALTER TABLE `trackings`
  ADD CONSTRAINT `trackings_ibfk_1` FOREIGN KEY (`tracking_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trackings_ibfk_2` FOREIGN KEY (`proposal`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`person`) REFERENCES `persons` (`nif`) ON DELETE SET NULL;

--
-- Filtros para la tabla `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`proposal`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
