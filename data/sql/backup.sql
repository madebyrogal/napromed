-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               5.5.8 - MySQL Community Server (GPL)
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              8.3.0.4735
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Zrzut struktury tabela jolmar_dev.article
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_from` date NOT NULL,
  `article_category_id` bigint(20) DEFAULT NULL,
  `author` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_category_id_idx` (`article_category_id`),
  CONSTRAINT `article_article_category_id_article_category_id` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.article: ~4 rows (około)
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`, `date_from`, `article_category_id`, `author`, `hidden`, `created_at`, `updated_at`) VALUES
	(1, '2014-02-09', 1, '', 0, '2014-02-11 22:58:28', '2014-02-11 22:58:28'),
	(2, '2014-02-10', 2, '', 0, '2014-02-11 22:59:13', '2014-02-11 22:59:13'),
	(3, '2014-02-11', 3, '', 0, '2014-02-11 22:59:47', '2014-02-11 22:59:47'),
	(4, '2014-02-12', 1, '', 0, '2014-02-28 21:10:12', '2014-02-28 21:10:12');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.article_category
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE IF NOT EXISTS `article_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.article_category: ~4 rows (około)
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` (`id`, `hidden`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0);
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.article_category_translation
DROP TABLE IF EXISTS `article_category_translation`;
CREATE TABLE IF NOT EXISTS `article_category_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `article_category_translation_sluggable_idx` (`slug`,`lang`,`name`),
  CONSTRAINT `article_category_translation_id_article_category_id` FOREIGN KEY (`id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.article_category_translation: ~4 rows (około)
/*!40000 ALTER TABLE `article_category_translation` DISABLE KEYS */;
INSERT INTO `article_category_translation` (`id`, `name`, `lang`, `slug`) VALUES
	(1, 'Kategoria 1', 'pl', 'kategoria-1'),
	(2, 'Kategoria 2', 'pl', 'kategoria-2'),
	(3, 'Kategoria 3', 'pl', 'kategoria-3'),
	(4, 'Kategoria 4', 'pl', 'kategoria-4');
/*!40000 ALTER TABLE `article_category_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.article_translation
DROP TABLE IF EXISTS `article_translation`;
CREATE TABLE IF NOT EXISTS `article_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `sneak_peak` text COLLATE utf8_polish_ci,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `article_translation_sluggable_idx` (`slug`,`lang`,`title`),
  CONSTRAINT `article_translation_id_article_id` FOREIGN KEY (`id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.article_translation: ~4 rows (około)
/*!40000 ALTER TABLE `article_translation` DISABLE KEYS */;
INSERT INTO `article_translation` (`id`, `title`, `sneak_peak`, `body`, `lang`, `slug`) VALUES
	(1, 'Tytuł artykułu 1', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-1'),
	(2, 'Tytuł artykułu 2', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-2'),
	(3, 'Tytuł artykułu 3', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-3'),
	(4, 'Tytuł artykułu 4', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-4');
/*!40000 ALTER TABLE `article_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attachment
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE IF NOT EXISTS `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `file` text COLLATE utf8_polish_ci NOT NULL,
  `extenstion` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attachment: ~0 rows (około)
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attachment_translation
DROP TABLE IF EXISTS `attachment_translation`;
CREATE TABLE IF NOT EXISTS `attachment_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `attachment_translation_id_attachment_id` FOREIGN KEY (`id`) REFERENCES `attachment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attachment_translation: ~0 rows (około)
/*!40000 ALTER TABLE `attachment_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attribute_def
DROP TABLE IF EXISTS `attribute_def`;
CREATE TABLE IF NOT EXISTS `attribute_def` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id_idx` (`type_id`),
  CONSTRAINT `attribute_def_type_id_attribute_type_id` FOREIGN KEY (`type_id`) REFERENCES `attribute_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attribute_def: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_def` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attribute_def_translation
DROP TABLE IF EXISTS `attribute_def_translation`;
CREATE TABLE IF NOT EXISTS `attribute_def_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `attribute_def_translation_id_attribute_def_id` FOREIGN KEY (`id`) REFERENCES `attribute_def` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attribute_def_translation: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_def_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_def_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attribute_def_value
DROP TABLE IF EXISTS `attribute_def_value`;
CREATE TABLE IF NOT EXISTS `attribute_def_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_def_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_def_id_idx` (`attribute_def_id`),
  CONSTRAINT `attribute_def_value_attribute_def_id_attribute_def_id` FOREIGN KEY (`attribute_def_id`) REFERENCES `attribute_def` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attribute_def_value: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_def_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_def_value` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attribute_def_value_translation
DROP TABLE IF EXISTS `attribute_def_value_translation`;
CREATE TABLE IF NOT EXISTS `attribute_def_value_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `attribute_def_value_translation_id_attribute_def_value_id` FOREIGN KEY (`id`) REFERENCES `attribute_def_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attribute_def_value_translation: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_def_value_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_def_value_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attribute_type
DROP TABLE IF EXISTS `attribute_type`;
CREATE TABLE IF NOT EXISTS `attribute_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attribute_type: ~3 rows (około)
/*!40000 ALTER TABLE `attribute_type` DISABLE KEYS */;
INSERT INTO `attribute_type` (`id`, `name`) VALUES
	(1, 'value'),
	(2, 'single'),
	(3, 'multiple');
/*!40000 ALTER TABLE `attribute_type` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attribute_value
DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE IF NOT EXISTS `attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_def_id` bigint(20) NOT NULL,
  `attribute_def_value_id` bigint(20) DEFAULT NULL,
  `attribute_type_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_def_id_idx` (`attribute_def_id`),
  KEY `attribute_def_value_id_idx` (`attribute_def_value_id`),
  KEY `attribute_type_id_idx` (`attribute_type_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `attribute_value_attribute_def_id_attribute_def_id` FOREIGN KEY (`attribute_def_id`) REFERENCES `attribute_def` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_value_attribute_def_value_id_attribute_def_value_id` FOREIGN KEY (`attribute_def_value_id`) REFERENCES `attribute_def_value` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_value_attribute_type_id_attribute_type_id` FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attribute_value_product_id_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attribute_value: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.attribute_value_translation
DROP TABLE IF EXISTS `attribute_value_translation`;
CREATE TABLE IF NOT EXISTS `attribute_value_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `attribute_value_translation_id_attribute_value_id` FOREIGN KEY (`id`) REFERENCES `attribute_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.attribute_value_translation: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_value_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.carousel_home
DROP TABLE IF EXISTS `carousel_home`;
CREATE TABLE IF NOT EXISTS `carousel_home` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `number_of_slides` bigint(20) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.carousel_home: ~1 rows (około)
/*!40000 ALTER TABLE `carousel_home` DISABLE KEYS */;
INSERT INTO `carousel_home` (`id`, `name`, `number_of_slides`, `type`, `hidden`) VALUES
	(1, 'home', 4, 0, 0);
/*!40000 ALTER TABLE `carousel_home` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.contact_form_1
DROP TABLE IF EXISTS `contact_form_1`;
CREATE TABLE IF NOT EXISTS `contact_form_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `firm` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `message` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.contact_form_1: ~4 rows (około)
/*!40000 ALTER TABLE `contact_form_1` DISABLE KEYS */;
INSERT INTO `contact_form_1` (`id`, `name`, `subject`, `firm`, `phone`, `email`, `type`, `message`, `created_at`, `updated_at`) VALUES
	(1, 'Tomasz Rogalski', 'Testowy temat', '', '', 'rogalski.tomaszek@gmail.com', 0, 'Test', '2014-04-25 19:27:00', '2014-04-25 19:27:40'),
	(2, 'Tomasz Rogalski', 'Testowy temat 2', '', '', 'rogalski.tomaszek@gmail.com', 0, 'Test 2', '2014-04-25 19:31:00', '2014-04-25 19:31:07'),
	(3, 'Tomasz', 'Test', NULL, NULL, 'tomasz.rogalski@vp.pl', 0, 'Treść', '2014-04-28 22:36:29', '2014-04-28 22:36:29'),
	(4, 'Tomasz', 'Test z kontaktu', NULL, NULL, 'tomasz.rogalski@vp.pl', 0, 'ĄŚĆąśćó', '2014-04-28 22:37:32', '2014-04-28 22:37:32');
/*!40000 ALTER TABLE `contact_form_1` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.contact_form_2
DROP TABLE IF EXISTS `contact_form_2`;
CREATE TABLE IF NOT EXISTS `contact_form_2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `firm` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `message` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.contact_form_2: ~0 rows (około)
/*!40000 ALTER TABLE `contact_form_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_form_2` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.contact_form_3
DROP TABLE IF EXISTS `contact_form_3`;
CREATE TABLE IF NOT EXISTS `contact_form_3` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `firm` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `message` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.contact_form_3: ~0 rows (około)
/*!40000 ALTER TABLE `contact_form_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_form_3` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.gallery_1
DROP TABLE IF EXISTS `gallery_1`;
CREATE TABLE IF NOT EXISTS `gallery_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.gallery_1: ~0 rows (około)
/*!40000 ALTER TABLE `gallery_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_1` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.lang
DROP TABLE IF EXISTS `lang`;
CREATE TABLE IF NOT EXISTS `lang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `flag` text COLLATE utf8_polish_ci,
  `slug` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_position_sortable_idx` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.lang: ~4 rows (około)
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
INSERT INTO `lang` (`id`, `name`, `flag`, `slug`, `hidden`, `position`) VALUES
	(1, 'Polski', '/useruploads/images/flagi/flaga_pl.gif', 'pl', 0, 1),
	(2, 'Niemiecki', '/useruploads/images/flagi/flaga_de.gif', 'de', 1, 2),
	(3, 'Angielski', '/useruploads/images/flagi/flaga_en.gif', 'en', 1, 3),
	(4, 'Rosyjski', '/useruploads/images/flagi/flaga_ru.jpg', 'ru', 1, 4);
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.mail_data
DROP TABLE IF EXISTS `mail_data`;
CREATE TABLE IF NOT EXISTS `mail_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email_from` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `name_from` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.mail_data: ~1 rows (około)
/*!40000 ALTER TABLE `mail_data` DISABLE KEYS */;
INSERT INTO `mail_data` (`id`, `type`, `email_from`, `name_from`) VALUES
	(1, 'kontakt', 'rogalski.tomaszek@gmail.com', 'JolMar - Nieruchomości');
/*!40000 ALTER TABLE `mail_data` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.mail_data_translation
DROP TABLE IF EXISTS `mail_data_translation`;
CREATE TABLE IF NOT EXISTS `mail_data_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `mail_data_translation_id_mail_data_id` FOREIGN KEY (`id`) REFERENCES `mail_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.mail_data_translation: ~1 rows (około)
/*!40000 ALTER TABLE `mail_data_translation` DISABLE KEYS */;
INSERT INTO `mail_data_translation` (`id`, `subject`, `body`, `lang`) VALUES
	(1, 'Podziękowanie za przesłanie formularza', '<table border="0">\r\n<tbody>\r\n<tr style="background-color: #000000;">\r\n<td style="color: #fff;">\r\n<h2>Zdjęcie nagł&oacute;wkowe</h2>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Dziękujemy za zainteresowanie się naszą ofertą oraz wysłaniem formularza kontaktowego.</p>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Wkr&oacute;tce się z z Tobą skontaktujemy.</p>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Zesp&oacute;ł JolMar - Nieruchomości</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'pl');
/*!40000 ALTER TABLE `mail_data_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.media
DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `main` tinyint(1) DEFAULT '0',
  `file` text COLLATE utf8_polish_ci NOT NULL,
  `file_min1` text COLLATE utf8_polish_ci,
  `file_min2` text COLLATE utf8_polish_ci,
  `file_min3` text COLLATE utf8_polish_ci,
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_position_sortable_idx` (`position`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.media: ~10 rows (około)
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` (`id`, `module`, `parent_id`, `main`, `file`, `file_min1`, `file_min2`, `file_min3`, `position`) VALUES
	(96, 'carousel_home', 1, 0, '/useruploads/images/karuzela/jolmar_showcase_1.jpg', '', '', '', 17),
	(97, 'carousel_home', 1, 0, '/useruploads/images/karuzela/jolmar_showcase_2.jpg', '', '', '', 18),
	(98, 'carousel_home', 1, 0, '/useruploads/images/karuzela/jolmar_showcase_3.jpg', '', '', '', 19),
	(99, 'carousel_home', 1, 0, '/useruploads/images/karuzela/jolmar_showcase_4.jpg', '', '', '', 20),
	(100, 'carousel_home', 1, 0, '/useruploads/images/karuzela/jolmar_showcase_5.jpg', '', '', '', 21),
	(101, 'carousel_home', 1, 0, '/useruploads/images/karuzela/jolmar_showcase_6.jpg', '', '', '', 22),
	(102, 'carousel_home', 1, 0, '/useruploads/images/karuzela/jolmar_showcase_7.jpg', '', '', '', 23),
	(104, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 24),
	(105, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 25),
	(106, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 26);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.media_size
DROP TABLE IF EXISTS `media_size`;
CREATE TABLE IF NOT EXISTS `media_size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_cms_id` bigint(20) NOT NULL,
  `min1` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `min2` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `min3` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_cms_id_idx` (`module_cms_id`),
  CONSTRAINT `media_size_module_cms_id_module_cms_id` FOREIGN KEY (`module_cms_id`) REFERENCES `module_cms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.media_size: ~5 rows (około)
/*!40000 ALTER TABLE `media_size` DISABLE KEYS */;
INSERT INTO `media_size` (`id`, `module_cms_id`, `min1`, `min2`, `min3`) VALUES
	(1, 7, '450x346', '127x101', '98x78'),
	(2, 12, '', '', ''),
	(3, 13, '150x80', '', ''),
	(4, 18, '', '', ''),
	(5, 10, '269x249', '', '');
/*!40000 ALTER TABLE `media_size` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.media_translation
DROP TABLE IF EXISTS `media_translation`;
CREATE TABLE IF NOT EXISTS `media_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `alternative` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `link` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `media_translation_id_media_id` FOREIGN KEY (`id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.media_translation: ~11 rows (około)
/*!40000 ALTER TABLE `media_translation` DISABLE KEYS */;
INSERT INTO `media_translation` (`id`, `title`, `alternative`, `link`, `lang`) VALUES
	(73, '', '', '', 'pl'),
	(96, '', 'JolMar', '', 'pl'),
	(97, '', 'JolMar', '', 'pl'),
	(98, '', 'JolMar', '', 'pl'),
	(99, '', 'JolMar', '', 'pl'),
	(100, '', 'JolMar', '', 'pl'),
	(101, '', 'JolMar', '', 'pl'),
	(102, '', 'JolMar', '', 'pl'),
	(104, '', '', '', 'pl'),
	(105, '', '', '', 'pl'),
	(106, '', '', '', 'pl');
/*!40000 ALTER TABLE `media_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.meta_tag
DROP TABLE IF EXISTS `meta_tag`;
CREATE TABLE IF NOT EXISTS `meta_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.meta_tag: ~0 rows (około)
/*!40000 ALTER TABLE `meta_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_tag` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.meta_tag_translation
DROP TABLE IF EXISTS `meta_tag_translation`;
CREATE TABLE IF NOT EXISTS `meta_tag_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `key_words` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `meta_tag_translation_id_meta_tag_id` FOREIGN KEY (`id`) REFERENCES `meta_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.meta_tag_translation: ~0 rows (około)
/*!40000 ALTER TABLE `meta_tag_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_tag_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.module_cms
DROP TABLE IF EXISTS `module_cms`;
CREATE TABLE IF NOT EXISTS `module_cms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `route_name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `module_group_id` bigint(20) NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_cms_position_sortable_idx` (`position`),
  KEY `module_group_id_idx` (`module_group_id`),
  CONSTRAINT `module_cms_module_group_id_module_group_id` FOREIGN KEY (`module_group_id`) REFERENCES `module_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.module_cms: ~18 rows (około)
/*!40000 ALTER TABLE `module_cms` DISABLE KEYS */;
INSERT INTO `module_cms` (`id`, `name`, `route_name`, `module_group_id`, `hidden`, `position`) VALUES
	(1, 'Strony', 'page', 1, 0, 1),
	(2, 'Języki', 'lang', 2, 0, 2),
	(3, 'Kategorie', 'product_categories', 3, 1, NULL),
	(4, 'Grupy', 'sfGuardGroup', 4, 0, NULL),
	(5, 'Użytkownicy', 'sfGuardUser', 4, 0, NULL),
	(6, 'Uprawnienia', 'sfGuardPermission', 4, 0, 6),
	(7, 'Produkty', 'product', 3, 1, NULL),
	(8, 'Media (rozmiary)', 'media_size', 2, 0, 8),
	(9, 'Aktualności', 'news', 5, 1, NULL),
	(10, 'Artykuły', 'article', 5, 0, 10),
	(11, 'Kategorie artykułów', 'article_category', 5, 0, NULL),
	(12, 'Karuzela Home', 'carousel_home', 6, 0, 12),
	(13, 'Galerie', 'gallery_1', 6, 1, NULL),
	(14, 'Ustawienia wiadomości', 'mail_data', 7, 0, 13),
	(15, 'Formularz kontaktowy', 'contact_form_1', 7, 0, NULL),
	(16, 'Kontakt - Obiekty komercyjne', 'contact_form_2', 7, 1, NULL),
	(17, 'Kontakt - Kontakt', 'contact_form_3', 7, 1, NULL),
	(18, 'Biura', 'product_card', 3, 0, 17);
/*!40000 ALTER TABLE `module_cms` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.module_group
DROP TABLE IF EXISTS `module_group`;
CREATE TABLE IF NOT EXISTS `module_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_group_position_sortable_idx` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.module_group: ~7 rows (około)
/*!40000 ALTER TABLE `module_group` DISABLE KEYS */;
INSERT INTO `module_group` (`id`, `name`, `hidden`, `position`) VALUES
	(1, 'Strony', 0, 1),
	(2, 'Ustawienia', 0, 2),
	(3, 'Oferta', 1, NULL),
	(4, 'Użytkownicy', 0, NULL),
	(5, 'Strefa wiedzy', 0, NULL),
	(6, 'Media', 0, 6),
	(7, 'Wiadomości', 0, 7);
/*!40000 ALTER TABLE `module_group` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.module_group_permission
DROP TABLE IF EXISTS `module_group_permission`;
CREATE TABLE IF NOT EXISTS `module_group_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_group_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_group_id_idx` (`module_group_id`),
  KEY `permission_id_idx` (`permission_id`),
  CONSTRAINT `module_group_permission_module_group_id_module_group_id` FOREIGN KEY (`module_group_id`) REFERENCES `module_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `module_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.module_group_permission: ~12 rows (około)
/*!40000 ALTER TABLE `module_group_permission` DISABLE KEYS */;
INSERT INTO `module_group_permission` (`id`, `module_group_id`, `permission_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 3, 1),
	(5, 3, 2),
	(6, 4, 1),
	(8, 5, 1),
	(9, 5, 2),
	(10, 6, 1),
	(11, 6, 2),
	(12, 7, 1),
	(13, 7, 2);
/*!40000 ALTER TABLE `module_group_permission` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.module_permission
DROP TABLE IF EXISTS `module_permission`;
CREATE TABLE IF NOT EXISTS `module_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_id_idx` (`permission_id`),
  KEY `module_id_idx` (`module_id`),
  CONSTRAINT `module_permission_module_id_module_cms_id` FOREIGN KEY (`module_id`) REFERENCES `module_cms` (`id`),
  CONSTRAINT `module_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.module_permission: ~30 rows (około)
/*!40000 ALTER TABLE `module_permission` DISABLE KEYS */;
INSERT INTO `module_permission` (`id`, `module_id`, `permission_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 1),
	(4, 3, 1),
	(5, 3, 2),
	(6, 6, 1),
	(7, 4, 1),
	(8, 5, 1),
	(10, 7, 1),
	(11, 7, 2),
	(12, 8, 1),
	(13, 9, 1),
	(14, 9, 2),
	(15, 10, 1),
	(16, 10, 2),
	(17, 11, 1),
	(18, 12, 1),
	(19, 12, 2),
	(20, 13, 1),
	(21, 13, 2),
	(22, 14, 1),
	(23, 16, 1),
	(24, 16, 2),
	(25, 17, 1),
	(26, 17, 2),
	(27, 15, 1),
	(28, 15, 2),
	(29, 18, 1),
	(30, 18, 2),
	(31, 11, 2);
/*!40000 ALTER TABLE `module_permission` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.news
DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_from` date NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.news: ~0 rows (około)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.newsletter_address
DROP TABLE IF EXISTS `newsletter_address`;
CREATE TABLE IF NOT EXISTS `newsletter_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` text COLLATE utf8_polish_ci NOT NULL,
  `hash` varchar(40) COLLATE utf8_polish_ci DEFAULT NULL,
  `confirm` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.newsletter_address: ~0 rows (około)
/*!40000 ALTER TABLE `newsletter_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_address` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.news_translation
DROP TABLE IF EXISTS `news_translation`;
CREATE TABLE IF NOT EXISTS `news_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `sneak_peak` text COLLATE utf8_polish_ci,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `news_translation_sluggable_idx` (`slug`,`lang`,`title`),
  CONSTRAINT `news_translation_id_news_id` FOREIGN KEY (`id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.news_translation: ~0 rows (około)
/*!40000 ALTER TABLE `news_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.page
DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layout` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `route_name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `route_hash` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `not_in_menu` tinyint(1) DEFAULT '0',
  `absolute_link` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_hash` (`route_hash`),
  UNIQUE KEY `page_position_sortable_idx` (`position`,`parent_id`),
  KEY `parent_id_idx` (`parent_id`),
  CONSTRAINT `page_parent_id_page_id` FOREIGN KEY (`parent_id`) REFERENCES `page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.page: ~10 rows (około)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `layout`, `route_name`, `route_hash`, `parent_id`, `hidden`, `not_in_menu`, `absolute_link`, `position`) VALUES
	(1, 'layoutHP', 'root', 'homepage', NULL, 0, 0, NULL, 1),
	(2, 'layoutHP', 'homepage', 'home', 1, 0, 0, '', 1),
	(3, 'layout2Col', 'staticPage', 'about', 1, 0, 0, NULL, 2),
	(4, 'layoutOffer', 'offer', 'offer', 1, 0, 0, NULL, 3),
	(5, 'layoutOffer', 'offer_complex', 'admin_complex', 4, 0, 0, NULL, 4),
	(7, 'layoutOffer', 'offer_bookkeep', 'admin_bookkeep', 4, 0, 0, NULL, 6),
	(8, 'layoutContact', 'contact', 'contact', 1, 0, 0, NULL, 10),
	(10, 'layoutOffer', 'offer_technical', 'admin_technical', 4, 0, 0, NULL, 7),
	(11, 'layout2Col', 'article', 'article', 1, 0, 0, NULL, 8),
	(12, 'layout', 'outSite', 'clientSite', 1, 0, 0, 'http://jolmarnieruchomosci.pl', 9);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.page_translation
DROP TABLE IF EXISTS `page_translation`;
CREATE TABLE IF NOT EXISTS `page_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `subtitle` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_polish_ci,
  `meta_keywords` text COLLATE utf8_polish_ci,
  `meta_description` text COLLATE utf8_polish_ci,
  `template` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `page_translation_sluggable_idx` (`slug`,`lang`,`title`),
  CONSTRAINT `page_translation_id_page_id` FOREIGN KEY (`id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.page_translation: ~10 rows (około)
/*!40000 ALTER TABLE `page_translation` DISABLE KEYS */;
INSERT INTO `page_translation` (`id`, `title`, `subtitle`, `meta_title`, `meta_keywords`, `meta_description`, `template`, `lang`, `slug`) VALUES
	(1, 'Home', 'Property Menagment', 'Hossa', 'Hossa', 'Hossa', 'home', 'pl', 'hossa'),
	(2, 'Home', '', 'Zarządzenie nieruchomościami - Jolmar', 'jolmar, zarządzanie nieruchomościami, nieruchomości, wspólnota mieszkaniowa, administracja nieruchomościami, system utrzymania nieruchomości, księgowość', 'Firma JOLMAR Nieruchomości Sp.z o.o jest dynamicznie rozwijającą się firmą zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi. Oferujemy pakiety administracji kompleksowej, administracyjno-księgowy i administracyjno-techniczny.', 'home', 'pl', 'home'),
	(3, 'O nas', '', 'O nas - Zarządzenie nieruchomościami - Jolmar', 'jolmar, zarządzanie nieruchomościami, nieruchomości, wspólnota mieszkaniowa, administracja nieruchomościami, system utrzymania nieruchomości, księgowość', 'Firma JOLMAR Nieruchomości Sp.z o.o jest dynamicznie rozwijającą się firmą zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi. Oferujemy pakiety administracji kompleksowej, administracyjno-księgowy i administracyjno-techniczny.', 'about', 'pl', 'o-nas'),
	(4, 'Oferta', '', 'Oferta - Zarządzenie nieruchomościami - Jolmar', 'jolmar, zarządzanie nieruchomościami, nieruchomości, wspólnota mieszkaniowa, administracja nieruchomościami, system utrzymania nieruchomości, księgowość', 'Firma JOLMAR Nieruchomości Sp.z o.o jest dynamicznie rozwijającą się firmą zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi. Oferujemy pakiety administracji kompleksowej, administracyjno-księgowy i administracyjno-techniczny.', 'index', 'pl', 'oferta'),
	(5, 'Pakiet administracji kompleksowej', '', 'Pakiet administracji kompleksowej - Zarządzenie nieruchomościami - Jolmar', 'administracja kompleksowa, jolmar, zarządzanie nieruchomościami, nieruchomości, wspólnota mieszkaniowa, administracja nieruchomościami, system utrzymania nieruchomości, księgowość', 'Firma JOLMAR Nieruchomości Sp.z o.o jest dynamicznie rozwijającą się firmą zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi. Oferujemy pakiety administracji kompleksowej, administracyjno-księgowy i administracyjno-techniczny.', 'index', 'pl', 'pakiet-administracji-kompleksowej'),
	(7, 'Pakiet administracyjno-księgowy', '', 'Pakiet administracyjno-księgowy - Zarządzenie nieruchomościami - Jolmar', 'pakiet administracyjno-księgowy, jolmar, zarządzanie nieruchomościami, nieruchomości, wspólnota mieszkaniowa, administracja nieruchomościami, system utrzymania nieruchomości, księgowość', 'Firma JOLMAR Nieruchomości Sp.z o.o jest dynamicznie rozwijającą się firmą zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi. Oferujemy pakiety administracji kompleksowej, administracyjno-księgowy i administracyjno-techniczny.', 'index', 'pl', 'pakiet-administracyjno-ksiegowy'),
	(8, 'Kontakt', 'Property Menagment', 'Kontakt', 'Kontakt', 'Kontakt', 'index', 'pl', 'kontakt'),
	(10, 'Pakiet administracyjno-techniczny', '', 'Pakiet administracyjno-techniczny - Zarządzenie nieruchomościami - Jolmar', 'pakiet administracyjno-techniczny, jolmar, zarządzanie nieruchomościami, nieruchomości, wspólnota mieszkaniowa, administracja nieruchomościami, system utrzymania nieruchomości, księgowość', 'Firma JOLMAR Nieruchomości Sp.z o.o jest dynamicznie rozwijającą się firmą zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi. Oferujemy pakiety administracji kompleksowej, administracyjno-księgowy i administracyjno-techniczny.', 'index', 'pl', 'pakiet-administracyjno-techniczny'),
	(11, 'Strefa wiedzy', '', 'Strefa wiedzy - Zarządzenie nieruchomościami - Jolmar', 'jolmar, zarządzanie nieruchomościami, nieruchomości, wspólnota mieszkaniowa, administracja nieruchomościami, system utrzymania nieruchomości, księgowość', 'Firma JOLMAR Nieruchomości Sp.z o.o jest dynamicznie rozwijającą się firmą zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi. Oferujemy pakiety administracji kompleksowej, administracyjno-księgowy i administracyjno-techniczny.', 'index', 'pl', 'strefa-wiedzy'),
	(12, 'Strefa klienta', '', 'Strefa klienta - Zarządzenie nieruchomościami - Jolmar', 'jolmar, zarządzanie nieruchomościami, nieruchomości, wspólnota mieszkaniowa, administracja nieruchomościami, system utrzymania nieruchomości, księgowość', 'Firma JOLMAR Nieruchomości Sp.z o.o jest dynamicznie rozwijającą się firmą zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi. Oferujemy pakiety administracji kompleksowej, administracyjno-księgowy i administracyjno-techniczny.', 'index', 'pl', 'strefa-klienta');
/*!40000 ALTER TABLE `page_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_position_sortable_idx` (`position`,`category_id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `product_category_id_product_categories_id` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.product: ~0 rows (około)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.product_card
DROP TABLE IF EXISTS `product_card`;
CREATE TABLE IF NOT EXISTS `product_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_card_position_sortable_idx` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.product_card: ~0 rows (około)
/*!40000 ALTER TABLE `product_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_card` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.product_card_translation
DROP TABLE IF EXISTS `product_card_translation`;
CREATE TABLE IF NOT EXISTS `product_card_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `opis_2` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `product_card_translation_sluggable_idx` (`slug`,`lang`,`nazwa`),
  CONSTRAINT `product_card_translation_id_product_card_id` FOREIGN KEY (`id`) REFERENCES `product_card` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.product_card_translation: ~0 rows (około)
/*!40000 ALTER TABLE `product_card_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_card_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.product_categories
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_categories_position_sortable_idx` (`position`,`parent_id`),
  KEY `parent_id_idx` (`parent_id`),
  CONSTRAINT `product_categories_parent_id_product_categories_id` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.product_categories: ~0 rows (około)
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.product_categories_translation
DROP TABLE IF EXISTS `product_categories_translation`;
CREATE TABLE IF NOT EXISTS `product_categories_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `product_categories_translation_sluggable_idx` (`slug`,`lang`,`name`),
  CONSTRAINT `product_categories_translation_id_product_categories_id` FOREIGN KEY (`id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.product_categories_translation: ~0 rows (około)
/*!40000 ALTER TABLE `product_categories_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.product_translation
DROP TABLE IF EXISTS `product_translation`;
CREATE TABLE IF NOT EXISTS `product_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `info` text COLLATE utf8_polish_ci,
  `price` float(18,2) DEFAULT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `product_translation_sluggable_idx` (`slug`,`lang`,`name`),
  CONSTRAINT `product_translation_id_product_id` FOREIGN KEY (`id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.product_translation: ~0 rows (około)
/*!40000 ALTER TABLE `product_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_translation` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.sf_guard_forgot_password
DROP TABLE IF EXISTS `sf_guard_forgot_password`;
CREATE TABLE IF NOT EXISTS `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.sf_guard_forgot_password: ~0 rows (około)
/*!40000 ALTER TABLE `sf_guard_forgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_forgot_password` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.sf_guard_group
DROP TABLE IF EXISTS `sf_guard_group`;
CREATE TABLE IF NOT EXISTS `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.sf_guard_group: ~3 rows (około)
/*!40000 ALTER TABLE `sf_guard_group` DISABLE KEYS */;
INSERT INTO `sf_guard_group` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator group', '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
	(2, 'user', 'User group', '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
	(3, 'author', 'Grupa autorów publikacji', '2013-02-27 12:57:50', '2013-02-27 12:57:50');
/*!40000 ALTER TABLE `sf_guard_group` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.sf_guard_group_permission
DROP TABLE IF EXISTS `sf_guard_group_permission`;
CREATE TABLE IF NOT EXISTS `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.sf_guard_group_permission: ~3 rows (około)
/*!40000 ALTER TABLE `sf_guard_group_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_group_permission` (`group_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
	(2, 2, '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
	(3, 3, '2013-02-27 12:57:50', '2013-02-27 12:57:50');
/*!40000 ALTER TABLE `sf_guard_group_permission` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.sf_guard_permission
DROP TABLE IF EXISTS `sf_guard_permission`;
CREATE TABLE IF NOT EXISTS `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.sf_guard_permission: ~3 rows (około)
/*!40000 ALTER TABLE `sf_guard_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator permission', '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
	(2, 'user', 'User permission', '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
	(3, 'author', 'Uprawnienia autora publikacji', '2013-02-27 12:53:25', '2013-02-27 12:57:19');
/*!40000 ALTER TABLE `sf_guard_permission` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.sf_guard_remember_key
DROP TABLE IF EXISTS `sf_guard_remember_key`;
CREATE TABLE IF NOT EXISTS `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.sf_guard_remember_key: ~1 rows (około)
/*!40000 ALTER TABLE `sf_guard_remember_key` DISABLE KEYS */;
INSERT INTO `sf_guard_remember_key` (`id`, `user_id`, `remember_key`, `ip_address`, `created_at`, `updated_at`) VALUES
	(2, 1, 'jf85rz7e0eo8848ogcgw0w8o0wkg8g4', '127.0.0.1', '2014-02-11 22:31:24', '2014-02-11 22:31:24');
/*!40000 ALTER TABLE `sf_guard_remember_key` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.sf_guard_user
DROP TABLE IF EXISTS `sf_guard_user`;
CREATE TABLE IF NOT EXISTS `sf_guard_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `username` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `algorithm` varchar(128) COLLATE utf8_polish_ci NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_address` (`email_address`),
  UNIQUE KEY `username` (`username`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.sf_guard_user: ~4 rows (około)
/*!40000 ALTER TABLE `sf_guard_user` DISABLE KEYS */;
INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`) VALUES
	(1, 'Tomasz', 'Rogalski', 'rogalski.tomaszek@gmail.com', 'admin', 'sha1', '1d494bdbba5a19a90d24ff50abb520ce', '9adad637317cc4ba87601de12b209d121be58a70', 1, 1, '2014-04-28 22:35:30', '2012-11-14 20:33:26', '2014-04-28 22:35:30'),
	(3, 'Joanna', 'Rogalska', 'rogalska.joasia@gmail.com', 'asia', 'sha1', '4963b9ec301b197d994a5acbd350a844', '93ebd8811fb1b117fd228d42d497a98554e80e5a', 1, 0, '2013-05-06 12:38:36', '2013-02-27 13:34:12', '2013-05-06 12:38:36'),
	(4, 'Jolanta', 'Dec', 'jolantadecnieruchomosci@gmail.com', 'jola', 'sha1', 'f5d5bf0f8f982cd66a0d7e30e06b0baa', '9d5bba0d287f26d0b4f5b50e2a38d373c83e905f', 1, 0, '2014-04-25 19:59:55', '2014-02-11 23:06:57', '2014-04-25 19:59:55'),
	(5, 'Artur', 'Dec', 'arturdec@gmail.com', 'artur', 'sha1', 'ff6f8430b8fcb5d46f45d7be58da368d', '847ce2bd1550a8d964ad49ec08321d9f042c9e16', 1, 0, NULL, '2014-02-11 23:09:16', '2014-02-11 23:09:16');
/*!40000 ALTER TABLE `sf_guard_user` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.sf_guard_user_group
DROP TABLE IF EXISTS `sf_guard_user_group`;
CREATE TABLE IF NOT EXISTS `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`),
  CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.sf_guard_user_group: ~4 rows (około)
/*!40000 ALTER TABLE `sf_guard_user_group` DISABLE KEYS */;
INSERT INTO `sf_guard_user_group` (`user_id`, `group_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
	(3, 3, '2013-02-27 13:34:12', '2013-02-27 13:34:12'),
	(4, 2, '2014-02-11 23:06:57', '2014-02-11 23:06:57'),
	(5, 2, '2014-02-11 23:09:16', '2014-02-11 23:09:16');
/*!40000 ALTER TABLE `sf_guard_user_group` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.sf_guard_user_permission
DROP TABLE IF EXISTS `sf_guard_user_permission`;
CREATE TABLE IF NOT EXISTS `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`),
  CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.sf_guard_user_permission: ~3 rows (około)
/*!40000 ALTER TABLE `sf_guard_user_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_user_permission` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(3, 3, '2013-02-27 13:34:12', '2013-02-27 13:34:12'),
	(4, 2, '2014-02-11 23:06:57', '2014-02-11 23:06:57'),
	(5, 2, '2014-02-11 23:09:16', '2014-02-11 23:09:16');
/*!40000 ALTER TABLE `sf_guard_user_permission` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.text
DROP TABLE IF EXISTS `text`;
CREATE TABLE IF NOT EXISTS `text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.text: ~26 rows (około)
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` (`id`, `module`, `parent_id`, `hidden`) VALUES
	(33, 'page', 2, 0),
	(34, 'page', 2, 0),
	(35, 'page', 2, 0),
	(36, 'page', 2, 0),
	(37, 'page', 2, 0),
	(38, 'page', 2, 0),
	(39, 'page', 2, 0),
	(40, 'page', 2, 0),
	(41, 'page', 3, 0),
	(42, 'page', 3, 0),
	(43, 'page', 3, 0),
	(44, 'page', 5, 0),
	(45, 'page', 7, 0),
	(46, 'page', 10, 0),
	(47, 'page', 5, 0),
	(48, 'page', 5, 0),
	(49, 'page', 7, 0),
	(50, 'page', 7, 0),
	(51, 'page', 10, 0),
	(52, 'page', 10, 0),
	(53, 'page', 11, 0),
	(54, 'page', 8, 0),
	(55, 'page', 8, 0),
	(56, 'page', 8, 0),
	(57, 'page', 8, 0),
	(58, 'page', 8, 0);
/*!40000 ALTER TABLE `text` ENABLE KEYS */;


-- Zrzut struktury tabela jolmar_dev.text_translation
DROP TABLE IF EXISTS `text_translation`;
CREATE TABLE IF NOT EXISTS `text_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `context` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `text_translation_id_text_id` FOREIGN KEY (`id`) REFERENCES `text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli jolmar_dev.text_translation: ~26 rows (około)
/*!40000 ALTER TABLE `text_translation` DISABLE KEYS */;
INSERT INTO `text_translation` (`id`, `title`, `context`, `lang`) VALUES
	(33, 'Nasza oferta', '<p>Nasza oferta</p>', 'pl'),
	(34, 'Wybierz jeden z pakietów', '<p>Wybierz jeden z standardowych pakiet&oacute;w, kt&oacute;ry będzie najlepiej odpowiadał Twoim potrzebą, lub skontakt&oacute;j się z nami w celu skomponowania oferty specjalnie dla Ciebie</p>', 'pl'),
	(35, 'pakiet administracji kompleksowej', '<p>Kompleksowa obsługa Twojej nieruchomości. Możesz spać spokojnie.</p>', 'pl'),
	(36, 'pakiet administracyjno-księgowy', '<p>Nie masz administratora lub księgowej? Ten pakiet jest dla Ciebie.</p>', 'pl'),
	(37, 'pakiet administracyjno-techniczny', '<p>Czysty i zadbany dom. Prowadzenie niezbędnej dokumentacji.</p>', 'pl'),
	(38, 'zapytaj o ofertę dla siebie', '<p>zapytaj o ofertę dla siebie</p>', 'pl'),
	(39, 'Zapytaj o ofertę dla siebie', '<p>Prosimy o wypełnienie formularza i przedstawienie swoich oczekiwań, a postaramy się im sprostać.</p>', 'pl'),
	(40, 'Strefa wiedzy', '<p>Poniżej przedstawiamy najnowsze artykuły oraz wnioski poparte naszymi doświadczeniami.</p>', 'pl'),
	(41, 'O nas', '<p>Poznaj nas bliżej</p>', 'pl'),
	(42, '', '<p><b>Firma&nbsp; JOLMAR Nieruchomości Sp. z o.o. jest nowopowstałą dynamicznie rozwijającą się firmą rodzinną zajmującą się zarządzaniem i administrowaniem nieruchomościami mieszkalnymi.</b></p>', 'pl'),
	(43, '', '<p>Naszym celem jest stworzenie systemu zarządzania dostępnego dla właścicieli lokali, nieruchomości kt&oacute;rzy cenią sobie rodzinną atmosferę i oszczędny ale gospodarczy system utrzymania nieruchomości.</p>\r\n<p>W wieloletniej pracy na stanowisku administratora zdobyliśmy cenne doświadczenie i wiedzę w zakresie nowoczesnych standard&oacute;w zarządzania nieruchomościami. W swojej pracy kierujemy się przede wszystkim zasadą wsp&oacute;łpracy z Klientem. Zdajemy sobie sprawę, że to dzięki zaufaniu członk&oacute;w wsp&oacute;lnot funkcjonuje firma zarządzająca.</p>\r\n<p>Jesteśmy przekonani, iż wsp&oacute;łpraca z naszą firmą spełni wszelkie oczekiwania jakie wiążą Państwo z profesjonalnym zarządcą nieruchomości.</p>\r\n<p>Zapraszamy do wsp&oacute;łpracy.</p>', 'pl'),
	(44, 'Oferta', '<p>już od <span>0,45 zł/m2</span> &ndash; do negocjacji</p>', 'pl'),
	(45, 'Oferta', '<p>już od <span>0,45 zł/m2</span> &ndash; do negocjacji</p>', 'pl'),
	(46, 'Oferta', '<p>już od <span>0,45 zł/m2</span> &ndash; do negocjacji</p>', 'pl'),
	(47, 'Pakiet administracji kompleksowej', '<p>W ramach niniejszego pakietu oferujemy Państwu następujące usługi:</p>', 'pl'),
	(48, '', '<ul>\r\n<li><span>1 </span>Zorganizowanie pierwszego zebrania wsp&oacute;lnoty</li>\r\n<li><span>2 </span>Dokonanie rejestracji wsp&oacute;lnoty w Urzędzie Statystycznym i Skarbowym</li>\r\n<li><span>3 </span>Prowadzenie i aktualizacja dokument&oacute;w lokalowych w tym spisu właścicieli i najemc&oacute;w</li>\r\n<li><span>4 </span>Dokonywanie naliczeń i przygotowywanie rachunk&oacute;w dla właścicieli, lub informacji o wysokości miesięcznej zaliczki</li>\r\n<li><span>5 </span>Rozliczanie medi&oacute;w</li>\r\n<li><span>6 </span>Prowadzenie książki obiektu budowlanego oraz dokumentacji związanej wymaganej przez przepisy prawa budowlanego przez Inspktor&oacute;w Budowlanych opiekujących się budynkiem pod względem technicznym</li>\r\n<li><span>7 </span>Okresowe przeglądy nieruchomości i urządzeń stanowiących jej wyposażenie techniczne zgodnie z wymaganiami prawa budowlanego</li>\r\n<li><span>8 </span>Utrzymanie terenu wok&oacute;ł posesji &ndash; zamiatanie, odśnieżanie, tereny zielone, zgodnie z zaleceniem Zarządu</li>\r\n<li><span>9 </span>Sprzątanie korytarzy klatek schodowych, zgodnie z zaleceniem Zarządu</li>\r\n<li><span>10 </span>Wykonanie przegląd&oacute;w kominiarskich, gazowych, og&oacute;lnobudowlanych</li>\r\n<li><span>11 </span>Bieżące konserwacje i drobne naprawy, zakup i wymiana żar&oacute;wek</li>\r\n<li><span>12 </span>Zawieranie i negocjowanie um&oacute;w z podmiotami gospodarczymi na dostawę koniecznych medi&oacute;w</li>\r\n<li><span>13 </span>Zawieranie i negocjowanie um&oacute;w na realizację zadań inwestycyjnych i remontowych &ndash; nadzorowanie, odbi&oacute;r prac i rozliczenie um&oacute;w</li>\r\n<li><span>14 </span>Usuwanie awarii i ich skutk&oacute;w na nieruchomości wsp&oacute;lnej na warunkach określonych umowie o zarządzanie</li>\r\n<li><span>15 </span>Ubezpieczenie budynku położonego na tej nieruchomości zgodnie z podejmowanymi w tym zakresie uchwałami Wsp&oacute;lnoty</li>\r\n<li><span>16 </span>Opłacanie podatk&oacute;w i innych opłat publiczno-prawnych</li>\r\n<li><span>17 </span>Przygotowywanie projekt&oacute;w planu gospodarczego, w tym przychod&oacute;w i wydatk&oacute;w z Funduszu Remontowego, na podstawie informacji oraz zleceń przekazywanych na piśmie przez Zarząd Wsp&oacute;lnoty</li>\r\n<li><span>18 </span>Prowadzenie rachunku bankowego Wsp&oacute;lnoty i dokonywanie bieżących rozliczeń poprzez ten rachunek</li>\r\n<li><span>19 </span>Prowadzenie ewidencji pozaksięgowej Wsp&oacute;lnoty</li>\r\n<li><span>20 </span>Pobieranie i windykacja należności z tytułu pożytk&oacute;w jak i innych przychod&oacute;w oraz należności wynikających z koszt&oacute;w zarządu i funduszu remontowego</li>\r\n<li><span>21 </span>Zwoływanie i organizowanie corocznego zebrania, najp&oacute;źniej do końca marca każdego roku</li>\r\n<li><span>22 </span>Składanie rocznych bilans&oacute;w i rozliczeń finansowych</li>\r\n<li><span>23 </span>Prowadzenie sprawozdawczości wobec Zarządu Wsp&oacute;lnoty Właścicieli</li>\r\n<li><span>24 </span>Reprezentowanie wsp&oacute;lnoty na zewnątrz</li>\r\n</ul>\r\n<p class="price">już od 0,45 zł/m2 &ndash; do negocjacj</p>', 'pl'),
	(49, 'Pakiet administracjno-księgowy', '<p>W ramach niniejszego pakietu oferujemy Państwu następujące usługi:</p>', 'pl'),
	(50, '', '<ul>\r\n<li><span>1 </span>Prowadzenie i aktualizacja dokument&oacute;w lokalowych w tym spisu właścicieli i najemc&oacute;w</li>\r\n<li><span>2 </span>Dokonywanie naliczeń i przygotowywanie rachunk&oacute;w dla właścicieli, lub informacji o wysokości miesięcznej zaliczki</li>\r\n<li><span>3 </span>Ubezpieczenie budynku położonego na tej nieruchomości zgodnie z podejmowanymi w tym zakresie uchwałami Wsp&oacute;lnoty</li>\r\n<li><span>4 </span>Opłacanie podatk&oacute;w i iinych opłat publiczno-prawnych</li>\r\n<li><span>5 </span>Przygotowywanie projekt&oacute;w planu gospodarczego, w tym przychod&oacute;w i wydatk&oacute;w z Funduszu Remontowego, na podstawie informacji oraz zleceń przekazywanych na piśmie przez Zarząd Wsp&oacute;lnoty</li>\r\n<li><span>6 </span>Prowadzenie rachunku bankowego Wsp&oacute;lnoty i dokonywanie bieżących rozliczeń poprzez ten rachunek</li>\r\n<li><span>7 </span>Prowadzenie ewidencji pozaksięgowej Wsp&oacute;lnoty</li>\r\n<li><span>8 </span>Pobieranie i windykacja należności z tytułu pożytk&oacute;w jak i innych przychod&oacute;w oraz należności wynikających z koszt&oacute;w zarządu i funduszu remontowego</li>\r\n<li><span>9 </span>Składanie rocznych bilans&oacute;w i rozliczeń finansowych</li>\r\n<li><span>10 </span>Zwoływanie i organizowanie corocznego zebrania, najp&oacute;źniej do końca marca każdego roku</li>\r\n<li><span>11 </span>Prowadzenie sprawozdawczości wobec Zarządu Wsp&oacute;lnoty Właścicieli</li>\r\n</ul>\r\n<p class="price">już od 0,45 zł/m2 &ndash; do negocjacj</p>', 'pl'),
	(51, 'Pakiet administracyjno-techniczny', '<p>W ramach niniejszego pakietu oferujemy Państwu następujące usługi:</p>', 'pl'),
	(52, '', '<ul>\r\n<li><span>1 </span>Prowadzenie i aktualizacja dokument&oacute;w lokalowych w tym spisu właścicieli i najemc&oacute;w</li>\r\n<li><span>2 </span>Prowadzenie książki obiektu budowlanego oraz dokumentacji związanej wymaganej przez przepisy prawa budowlanego przez Inspektor&oacute;w Budowlanych opiekujących się budynkiem pod względem technicznym</li>\r\n<li><span>3 </span>Kontrolę techniczną i okresowe przeglądy nieruchomości i urządzeń stanowiących jej wyposażenie techniczne zgodnie z wymaganiami prawa budowlanego</li>\r\n<li><span>4 </span>Utrzymanie terenu wok&oacute;ł posesji &ndash; zamiatanie, odśnieżanie, tereny zielone, zgodnie z zaleceniem Zarządu</li>\r\n<li><span>5 </span>Sprzątanie korytarzy klatek schodowych, zgodnie z zaleceniem Zarządu</li>\r\n<li><span>6 </span>Wykonanie przegląd&oacute;w kominiarskich, gazowych, og&oacute;lnobudowlanych</li>\r\n<li><span>7 </span>Bieżące konserwacje i drobne naprawy, zakup i wymiana żar&oacute;wek</li>\r\n<li><span>8 </span>Zawieranie i negocjowanie um&oacute;w z podmiotami gospodarczymi na dostawę koniecznych medi&oacute;w</li>\r\n<li><span>9 </span>Zawieranie i negocjowanie um&oacute;w na realizację zadań inwestycyjnych i remontowych &ndash; nadzorowanie, odbi&oacute;r prac i rozliczenie um&oacute;w</li>\r\n<li><span>10 </span>Usuwanie awarii i ich skutk&oacute;w na nieruchomości wsp&oacute;lnej na warunkach określonych umowie o zarządzanie</li>\r\n<li><span>11 </span>Reprezentowanie wsp&oacute;lnoty na zewnątrz</li>\r\n</ul>\r\n<p class="price">już od 0,45 zł/m2 &ndash; do negocjacj</p>', 'pl'),
	(53, 'STREFA WIEDZY', '<p>Artykuły i porady</p>', 'pl'),
	(54, 'Kontakt', '<p>Zapraszamy do kontaktu</p>', 'pl'),
	(55, 'Jolmar Nieruchomości Sp. z o.o.', '<p>Wybierz jedną z najwygodnieszych form kontaktu dla Ciebie. Postaramy się jak najszybciej odpowiedzieć.</p>', 'pl'),
	(56, 'Adres', '<p>Kamionki, ul. Waniliowa 44, 62-023 Gądki<br /> <span> NIP: 777-322-76-95, REGON: 302215422<br /> KRS: 0000432803, Nr licencji zawodowej: 17070 </span></p>', 'pl'),
	(57, 'Telefon', '<p>+48 604 13 47 16</p>', 'pl'),
	(58, 'Email', '<p><a title="Napisz do nas" href="mailto:jolantadecnieruchomosci@gmail.com">jolantadecnieruchomosci@gmail.com</a></p>', 'pl');
/*!40000 ALTER TABLE `text_translation` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
