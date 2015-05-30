-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-05-2015 a las 20:52:10
-- Versión del servidor: 10.0.19-MariaDB-1~trusty-log
-- Versión de PHP: 5.6.4-4ubuntu6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


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

CREATE TABLE IF NOT EXISTS `accounting` (
`id` int(11) NOT NULL,
  `concept` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `amount` decimal(15,3) DEFAULT NULL,
  `treasurer` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `speaker` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_date` datetime DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `achievements`
--

CREATE TABLE IF NOT EXISTS `achievements` (
  `achievement` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min_points` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `achievements_users`
--

CREATE TABLE IF NOT EXISTS `achievements_users` (
  `achievement` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL,
  `count_date` datetime NOT NULL,
  `unlock_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `achievement_type`
--

CREATE TABLE IF NOT EXISTS `achievement_type` (
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actions_register`
--

CREATE TABLE IF NOT EXISTS `actions_register` (
`id` int(11) NOT NULL,
  `representative` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `who` text COLLATE utf8_unicode_ci,
  `reason` text COLLATE utf8_unicode_ci,
  `expound` text COLLATE utf8_unicode_ci,
  `conclusion` text COLLATE utf8_unicode_ci,
  `resolution` text COLLATE utf8_unicode_ci,
  `explanation` text COLLATE utf8_unicode_ci,
  `city` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `place` text COLLATE utf8_unicode_ci,
  `init_date_action` datetime DEFAULT NULL,
  `end_date_action` datetime DEFAULT NULL,
  `recorder` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assigned_responsibility`
--

CREATE TABLE IF NOT EXISTS `assigned_responsibility` (
  `responsibility` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `person` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `init_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assigned_role`
--

CREATE TABLE IF NOT EXISTS `assigned_role` (
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `person` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `init_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `bofh` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_banned` int(11) NOT NULL DEFAULT '0',
  `lost_privilege` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `init_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
`id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `id_province` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `text` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `type` set('normal','question','problem','fallacy','solution','title') COLLATE utf8_unicode_ci NOT NULL,
  `fallacy_type` int(11) DEFAULT NULL,
  `finished` tinyint(1) DEFAULT NULL,
  `father_comment` int(11) DEFAULT NULL,
  `father_idea_time_idea` int(11) DEFAULT NULL,
  `father_idea_time_date` datetime DEFAULT NULL,
  `son_idea_time_idea` int(11) DEFAULT NULL,
  `son_idea_time_date` datetime DEFAULT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_proposals`
--

CREATE TABLE IF NOT EXISTS `comments_proposals` (
  `comment` int(11) NOT NULL DEFAULT '0',
  `proposal` int(11) NOT NULL DEFAULT '0',
  `date_linking` datetime NOT NULL,
  `user_linker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delegations`
--

CREATE TABLE IF NOT EXISTS `delegations` (
  `person` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delegate` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donations`
--

CREATE TABLE IF NOT EXISTS `donations` (
`id` int(11) NOT NULL,
  `concept` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(15,3) DEFAULT NULL,
  `treasurer` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `donor` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elections_surveys`
--

CREATE TABLE IF NOT EXISTS `elections_surveys` (
  `survey` int(11) NOT NULL DEFAULT '0',
  `survey_option` int(11) NOT NULL DEFAULT '0',
  `election_user` int(11) NOT NULL,
  `election_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE IF NOT EXISTS `events` (
`id` int(11) NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_text` text COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `init_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `visits` int(11) NOT NULL DEFAULT '1',
  `address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `web` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coordenates` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `platform` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events_participants`
--

CREATE TABLE IF NOT EXISTS `events_participants` (
  `event` int(11) NOT NULL DEFAULT '0',
  `participant` int(11) NOT NULL DEFAULT '0',
  `confirmation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fallacies`
--

CREATE TABLE IF NOT EXISTS `fallacies` (
`id` int(11) NOT NULL,
  `name` varchar(101) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `rgbcolor` int(11) NOT NULL,
  `icon` varchar(101) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `user1` int(11) NOT NULL DEFAULT '0',
  `user2` int(11) NOT NULL DEFAULT '0',
  `friendly_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ideas`
--

CREATE TABLE IF NOT EXISTS `ideas` (
`id` int(11) NOT NULL,
  `proposal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ideas_time`
--

CREATE TABLE IF NOT EXISTS `ideas_time` (
  `idea` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user` int(11) DEFAULT NULL,
  `text` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `type` set('p','liul','liol','h') COLLATE utf8_unicode_ci NOT NULL,
  `father_idea` int(11) DEFAULT NULL,
  `prebrother_idea` int(11) DEFAULT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `minor_edit` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ip_bloq`
--

CREATE TABLE IF NOT EXISTS `ip_bloq` (
  `banner` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `init_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels`
--

CREATE TABLE IF NOT EXISTS `labels` (
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels_proposals`
--

CREATE TABLE IF NOT EXISTS `labels_proposals` (
  `proposal` int(11) NOT NULL DEFAULT '0',
  `label` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `labelled_sentence` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `n_label` tinyint(4) NOT NULL DEFAULT '1',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `talk_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `labels_votes`
--

CREATE TABLE IF NOT EXISTS `labels_votes` (
  `proposal` int(11) NOT NULL DEFAULT '0',
  `label` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sentence` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `n_label` tinyint(4) NOT NULL DEFAULT '0',
  `person` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vote_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vote_value` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `label_types`
--

CREATE TABLE IF NOT EXISTS `label_types` (
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legal_text`
--

CREATE TABLE IF NOT EXISTS `legal_text` (
  `id` int(11) NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redaction_text` text COLLATE utf8_unicode_ci NOT NULL,
  `visits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `person` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `membership_date` date NOT NULL,
  `last_pay` date NOT NULL,
  `next_pay` date NOT NULL,
  `pay_type` set('biannual','annual','biannually','quarterly','monthly') COLLATE utf8_unicode_ci DEFAULT 'monthly',
  `change_date_pay_type` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `member_pays`
--

CREATE TABLE IF NOT EXISTS `member_pays` (
  `member` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pay_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(15,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `speaker` int(11) NOT NULL DEFAULT '0',
  `message_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_recipient`
--

CREATE TABLE IF NOT EXISTS `message_recipient` (
  `speaker` int(11) NOT NULL DEFAULT '0',
  `recipient` int(11) NOT NULL DEFAULT '0',
  `message_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notif_date` datetime NOT NULL,
  `notif_user` int(11) NOT NULL,
  `notif_from` int(11) DEFAULT NULL,
  `notif_title` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `notif_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notif_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notif_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `notif_class` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `readon` tinyint(1) NOT NULL DEFAULT '0',
  `watched` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `options_surveys`
--

CREATE TABLE IF NOT EXISTS `options_surveys` (
  `survey` int(11) NOT NULL DEFAULT '0',
  `survey_option` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

CREATE TABLE IF NOT EXISTS `persons` (
  `nif` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `surname1` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `surname2` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `city` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `security_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_comments`
--

CREATE TABLE IF NOT EXISTS `profile_comments` (
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_publisher` int(11) NOT NULL DEFAULT '0',
  `comment_date` datetime NOT NULL,
  `comment_publisher` int(11) NOT NULL DEFAULT '0',
  `comment_text` text COLLATE utf8_unicode_ci NOT NULL,
  `edition_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_posts`
--

CREATE TABLE IF NOT EXISTS `profile_posts` (
  `post_date` datetime NOT NULL,
  `post_publisher` int(11) NOT NULL,
  `post_text` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `survey` int(11) DEFAULT NULL,
  `edition_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_posts_published`
--

CREATE TABLE IF NOT EXISTS `profile_posts_published` (
  `post_date` datetime NOT NULL,
  `post_publisher` int(11) NOT NULL,
  `profile_user` int(11) NOT NULL,
  `publish_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
`id` int(11) NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_text` text COLLATE utf8_unicode_ci NOT NULL,
  `creator` int(11) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `init_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `visits` int(11) NOT NULL DEFAULT '1',
  `address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `web` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects_comments`
--

CREATE TABLE IF NOT EXISTS `projects_comments` (
  `project_talk` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `num_mod` int(11) NOT NULL DEFAULT '0',
  `comment_text` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_state` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects_participants`
--

CREATE TABLE IF NOT EXISTS `projects_participants` (
  `project` int(11) NOT NULL DEFAULT '0',
  `participant` int(11) NOT NULL DEFAULT '0',
  `confirmation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `responsability` set('0','1','2','3') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects_talks`
--

CREATE TABLE IF NOT EXISTS `projects_talks` (
`id` int(11) NOT NULL,
  `title` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `survey` int(11) DEFAULT NULL,
  `project` int(11) NOT NULL,
  `project_section` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `creator` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proposals`
--

CREATE TABLE IF NOT EXISTS `proposals` (
`id` int(11) NOT NULL,
  `title` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `creator` int(11) NOT NULL,
  `creation_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `visits` int(11) NOT NULL DEFAULT '0',
  `fork_from` int(11) DEFAULT NULL,
  `urgency` int(11) NOT NULL DEFAULT '0',
  `importance` int(11) NOT NULL DEFAULT '0',
  `filter_bias` tinyint(1) NOT NULL DEFAULT '1',
  `filter_fallacy` tinyint(1) NOT NULL DEFAULT '1',
  `filter_neutral` tinyint(1) NOT NULL DEFAULT '1',
  `filter_vp_social` tinyint(1) NOT NULL DEFAULT '1',
  `filter_vp_econom` tinyint(1) NOT NULL DEFAULT '1',
  `filter_vp_ecolog` tinyint(1) NOT NULL DEFAULT '1',
  `filter_intro` tinyint(1) NOT NULL DEFAULT '1',
  `filter_referencies` tinyint(1) NOT NULL DEFAULT '1',
  `filters_date` datetime DEFAULT NULL,
  `urgency_date` datetime DEFAULT NULL,
  `importance_date` datetime DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `test_cache` text COLLATE utf8_unicode_ci,
  `lastcache_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provinces`
--

CREATE TABLE IF NOT EXISTS `provinces` (
`id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id_state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsibilities`
--

CREATE TABLE IF NOT EXISTS `responsibilities` (
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE IF NOT EXISTS `states` (
`id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id_country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscriptions_propopals_users`
--

CREATE TABLE IF NOT EXISTS `subscriptions_propopals_users` (
  `proposal` int(11) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT '0',
  `date_subscription` datetime NOT NULL,
  `date_lastvisit` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surveys`
--

CREATE TABLE IF NOT EXISTS `surveys` (
`id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `multioption` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_parent` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trackings`
--

CREATE TABLE IF NOT EXISTS `trackings` (
  `tracking_user` int(11) NOT NULL DEFAULT '0',
  `proposal` int(11) NOT NULL DEFAULT '0',
  `init_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `user` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `person` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `last_date` datetime NOT NULL,
  `creation_ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `active_account` tinyint(1) DEFAULT '0',
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `birthplace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `residence_place` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` enum('','man','woman') COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `studies` text COLLATE utf8_unicode_ci,
  `jobs` text COLLATE utf8_unicode_ci,
  `create_proposals` tinyint(1) DEFAULT '1',
  `edit_proposals` tinyint(1) DEFAULT '1',
  `talk_proposals` tinyint(1) DEFAULT '1',
  `vote_talk_proposals` tinyint(1) DEFAULT '1',
  `vote_proposals` tinyint(1) DEFAULT '1',
  `create_projects` tinyint(1) DEFAULT '1',
  `edit_projects` tinyint(1) DEFAULT '1',
  `talk_projects` tinyint(1) DEFAULT '1',
  `create_events` tinyint(1) DEFAULT '1',
  `edit_events` tinyint(1) DEFAULT '1',
  `talk_events` tinyint(1) DEFAULT '1',
  `skin_light` tinyint(1) DEFAULT '0',
  `annon_mode` tinyint(1) DEFAULT '0',
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `notification` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `enc_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `proposal` int(11) NOT NULL,
  `vote` set('pos','null','neg') COLLATE utf8_unicode_ci NOT NULL,
  `vote_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delegate_vote` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounting`
--
ALTER TABLE `accounting`
 ADD PRIMARY KEY (`id`), ADD KEY `treasurer` (`treasurer`), ADD KEY `city` (`city`), ADD KEY `province` (`province`);

--
-- Indices de la tabla `achievements`
--
ALTER TABLE `achievements`
 ADD PRIMARY KEY (`achievement`), ADD KEY `type` (`type`);

--
-- Indices de la tabla `achievements_users`
--
ALTER TABLE `achievements_users`
 ADD PRIMARY KEY (`achievement`,`user`), ADD KEY `user` (`user`);

--
-- Indices de la tabla `achievement_type`
--
ALTER TABLE `achievement_type`
 ADD PRIMARY KEY (`type`);

--
-- Indices de la tabla `actions_register`
--
ALTER TABLE `actions_register`
 ADD PRIMARY KEY (`id`), ADD KEY `representative` (`representative`), ADD KEY `recorder` (`recorder`), ADD KEY `city` (`city`), ADD KEY `province` (`province`);

--
-- Indices de la tabla `assigned_responsibility`
--
ALTER TABLE `assigned_responsibility`
 ADD PRIMARY KEY (`responsibility`,`person`,`init_date`), ADD KEY `person` (`person`);

--
-- Indices de la tabla `assigned_role`
--
ALTER TABLE `assigned_role`
 ADD PRIMARY KEY (`role`,`person`,`init_date`), ADD KEY `person` (`person`);

--
-- Indices de la tabla `bans`
--
ALTER TABLE `bans`
 ADD PRIMARY KEY (`user_banned`,`lost_privilege`,`init_date`), ADD KEY `bofh` (`bofh`);

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
 ADD PRIMARY KEY (`id`), ADD KEY `id_province` (`id_province`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `user` (`user`), ADD KEY `fallacy_type` (`fallacy_type`), ADD KEY `father_comment` (`father_comment`), ADD KEY `father_idea_time_idea` (`father_idea_time_idea`,`father_idea_time_date`), ADD KEY `son_idea_time_idea` (`son_idea_time_idea`,`son_idea_time_date`);

--
-- Indices de la tabla `comments_proposals`
--
ALTER TABLE `comments_proposals`
 ADD PRIMARY KEY (`comment`,`proposal`), ADD KEY `proposal` (`proposal`), ADD KEY `user_linker` (`user_linker`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `delegations`
--
ALTER TABLE `delegations`
 ADD PRIMARY KEY (`person`,`tag`,`delegate`,`creation_date`), ADD KEY `tag` (`tag`), ADD KEY `delegate` (`delegate`);

--
-- Indices de la tabla `donations`
--
ALTER TABLE `donations`
 ADD PRIMARY KEY (`id`), ADD KEY `treasurer` (`treasurer`);

--
-- Indices de la tabla `elections_surveys`
--
ALTER TABLE `elections_surveys`
 ADD PRIMARY KEY (`survey`,`survey_option`,`election_user`), ADD KEY `election_user` (`election_user`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`id`), ADD KEY `creator` (`creator`), ADD KEY `city` (`city`), ADD KEY `province` (`province`);

--
-- Indices de la tabla `events_participants`
--
ALTER TABLE `events_participants`
 ADD PRIMARY KEY (`event`,`participant`), ADD KEY `participant` (`participant`);

--
-- Indices de la tabla `fallacies`
--
ALTER TABLE `fallacies`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `friends`
--
ALTER TABLE `friends`
 ADD PRIMARY KEY (`user1`,`user2`), ADD KEY `user2` (`user2`);

--
-- Indices de la tabla `ideas`
--
ALTER TABLE `ideas`
 ADD PRIMARY KEY (`id`), ADD KEY `proposal` (`proposal`);

--
-- Indices de la tabla `ideas_time`
--
ALTER TABLE `ideas_time`
 ADD PRIMARY KEY (`idea`,`date`), ADD KEY `user` (`user`), ADD KEY `father_idea` (`father_idea`), ADD KEY `prebrother_idea` (`prebrother_idea`);

--
-- Indices de la tabla `ip_bloq`
--
ALTER TABLE `ip_bloq`
 ADD PRIMARY KEY (`banner`,`ip`,`init_date`);

--
-- Indices de la tabla `labels`
--
ALTER TABLE `labels`
 ADD PRIMARY KEY (`name`), ADD KEY `label_type` (`label_type`);

--
-- Indices de la tabla `labels_proposals`
--
ALTER TABLE `labels_proposals`
 ADD PRIMARY KEY (`proposal`,`label`,`labelled_sentence`,`n_label`), ADD KEY `label` (`label`), ADD KEY `creator` (`creator`);

--
-- Indices de la tabla `labels_votes`
--
ALTER TABLE `labels_votes`
 ADD PRIMARY KEY (`proposal`,`label`,`sentence`,`n_label`,`person`), ADD KEY `person` (`person`);

--
-- Indices de la tabla `label_types`
--
ALTER TABLE `label_types`
 ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `legal_text`
--
ALTER TABLE `legal_text`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `title` (`title`);

--
-- Indices de la tabla `members`
--
ALTER TABLE `members`
 ADD PRIMARY KEY (`person`);

--
-- Indices de la tabla `member_pays`
--
ALTER TABLE `member_pays`
 ADD PRIMARY KEY (`member`,`pay_date`);

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
 ADD PRIMARY KEY (`speaker`,`message_date`);

--
-- Indices de la tabla `message_recipient`
--
ALTER TABLE `message_recipient`
 ADD PRIMARY KEY (`speaker`,`message_date`,`recipient`), ADD KEY `recipient` (`recipient`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
 ADD PRIMARY KEY (`notif_date`,`notif_user`);

--
-- Indices de la tabla `options_surveys`
--
ALTER TABLE `options_surveys`
 ADD PRIMARY KEY (`survey`,`survey_option`);

--
-- Indices de la tabla `persons`
--
ALTER TABLE `persons`
 ADD PRIMARY KEY (`nif`), ADD KEY `city` (`city`), ADD KEY `province` (`province`);

--
-- Indices de la tabla `profile_comments`
--
ALTER TABLE `profile_comments`
 ADD PRIMARY KEY (`post_date`,`post_publisher`,`comment_date`,`comment_publisher`), ADD KEY `post_publisher` (`post_publisher`), ADD KEY `comment_publisher` (`comment_publisher`);

--
-- Indices de la tabla `profile_posts`
--
ALTER TABLE `profile_posts`
 ADD PRIMARY KEY (`post_date`,`post_publisher`);

--
-- Indices de la tabla `profile_posts_published`
--
ALTER TABLE `profile_posts_published`
 ADD PRIMARY KEY (`post_date`,`post_publisher`,`profile_user`,`publish_date`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
 ADD PRIMARY KEY (`id`), ADD KEY `creator` (`creator`), ADD KEY `city` (`city`), ADD KEY `province` (`province`);

--
-- Indices de la tabla `projects_comments`
--
ALTER TABLE `projects_comments`
 ADD PRIMARY KEY (`project_talk`,`creator`,`creation_date`), ADD KEY `creator` (`creator`);

--
-- Indices de la tabla `projects_participants`
--
ALTER TABLE `projects_participants`
 ADD PRIMARY KEY (`project`,`participant`), ADD KEY `participant` (`participant`);

--
-- Indices de la tabla `projects_talks`
--
ALTER TABLE `projects_talks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `title` (`title`), ADD KEY `project` (`project`), ADD KEY `creator` (`creator`), ADD KEY `survey` (`survey`);

--
-- Indices de la tabla `proposals`
--
ALTER TABLE `proposals`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `title` (`title`);

--
-- Indices de la tabla `provinces`
--
ALTER TABLE `provinces`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `id_state` (`id_state`);

--
-- Indices de la tabla `responsibilities`
--
ALTER TABLE `responsibilities`
 ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `id_country` (`id_country`);

--
-- Indices de la tabla `subscriptions_propopals_users`
--
ALTER TABLE `subscriptions_propopals_users`
 ADD PRIMARY KEY (`user`,`proposal`), ADD KEY `proposal` (`proposal`);

--
-- Indices de la tabla `surveys`
--
ALTER TABLE `surveys`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`name`), ADD KEY `tag_parent` (`tag_parent`);

--
-- Indices de la tabla `trackings`
--
ALTER TABLE `trackings`
 ADD PRIMARY KEY (`tracking_user`,`proposal`), ADD KEY `proposal` (`proposal`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`user`), ADD UNIQUE KEY `email` (`email`), ADD KEY `person` (`person`);

--
-- Indices de la tabla `votes`
--
ALTER TABLE `votes`
 ADD PRIMARY KEY (`enc_key`), ADD KEY `proposal` (`proposal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounting`
--
ALTER TABLE `accounting`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `actions_register`
--
ALTER TABLE `actions_register`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `donations`
--
ALTER TABLE `donations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fallacies`
--
ALTER TABLE `fallacies`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ideas`
--
ALTER TABLE `ideas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `projects_talks`
--
ALTER TABLE `projects_talks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proposals`
--
ALTER TABLE `proposals`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `provinces`
--
ALTER TABLE `provinces`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `states`
--
ALTER TABLE `states`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `surveys`
--
ALTER TABLE `surveys`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- Restricciones para tablas volcadas
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
