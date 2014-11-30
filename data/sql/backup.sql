-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               5.5.8 - MySQL Community Server (GPL)
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Zrzut struktury tabela napromed_dev.article
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

-- Zrzucanie danych dla tabeli napromed_dev.article: ~4 rows (około)
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`, `date_from`, `article_category_id`, `author`, `hidden`, `created_at`, `updated_at`) VALUES
	(1, '2014-02-09', 1, '', 0, '2014-02-11 22:58:28', '2014-02-11 22:58:28'),
	(2, '2014-02-10', 2, '', 0, '2014-02-11 22:59:13', '2014-02-11 22:59:13'),
	(3, '2014-02-11', 3, '', 0, '2014-02-11 22:59:47', '2014-02-11 22:59:47'),
	(4, '2014-02-12', 1, '', 0, '2014-02-28 21:10:12', '2014-02-28 21:10:12');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.article_category
CREATE TABLE IF NOT EXISTS `article_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.article_category: ~4 rows (około)
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` (`id`, `hidden`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0);
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.article_category_translation
CREATE TABLE IF NOT EXISTS `article_category_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `article_category_translation_sluggable_idx` (`slug`,`lang`,`name`),
  CONSTRAINT `article_category_translation_id_article_category_id` FOREIGN KEY (`id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.article_category_translation: ~4 rows (około)
/*!40000 ALTER TABLE `article_category_translation` DISABLE KEYS */;
INSERT INTO `article_category_translation` (`id`, `name`, `lang`, `slug`) VALUES
	(1, 'Kategoria 1', 'pl', 'kategoria-1'),
	(2, 'Kategoria 2', 'pl', 'kategoria-2'),
	(3, 'Kategoria 3', 'pl', 'kategoria-3'),
	(4, 'Kategoria 4', 'pl', 'kategoria-4');
/*!40000 ALTER TABLE `article_category_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.article_translation
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

-- Zrzucanie danych dla tabeli napromed_dev.article_translation: ~4 rows (około)
/*!40000 ALTER TABLE `article_translation` DISABLE KEYS */;
INSERT INTO `article_translation` (`id`, `title`, `sneak_peak`, `body`, `lang`, `slug`) VALUES
	(1, 'Tytuł artykułu 1', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-1'),
	(2, 'Tytuł artykułu 2', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-2'),
	(3, 'Tytuł artykułu 3', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-3'),
	(4, 'Tytuł artykułu 4', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-4');
/*!40000 ALTER TABLE `article_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attachment
CREATE TABLE IF NOT EXISTS `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `file` text COLLATE utf8_polish_ci NOT NULL,
  `extenstion` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.attachment: ~0 rows (około)
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attachment_translation
CREATE TABLE IF NOT EXISTS `attachment_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `attachment_translation_id_attachment_id` FOREIGN KEY (`id`) REFERENCES `attachment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.attachment_translation: ~0 rows (około)
/*!40000 ALTER TABLE `attachment_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attribute_def
CREATE TABLE IF NOT EXISTS `attribute_def` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id_idx` (`type_id`),
  CONSTRAINT `attribute_def_type_id_attribute_type_id` FOREIGN KEY (`type_id`) REFERENCES `attribute_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.attribute_def: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_def` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attribute_def_translation
CREATE TABLE IF NOT EXISTS `attribute_def_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `attribute_def_translation_id_attribute_def_id` FOREIGN KEY (`id`) REFERENCES `attribute_def` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.attribute_def_translation: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_def_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_def_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attribute_def_value
CREATE TABLE IF NOT EXISTS `attribute_def_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_def_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_def_id_idx` (`attribute_def_id`),
  CONSTRAINT `attribute_def_value_attribute_def_id_attribute_def_id` FOREIGN KEY (`attribute_def_id`) REFERENCES `attribute_def` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.attribute_def_value: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_def_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_def_value` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attribute_def_value_translation
CREATE TABLE IF NOT EXISTS `attribute_def_value_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `attribute_def_value_translation_id_attribute_def_value_id` FOREIGN KEY (`id`) REFERENCES `attribute_def_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.attribute_def_value_translation: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_def_value_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_def_value_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attribute_type
CREATE TABLE IF NOT EXISTS `attribute_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.attribute_type: ~3 rows (około)
/*!40000 ALTER TABLE `attribute_type` DISABLE KEYS */;
INSERT INTO `attribute_type` (`id`, `name`) VALUES
	(1, 'value'),
	(2, 'single'),
	(3, 'multiple');
/*!40000 ALTER TABLE `attribute_type` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attribute_value
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

-- Zrzucanie danych dla tabeli napromed_dev.attribute_value: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.attribute_value_translation
CREATE TABLE IF NOT EXISTS `attribute_value_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `attribute_value_translation_id_attribute_value_id` FOREIGN KEY (`id`) REFERENCES `attribute_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.attribute_value_translation: ~0 rows (około)
/*!40000 ALTER TABLE `attribute_value_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.carousel_home
CREATE TABLE IF NOT EXISTS `carousel_home` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `number_of_slides` bigint(20) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.carousel_home: ~1 rows (około)
/*!40000 ALTER TABLE `carousel_home` DISABLE KEYS */;
INSERT INTO `carousel_home` (`id`, `name`, `number_of_slides`, `type`, `hidden`) VALUES
	(1, 'home', 4, 0, 0);
/*!40000 ALTER TABLE `carousel_home` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.contact_form_1
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.contact_form_1: ~5 rows (około)
/*!40000 ALTER TABLE `contact_form_1` DISABLE KEYS */;
INSERT INTO `contact_form_1` (`id`, `name`, `subject`, `firm`, `phone`, `email`, `type`, `message`, `created_at`, `updated_at`) VALUES
	(1, 'Tomasz Rogalski', 'Testowy temat', '', '', 'rogalski.tomaszek@gmail.com', 0, 'Test', '2014-04-25 19:27:00', '2014-04-25 19:27:40'),
	(2, 'Tomasz Rogalski', 'Testowy temat 2', '', '', 'rogalski.tomaszek@gmail.com', 0, 'Test 2', '2014-04-25 19:31:00', '2014-04-25 19:31:07'),
	(3, 'Tomasz', 'Test', NULL, NULL, 'tomasz.rogalski@vp.pl', 0, 'Treść', '2014-04-28 22:36:29', '2014-04-28 22:36:29'),
	(4, 'Tomasz', 'Test z kontaktu', NULL, NULL, 'tomasz.rogalski@vp.pl', 0, 'ĄŚĆąśćó', '2014-04-28 22:37:32', '2014-04-28 22:37:32'),
	(5, 'Tomasz Rogalski', 'Test formularza kontaktowego', NULL, NULL, 'tomasz.rogalski@vp.pl', 0, 'Test', '2014-05-04 10:17:08', '2014-05-04 10:17:08');
/*!40000 ALTER TABLE `contact_form_1` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.contact_form_2
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

-- Zrzucanie danych dla tabeli napromed_dev.contact_form_2: ~0 rows (około)
/*!40000 ALTER TABLE `contact_form_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_form_2` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.contact_form_3
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

-- Zrzucanie danych dla tabeli napromed_dev.contact_form_3: ~0 rows (około)
/*!40000 ALTER TABLE `contact_form_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_form_3` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.dictionary
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.dictionary: ~16 rows (około)
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` (`id`, `hidden`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(5, 0),
	(6, 0),
	(7, 0),
	(8, 0),
	(9, 0),
	(10, 0),
	(11, 0),
	(12, 0),
	(13, 0),
	(14, 0),
	(15, 0),
	(16, 0);
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.dictionary_translation
CREATE TABLE IF NOT EXISTS `dictionary_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `dictionary_translation_sluggable_idx` (`slug`,`lang`,`title`),
  CONSTRAINT `dictionary_translation_id_dictionary_id` FOREIGN KEY (`id`) REFERENCES `dictionary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.dictionary_translation: ~18 rows (około)
/*!40000 ALTER TABLE `dictionary_translation` DISABLE KEYS */;
INSERT INTO `dictionary_translation` (`id`, `title`, `body`, `lang`, `slug`) VALUES
	(1, 'PCO', '<p>Zesp&oacute;ł policystycznych jajnik&oacute;w (PCO) jest bardzo często powiązany z&nbsp;niepłodnością. Wynika to stąd, że jajniki nie funkcjonują prawidłowo, a owulacja pojawia się nieregularnie. Dlatego kobiety cierpiące na zesp&oacute;ł policystycznych jajnik&oacute;w mają zazwyczaj długie i&nbsp;nieregularne cykle menstruacyjne.</p>\r\n<p>Wiele lat temu syndrom ten identyfikowano jako zesp&oacute;l Steina-Leventhala. Był on związany z&nbsp;brakiem miesiączki, otyłością, nadmiernym owłosieniem ciała, nadciśnieniem i&nbsp;niepłodnością a jajniki podczas przeprowadzanych operacji opisywano jako porcelanowe z licznymi drobnymi torbielkami na obwodzie. Wsp&oacute;łczesna nauka, dzięki badaniom hormonalnym, ultrasonograficznym i&nbsp;laparoskopowym pokazała, że większość kobiet cierpiąca z&nbsp;powodu zespołu policystycznych jajnik&oacute;w wcale nie jest otyła, nie ma nadciśnienia i&nbsp;występuje u&nbsp;nich miesiączka (choć mają długie i&nbsp;nieregularne cykle). Kobiety te mają natomiast bardzo często problem z&nbsp;płodnością.</p>\r\n<p>Obecnie uznaje się, że u samego podłoża tej endokrynopatii leży szereg czynnik&oacute;w wzajemnie na siebie wpływających i wywołujących patologiczne reakcje w mechanizmie tzw. błędnego koła. Początek kaskady tych niekorzystnych zdarzeń upatruje się w:</p>\r\n<ul>\r\n<li>Czynnikach genetycznych (mutacje w genie P450c-17 i 11 HSD-1)</li>\r\n<li>Wewnątrzmacicznej ekspozycji płodu dziewczęcego na wysokie poziomy androgen&oacute;w u matki</li>\r\n<li>Siedzący tryb życia</li>\r\n<li>Otyłość</li>\r\n</ul>\r\n<p><b>Diagnostyka zespołu policystycznych jajnik&oacute;w (PCO)</b></p>\r\n<p>Śledzenie cyklu menstruacyjnego jest bardzo ważne dla oceny zdrowia pacjentki, a następnie dla zastosowania odpowiedniego leczenia. Wymagane jest wykonanie pełnego profilu hormonalnego, badań USG, oceny owulacji. Powinien on zawierać badania hormon&oacute;w takich jak: FSH, LH, androstendionu, testosteronu, wolnego testosteronu, DHEA, prolaktyny, beta-endorfin, TSH, FT3, FT4, progesteronu i&nbsp;estradiolu. Należy jednak przede wszystkim zlecić wykonanie doustnego testu obciążenia glukozą z ocena poziomu insuliny w spoczynku i po teście z glukozą.</p>\r\n<p>Po wykonaniu tych badań możliwe jest wyeliminowanie niekt&oacute;rych przyczyn nieregularnych cykli i&nbsp;definitywnie zdiagnozowanie zespołu PCO. Dodatkowo wykonywane jest badanie ultrasonograficzne miednicy mniejszej. Jajniki kobiety z&nbsp;PCO często są o&nbsp;wiele większe i&nbsp;wielotorbielowate. W&nbsp;pewnych przypadkach przeprowadzana jest r&oacute;wnież diagnostyka laparoskopowa.</p>\r\n<p><b>Leczenie zespołu policystycznych jajnik&oacute;w (PCO)</b></p>\r\n<p>Jednym z&nbsp;pierwszych zadań w&nbsp;leczeniu zespołu policystycznych jajnik&oacute;w jest zmniejszenie produkcji męskich hormon&oacute;w poprzez redukcję hiperinsulinemii i insulinooporności.</p>\r\n<p>Uzyskuje się to farmakologicznie lub przez klinową resekcję jajnik&oacute;w. Leczeniu zawsze musi towarzyszyć zmiana stylu życia i zwiększony wydatek energetyczny. Leczenie operacyjne daje trwałe rezultaty w postaci przywr&oacute;cenia płodności i zniesieniu zaburzeń metabolicznych. Leczenie płodności można osiągnąć także przez stymulację owulacji np. Clostilbegytem. Wspomniana wyżej klinowa resekcja jajnik&oacute;w jest procedurą chirurgiczną polegającą na klinowym usunięciu części tkanki jajnika, przez co ulega on zmniejszeniu i&nbsp;poprawia się jego funkcjonowanie. Choć jest to operacja znana od dawna, obecnie powraca do łask, gdyż znacząco poprawiła się w&nbsp;medycynie zdolność do zapobiegania powstawaniu zrost&oacute;w. Dodatkowo, zabieg jest wyjątkowo skuteczny jeśli chodzi o&nbsp;obniżenie poziomu męskich hormon&oacute;w i&nbsp;regulację cyklu menstruacyjnego, co jednocześnie poprawia płodność i&nbsp;obniża ryzyko wystąpienia raka piersi i&nbsp;raka macicy.</p>\r\n<p>Wyniki leczenia niepłodności metodą NaProTECHNOLOGY opublikowane zostały w 2004 roku przez prof. Thomasa Hilgersa w <i><b>The Medical and Surgical Practice of NaProTECHNOLOGY</b></i> oraz w 2008 roku w publikacji Josepha B. Stanforda, MD,MSPH, Tracey A.Parnella, MD and Phila C. Boyle, MB w czasopiśmie medycznym <b>"Journal of the American Board of Family Medicine: Outcomes From Treatment of Infertility With Natural Procreative Technology in an Irish General Practice"</b>.</p>\r\n<p>Skumulowany wskaźnik ciąż dla pacjentek z zespołem policystycznych jajnik&oacute;w:</p>\r\n<ol>\r\n<li>40% po 12 miesiącach</li>\r\n<li>65% po 24 miesiącach</li>\r\n<li>do 90% po 48 miesiącach</li>\r\n</ol>\r\n<p><b>NaProTECHNOLOGY</b> okazuje się 2,67 razy bardziej skuteczna niż in vitro dla endometriozy, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w. W badaniu z Irlandii, w latach 1998-2002 zgłosiło się 1239 par małżeńskich z powodu niepłodności. Średni wiek kobiet to 35,8 lat, średnia długość trwania niepłodności 5,6 roku. 33% par wcześniej było leczonych ART. Wskaźnik ciąż <b>NaProTECHNOLOGY</b> wyni&oacute;sł 52%. Udało się pom&oacute;c około 30% par po niepowodzeniach ART, czyli technik wspomaganego rozrodu &bdquo;in vitro&rdquo;(J Am Board Fam Med 2008;21:375&ndash;384.).</p>\r\n<p>Szczeg&oacute;łowe badania nad skutecznością metody w przypadkach problem&oacute;w z płodnością dostępne są na stronie: <a href="http://naprotechnology.com/infertility.htm" target="_blank">http://naprotechnology.com/infertility.htm</a></p>', 'pl', 'pco'),
	(2, 'Endometrioza', '<p>Schorzenie to ma niejasne przyczyny i polega na pojawieniu się fragment&oacute;w błony śluzowej macicy (endometrium) poza jej naturalnym umiejscowieniem czyli poza jamą macicy, co jest przyczyną przewlekłej reakcji zapalnej. Endometrium takie zachowuje zdolność do wzrostu i przemian hormonalnych; cyklicznie złuszcza się, powodując występowanie b&oacute;lu i krwawień, niszczenie zajętego narządu, wystąpienie stanu zapalnego i zrost&oacute;w.</p>\r\n<p>Częstość występowania endometriozy w populacji kobiet:</p>\r\n<ul>\r\n<li>u młodocianych i w wieku rozrodczym występuje u około 6 &ndash; 15%</li>\r\n<li>po menopauzie -&nbsp; 3%</li>\r\n<li>wśr&oacute;d kobiet z przewlekłym b&oacute;lem w miednicy - 70%</li>\r\n<li>z niepłodnością &ndash; 25 &ndash; 50%</li>\r\n</ul>\r\n<p>Obserwuje się 7 krotnie większe ryzyko rozwoju endometriozy u kobiet, kt&oacute;rych krewna pierwszego stopnia miała rozpoznaną tę chorobę.</p>\r\n<p>Nie ustalono mechanizmu prowadzącego do rozwoju tego schorzenia, rozpatruje się obecnie następujące teorie:</p>\r\n<p>Nie ustalono mechanizmu prowadzącego do rozwoju tego schorzenia, rozpatruje się obecnie następujące teorie:</p>\r\n<ul>\r\n<li>wstecznego miesiączkowania przez jajowody do jamy otrzewnowej</li>\r\n<li>metaplazji kom&oacute;rek jamy ciała z resztek embrionalnych przewod&oacute;w M&uuml;llera</li>\r\n<li>wadliwego r&oacute;żnicowania i proliferacji kom&oacute;rek macierzystych</li>\r\n<li>przerzutu limfatycznego i naczyniowego</li>\r\n</ul>\r\n<p>Ważnym elementem powstania endometriozy jest spaczona odpowiedź immunologiczna polegająca zar&oacute;wno na nieskutecznym niszczeniu powstałych ognisk jak i wytworzeniu przewlekłego stanu zapalnego. Nie ustalono, czy reakcja immunologiczna jest źr&oacute;dłem powstania ognisk chorobowych (cytokiny wzrostu i r&oacute;żnicowania), czy tylko nieadekwatną reakcją na patologiczną tkankę.</p>\r\n<p>Charakterystycznymi objawami towarzyszącymi endometriozie są bardzo bolesne miesiączki, bolesne wypr&oacute;żnienia, b&oacute;l podczas wsp&oacute;łżycia, b&oacute;l podczas owulacji, krwinkomocz, zesp&oacute;ł napięcia przedmiesiączkowego, przewlekły b&oacute;l miednicy, zesp&oacute;ł przewlekłego zmęczenia i niepłodność. Patologiczna reakcja immunologiczna wpływa występowanie innych, mniej swoistych objaw&oacute;w.</p>\r\n<p>Jako przyczynę występującej w endometriozie niepłodności upatruje się embriotoksyczny wpływ płynu otrzewnowego bogatego w cytokiny i wadliwą reakcję immunologiczną organizmu matki prowadzącą do stworzenia niekorzystnych dla prokreacji warunk&oacute;w. Innymi czynnikami są zrosty czasem prowadzące do niedrożności jajowod&oacute;w (czynnik jajowodowy) i zaburzenia jajeczkowania w zniszczonych endometriozą jajnikach.</p>\r\n<p>Diagnostyka polega na dokładnie zebranym wywiadzie, badaniu ginekologicznym (we wzierniku, przez pochwę i/lub przez odbytnicę, ultrasonografii. Złotym standardem postawienia rozpoznania jest wykonanie laparoskopii lub uwidocznienie zmian w pochwie (ocena wzrokowa) z ewentualną weryfikacją rozpoznania w badaniu histopatologicznym pobranych tkanek. Zmiany naciekowe są łatwiejsze do zdiagnozowania ginekologicznego podczas trwania miesiączki.</p>\r\n<p>Wskazaniami do laparoskopii są: silne dolegliwości b&oacute;lowe, typowe zmiany w badaniu ginekologicznym, niepłodność bez potwierdzonej w badaniach istotnej patologii.</p>\r\n<p>Podejmowane pr&oacute;by oceny nasilenia schorzenia w oparciu o skale rozległości anatomicznej procesu chorobowego często nie znajdują potwierdzenia w zgłaszanych przez Pacjentkę dolegliwościach. Nawet Endometrioza minimalna może być źr&oacute;dłem bardzo nasilonego b&oacute;lu w miednicy i niepłodności, podczas gdy duże torbiele i zrosty mogą takich dolegliwości nie wykazywać.</p>\r\n<p>Wyr&oacute;żnia się 3 typy endometriozy:</p>\r\n<ul>\r\n<li>otrzewnową</li>\r\n<li>jajnikową</li>\r\n<li>głęboko naciekającą</li>\r\n</ul>\r\n<p>Leczenie jest uzależnione od sytuacji Pacjentki; jeśli gł&oacute;wną dolegliwością jest niepłodność małżeńska, to optymalnym postępowaniem jest zachowawcze leczenie operacyjne z wycięciem wszystkich zmienionych chorobowo tkanek. Leczenie takie jest trudne i może być także okaleczające (wycięcie fragment&oacute;w jelit, pęcherza, tworzenie nowych zrost&oacute;w), niemniej w statystykach prof. T. Hilgersa bardzo skuteczne, zwłaszcza w por&oacute;wnaniu do metod ART. Koniecznym jest też korekta nieprawidłowej reakcji immunologicznej możliwa do uzyskania przez stosowanie suplement&oacute;w i optymalizację diety.</p>\r\n<p>Wyniki leczenia niepłodności metodą NaProTECHNOLOGY opublikowane zostały w 2004 roku przez prof. Thomasa Hilgersa w <b><i>The Medical and Surgical Practice of NaProTECHNOLOGY</i></b> oraz w 2008 roku w publikacji Josepha B. Stanforda, MD,MSPH, Tracey A.Parnella, MD and Phila C. Boyle, MB w czasopiśmie medycznym <b>"Journal of the American Board of Family Medicine: Outcomes From Treatment of Infertility With Natural Procreative Technology in an Irish General Practice"</b>.</p>\r\n<p>Wyniki leczenia kiedy rozpoznaną przyczyną niepłodności była endometrioza:</p>\r\n<ol start="1">\r\n<li>45% do 12 miesięcy,</li>\r\n<li>65% do 24 miesięcy,</li>\r\n<li>78% do 36 miesięcy.</li>\r\n</ol>\r\n<p>&nbsp;<b>NaProTECHNOLOGY</b> okazuje się 2,67 razy bardziej skuteczna niż in vitro dla endometriozy, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w. W badaniu z Irlandii, w latach 1998-2002 zgłosiło się 1239 par małżeńskich z powodu niepłodności. Średni wiek kobiet to 35,8 lat, średnia długość trwania niepłodności 5,6 roku. 33% par wcześniej było leczonych ART. Wskaźnik ciąż <b>NaProTECHNOLOGY</b> wyni&oacute;sł 52%. Udało się pom&oacute;c około 30% par po niepowodzeniach ART, czyli technik wspomaganego rozrodu &bdquo;in vitro&rdquo; (J Am Board Fam Med 2008;21:375&ndash;384.).</p>\r\n<p>Szczeg&oacute;łowe badania nad skutecznością metody w przypadkach problem&oacute;w z płodnością dostępne są na stronie: <a href="http://naprotechnology.com/infertility.htm" target="_blank">http://naprotechnology.com/infertility.htm</a></p>', 'pl', 'endometrioza'),
	(3, 'Parametry nasienia', '<p>Obowiązujące powszechnie dolne wartości parametr&oacute;w nasienia wg zaleceń WHO z 2010 r. to 5 percentyl z badań nasienia uzyskanych od mężczyzn, kt&oacute;rzy uzyskali potomstwo w czasie poniżej 12 miesięcy. Z tego wynika parę wniosk&oacute;w:</p>\r\n<ul>\r\n<li>Wydłużenie czasu obserwacji &gt;12 m-cy może obniżyć normę dla 5 percentyla płodnych mężczyzn</li>\r\n<li>Norma 2,5 percentyla jest niższa niż w 5 percentylu a mężczyźni ci też uzyskali ciąże w ciągu 12 miesięcy obserwacji, wydłużenie obserwacji może obniżyć i tę normę</li>\r\n<li>Nie ustalono dolnej granicy poniżej kt&oacute;rej m&oacute;wić można o całkowitej niepłodności męskiej (za wyjątkiem trwałej azoospermii)</li>\r\n</ul>\r\n<p>Dla postawienia wstępnego rozpoznania powinny być przeprowadzone co najmniej 2&mdash;3 badania wykonane w odstępach 7-21 dni od poprzedniego z zachowaniem podobnego okresu wstrzemięźliwości płciowej (2-7 dni).</p>\r\n<p>Opis badania nasienia powinien być wystandaryzowany wg wzoru Komisji do Spraw Konsensusu Lekarsko - Diagnostycznego Polskiego Towarzystwa Andrologicznego.</p>\r\n<p><b>Dolne wartości referencyjne dla parametr&oacute;w nasienia wg WHO z 2010 r.</b></p>\r\n<ul>\r\n<li>Objętość &ndash; 1,5 ml</li>\r\n<li>Całkowita liczba plemnik&oacute;w (mln/ejakulat) &ndash; 39</li>\r\n<li>Koncentracja plemnik&oacute;w (mln/ml) &ndash; 15</li>\r\n<li>Całkowity rych plemnik&oacute;w (%) &ndash; 40</li>\r\n<li>Ruch postępowy plemnik&oacute;w (%) &ndash; 32</li>\r\n<li>Żywotność plemnik&oacute;w (%) &ndash; 58</li>\r\n<li>Prawidłowa morfologia plemnik&oacute;w (%) &ndash; 4</li>\r\n<li>Pozostałe uzgodnione wartości progowe\r\n<ul>\r\n<li>Czas upłynnienia ejakulatu - &lt; 60 minut</li>\r\n<li>pH &ndash; &ge; 7,2</li>\r\n<li>leukocyty peroksydazo-dodatnie (mln/ml) - &lt; 1</li>\r\n<li>kom&oacute;rki okrągłe (mln/ml) &ndash; &lt; 5</li>\r\n</ul>\r\n</li>\r\n<li>dodatkowe testy\r\n<ul>\r\n<li>MAR-test (% ruchomych plemnik&oacute;w związanych z kuleczkami) &ndash; &lt; 50</li>\r\n<li>Immunobead test (% ruchomych plemnik&oacute;w związanych z kuleczkami) &ndash; &lt; 50</li>\r\n</ul>\r\n</li>\r\n<li>Testy biochemiczne nasienia\r\n<ul>\r\n<li>Cynk (&micro;mol/ejakulat) &ndash; &ge; 2,4</li>\r\n<li>Fruktoza (&micro;mol/ejakulat) &ndash; &ge; 20</li>\r\n<li>&alpha; glikozydaza obojętna (Mu/ejakulat) - &ge; 13</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<p>W celu obliczenia wskaźnik&oacute;w zaburzeń morfologicznych plemnik&oacute;w (TZI, SDI, MAI) laboratorium musi używać morfologicznych kryteri&oacute;w opracowanych wg rekomendacji WHO z 2010 r.</p>\r\n<p>Badania dodatkowe, kt&oacute;re można oceniać w wybranych przypadkach to:</p>\r\n<ul>\r\n<li>Test TRAP</li>\r\n<li>Test HBA</li>\r\n<li>Test ROS</li>\r\n<li>Test przeżywalności plemnik&oacute;w</li>\r\n<li>Badanie reakcji akrosomalnej</li>\r\n<li>Badanie chromatyny plemnikowej</li>\r\n<li>Test migracyjny</li>\r\n<li>Badanie aktywności mitochondrialnej we wstawkach plemnik&oacute;w</li>\r\n</ul>\r\n<p>Lekarz konsultant zleci także badania mikrobiologiczne nasienia (posiew i antybiogram) w kierunku:</p>\r\n<ul>\r\n<li>Bakterii tlenowych</li>\r\n<li>Bakterii beztlenowych</li>\r\n<li>Drobnoustroj&oacute;w mikroaerofilnych</li>\r\n<li>Mykoplasm / Ureaplasm</li>\r\n<li>Grzyb&oacute;w</li>\r\n</ul>\r\n<p>Oraz dokona diagnostyki w kierunku Chlamydia spp.</p>', 'pl', 'parametry-nasienia'),
	(4, 'Badanie andrologiczne', '<p>Badanie męskich narząd&oacute;w płciowych to badanie andrologiczne. W celu postawienia diagnozy konsultant wykona:</p>\r\n<p><strong>Badanie podmiotowe</strong> &ndash; czyli wywiad lekarski rozszerzony zagadnienia związane z życiem płciowym Pacjenta, narażeniem na szkodliwe czynniki środowiskow i zagadnienia genetyczne.</p>\r\n<p><strong>Badanie przedmiotowe</strong> &ndash; czyli badanie fizykalne uwzględniające zagadnienia antropometryczne, badanie pola widzenia i obecność węchu, stopień rozwoju cech płciowych, badanie palpacyjne jąder i badanie urologiczne gruczoł&oacute;w płciowych dodatkowych. Badanie USG: jąder i transrektalne wnosi wiele danych do rozpoznania (m.in. cechy dyzgenezji jąder, nowotwory, zmiany pozapalne czy żylaki powr&oacute;zka nasiennego).</p>\r\n<p>Z badaniach laboratoryjnych zleca się badania z zakresu kompetencji Lekarza POZ jak i specjalistyczne badania hormonalne. Badanie musi być rozszerzone o ocenę parametr&oacute;w nasienia.</p>', 'pl', 'badanie-andrologiczne'),
	(5, 'Dobre cykle', '<p><b>O efektywnych (dobrych) cyklach m&oacute;wimy gdy stwierdzamy:</b><b></b></p>\r\n<p><b>A.</b></p>\r\n<ol>\r\n<li>Poziom hormon&oacute;w w dniu Peak+7 (lub P+6,+8,+9) jest optymalny czyli\r\n<ul>\r\n<li>Progesteron 19-32 ng/ml (60-100 nmol/l)</li>\r\n<li>Estradiol 109-218 pg/ml (400-800 pmol/1)</li>\r\n<li>Zadowalający obraz śluzu szyjkowego</li>\r\n</ul>\r\n</li>\r\n<li>Prawidłowy przebieg krwawienia miesięcznego</li>\r\n<li>Dobrą kontrolę zespołu napięcia przed miesiączkowego</li>\r\n<li>Normalny poziom &bdquo;energii"</li>\r\n<li>Prawidłowe badanie nasienia</li>\r\n</ol>\r\n<p><b>B.</b></p>\r\n<ol>\r\n<li>Ultrasonograficznie potwierdzenie pękania pęcherzyka Graafa (ocena owulacji)</li>\r\n<li>Potwierdzenie prawidłowej budowy anatomicznej (ultrasonografia i/lub laparoskopia i/lub histeroskopia)</li>\r\n</ol>\r\n<p><b>C.</b></p>\r\n<ol>\r\n<li>Podczas okresu płodnego częste, niewymuszone wsp&oacute;łżycie małżeńskie&nbsp; (optymalnie od początku śluzu typu P do dnia P+2)</li>\r\n<li>Świadomość podlegania stresowi i umiejętność radzenia sobie z nim. (ekstremalna dieta lub wysiłek fizyczny, zaburzenia snu, b&oacute;l, choroba, praca, egzaminy, wakacje, żałoba, problemy emocjonalne)</li>\r\n</ol>', 'pl', 'dobre-cykle'),
	(6, 'Czynnik jajowodowy', '<p>W ostatnich dekadach gwałtownie zwiększa się ilość par małżeńskich z rozpoznawaną niepłodnością. Początek tego trendu sięga jednej do dw&oacute;ch dekad po upowszechnieniu metod antykoncepcji hormonalnej. Wbrew zaklęciom firm farmaceutycznych i płatnych protagonist&oacute;w nie tylko nie zmniejszyła się ilość &bdquo;niechcianych ciąż&rdquo; ale r&oacute;wnież ilość chor&oacute;b przenoszonych drogą płciową (<b>STD</b> &ndash; <i>sexually transmitted diseases</i>). Wiele teoretycznych opracowań minionych (na szczęście) dekad zakładało, że taka zmiana obyczajowości doprowadzi ludzkość do pełnej wolności a przez to do pełni szczęścia. Niestety stany zapalne dr&oacute;g rodnych przenoszone z chorych kobiet przez zdrowych mężczyzn na zdrowe kobiety prowadzą do wielu patologii nierzadko o dramatycznym finale. W wielkim skr&oacute;cie do schorzeń przenoszonych drogą kontakt&oacute;w seksualnych zaliczyć można:</p>\r\n<ul>\r\n<li>Infekcje wirusem opryszczki</li>\r\n<li>Grzybica drożdżakowa</li>\r\n<li>Rzęsistkowica</li>\r\n<li>Kiła</li>\r\n<li>Rzeżączka</li>\r\n<li>Wirusowe zapalenie wątroby</li>\r\n<li>HIV/AIDS</li>\r\n<li>Infekcja wirusami HPV</li>\r\n<li>Nierzeżączkowe zapalenie cewki moczowej</li>\r\n<li>Infekcja Chlamydia trachomatis</li>\r\n</ul>\r\n<p>Ten z potrzeby pobieżny wykaz schorzeń przenoszonych drogą płciową pozwala uzmysłowić sobie, że większość schorzeń w naszej strefie klimatycznej przebiega skąpoobjawowo a przez to objawy mogą być zbagatelizowane przez chorego, co prowadzi do stanu przewlekłego, często z niszczeniem zajętego narządu. Co do zasady &ndash; im mniej objaw&oacute;w stanu zapalnego, tym częściej rozpoznaje się chorobę w stadium przewlekłym i przez to szersze występowanie danego patogenu w populacji. Na to ostatnie stwierdzenie ma duży wpływ rodzaj zachowań seksualnych w społeczeństwie.</p>\r\n<p>Istnieje zgodność, że najczęstszym patogenem przenoszonym drogą płciową jest Chlamydia trachomatis. Badania ośrodka warszawskiego wykazały, że u ponad 10% aktywnych seksualne nastolatek wykrywa się przeciwciała przeciwchlamydialne a nie jest to czuła metoda wykrywania tej infekcji. Pomijając całość przebiegu naturalnego tej choroby zwr&oacute;cić tu należy na fakt doprowadzenia do niedrożności mechanicznej jajowod&oacute;w przez tworzenie zrost&oacute;w jak i zniszczenie nabłonka światła jajowod&oacute;w, co nawet przy zachowanej ich drożności mechanicznej stwarza wybitnie niekorzystne środowisko dla prawidłowego rozwoju nowego życia i jego dalszego pasażu do jamy macicy, gdzie może dojść do prawidłowego zagnieżdżenia.</p>\r\n<p>Poza infekcją chlamydialną także inne bakteryjne infekcje zwane zapaleniem przydatk&oacute;w mogą prowadzić do niedrożności jajowod&oacute;w. Poza tym także postać endometriozy w cieśni jajowod&oacute;w nazywana <i>salpingitis isthmica nodosa</i> prowadzi do niepłodności mechanicznej. Ponadto każda operacja w jamie brzusznej a zwłaszcza przebycie operacji na przydatkach czy macicy może prowadzić do tworzenia się zrost&oacute;w uniemożliwiających prawidłowy pasaż jajowodowy.</p>\r\n<p>Dla potrzeb akademickich wymienić także należy: obustronną agenezję jajowod&oacute;w czy swoiste zapalenie przydatk&oacute;w (gruźlicze czy promienicze).</p>\r\n<p>Czynnik jajowodowy stanowi od 15 do 40 % wszystkich przypadk&oacute;w niepłodności żeńskiej. Poza chorobami</p>\r\n<p>Jeżeli powodem niedrożności jajowodowej są zrosty zlokalizowane w jamie otrzewnowej czy w dystalnym odcinku jajowodu &ndash; istnieje dość wysoka szansa na przywr&oacute;cenie drożności jajowodu metodami operacyjnymi (laparoskopia, chirurgia otwarta, hysteroskopowe udrożnienie giętkimi cewnikami czy pod kontrolą RTG). Jeżeli zmiany są umiejscowione poza aparatem strzępkowym to możliwa jest metoda mikrochirurgiczna. To samo dotyczy procesu zwanego <i>salpingistis isthmica nodosa</i>, gdzie po wycięciu zmienionych tkanek wszywa się zdrowy odcinek jajowodu do ściany macicy. Metody mikrochirurgiczne, aczkolwiek wynalezione już dawno nie znalazły wielu propagator&oacute;w nie tylko z uwagi na ich czaso- i kosztochłonność ale r&oacute;wnież na szerokie rozpowszechnienie ART. Klasyczna medycyna stosuje r&oacute;wnież leczenie bodźcowe, przeciwzapalne i szeroko rozumianą balneologię w przypadku czynnika jajowodowego.</p>\r\n<p>Szansa na ciążę po operacyjnym uwolnieniu zrost&oacute;w jest oceniana na powyżej 40% przypadk&oacute;w, natomiast wszczepienie jajowodu do ściany macicy daje 18% szans na własne potomstwo metodami naturalnymi. Po tych operacjach istnieje też 11-14% ryzyko, że ciąża będzie rozwijać się ektopowo.</p>\r\n<p>Rozpoznanie niedrożności jajowodu można postawić poprzez wykonanie HSG pod kontrolą RTG czy SHSG pod kontrolą USG oraz hydrotubacji (chromoskopii) podczas zabiegu laparoskopowego czy fertiloskopowego (hydrolaparoskopia, salpingoskopia, falloskopia).</p>\r\n<p>Stanowiska Towarzystw zrzeszających lekarzy w przypadku postawienia rozpoznania niedrożności jajowodowej zalecają metody ART, kt&oacute;re jako niegodziwe etycznie nie zostaną zaproponowane Parze przez konsultanta ale o kt&oacute;rych to zaleceniach zostaną poinformowani.</p>', 'pl', 'czynnik-jajowodowy'),
	(7, 'Lekarz konsultant NaPro', '<p>Urodzony i wychowany w Poznaniu, studia medyczne ukończył z drugą lokatą w Wojskowej Akademii Medycznej w Łodzi w 1999 r. W trakcie studi&oacute;w pod inspiracją swoich nauczycieli (prof. H. H&uuml;bner &ndash; biolog i genetyk, prof. H. Bartel &ndash; embriolog, prof. S. Orkisz &ndash; histolog, wsp&oacute;łodkrywca translacji DNA-RNA nagrodzonej nagrodą Nobla,&nbsp; dr. D. Tosik &ndash; embriolog, histolog, prof. H. Tch&oacute;rzewski &ndash; patofizjolog i immunolog, prof. K. Zeman &ndash; immunolog, prof. Z. Baj &ndash; patofizjolog, prof. K. Zieliński &ndash; patomorfolog, prof. A. Malinowski &ndash; ginekolog, immunolog, dr W. Budźko &ndash; ginekolog, położnik) rozpoczął pracę w Studenckich kołach naukowych. W tym okresie zainteresowania ogniskowały się na indukowanych wadach wrodzonych u myszy (ocena makroskopowa i w mikroskopie świetlnym oraz elektronowym) gł&oacute;wnie rozszczepach podniebienia indukowanych bromodeoksyurydyną, zagadnieniach związanych z generowaniem reaktywnych form tlenu u ludzi, procesami genetycznym prowadzącymi do apoptozy w procesach rozwoju prenatalnego u myszy poddawanych wpływowi teratogen&oacute;w, immunologicznymi przyczynami niepłodności, gł&oacute;wnie obecnością przeciwciał blokujących we krwi kobiet z par niepłodnych, możliwościami terapeutycznymi leczenia niepłodności o podłożu immunologicznym, gł&oacute;wnie szczepieniem limfocytami partnera w reakcji MLR, przyczynami psychologicznymi w niepłodności małżeńskiej (wsp&oacute;łpraca z prof. Bielawską &ndash; Batorowicz), możliwością zastosowaniu OXTDAN-u w terapii ran poporodowych (badania kliniczne III fazy), wpływem nadwagi i otyłości na wybrane parametry ciąży, porodu i połogu i czynnikami środowiskowymi mogącymi prowadzić do uszkodzenia funkcji generatywnej jajnika u myszy &ndash; ocena wybranych parametr&oacute;w morfologicznych&nbsp; jajnik&oacute;w myszy poddawanych działaniu kofeiny; ocena w mikroskopie świetlnym i elektronowym, badania immunoenzymatyczne i metodami genetyki molekularnej. Za swoje prace nagradzany i wyr&oacute;żniany na konferencjach studenckich, zar&oacute;wno og&oacute;lnopolskich jak i międzynarodowych.</p>\r\n<p>Specjalizację z położnictwa i ginekologii rozpoczął&nbsp; 2001 r. pod okiem prof. J.R. Wilczyńskiego w Instytucie Centrum Zdrowia Matki Polki w Łodzi. Z powod&oacute;w rodzinnych kontynuował specjalizację w Ginekologiczno &ndash; Położniczym Szpitalu Klinicznym w Poznaniu na ul Polnej 33, r&oacute;wnolegle zdobywając doświadczenie zawodowe w Szpitalu Powiatowym w Wałczu. W trakcie specjalizacji nawiązał wsp&oacute;łpracę naukową z prof. W. Baranowskim z CSK WIM w Warszawie, gdzie r&oacute;wnież szkolił się w technikach endoskopowych w ginekologii i w procedurach diagnostycznych i leczeniu operacyjnym w uroginekologii. Od 2006 r. zainteresowany naturalnymi metodami planowania rodziny, a w 2009 r. zetknął się z naprotechnologią jako alternatywą leczenia niepłodności wobec ART. (techniki rozrodu wspomaganego).&nbsp;&nbsp; W latach 2012 &ndash; 2013 brał udział w kursie dla konsultant&oacute;w medycznych metod naturalnego planowania rodziny i szkoleniu z systemu obserwacji cyklu płciowemu kobiety modelem Creighton (the Creighton Model Fertility Care System, CrMS) oraz szkoleniu z NaPro TECHNOLOGY <sup>&trade;</sup>. Prowadził wykłady na temat działania antykoncepcji dla słuchaczy Studium Rodziny przy Wydziale Teologicznym Uniwersytetu im Adama Mickiewicza w Poznaniu i dla student&oacute;w Warszawskiego Uniwersytetu Medycznego w ramach konferencji &bdquo;Ginekologia in vivo&rdquo; a także dla lekarzy podczas IX Gdańskich spotkań z etyką lekarską i spotkaniach ginekolog&oacute;w katolickich i środowisk napro. W swoich opracowaniach ogniskował się na wpływie antykoncepcji na parametry zdrowotne i epidemiologiczne. Zainteresowany czynnikiem męskim w niepłodności małżeńskiej.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Członek zwykły Polskiego Towarzystwa Andrologicznego, Polskiego Towarzystwa Ginekologicznego, Polskiego Towarzystwa Endokrynologii Ginekologicznej.</p>', 'pl', 'lekarz-konsultant-napro'),
	(8, 'NaPro TECHNOLOGY (NaPro Technologia, naprotechnologia, NaPro, napro)', '<p class="Standard">NaProTechnologia jest dziedziną medycyny prokreacyjnej, kt&oacute;rą opracował Thomas W. Hilgers z USA (natural procreative technology) człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą integralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego. Z uwagi na stosowane podejście filozoficzne, umocowania kulturowe, zasady postępowania, podejście badawcze i implikacje społeczne stanowiące o zaistnieniu paradygmatu naukowego można nazywać ją nauką, stąd rozwinięcie &ndash;logia (greckie <em>logos</em> &ndash; <em>słowo</em>). Pojęcie NaPro Technology zostało utworzone jako opozycja do Artificial Reproductive Technology (ART), kt&oacute;re tłumaczy się jako technologia sztucznej reprodukcji. Widoczne tutaj podejście T.W. Hilgersa w odr&oacute;żnieniu angielskich sł&oacute;w Reproductive i Procreative ma znaczenie ontologiczne i uwydatnia rolę człowieka w tw&oacute;rczej wsp&oacute;łpracy z Bogiem i nie degraduje jego roli do reproduktora. Z kolei zamiana sł&oacute;w Artificial na Natural określa drogę i kierunek działań lekarza uwzględniającego w swym postępowaniu godność osobistą każdego człowieka (tutaj jako pacjenta).</p>\r\n<p class="Standard">Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną The Creighton Model Fertility Care System (CrMS), stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>\r\n<p>Punktem wyjścia do opracowania modelu Creighton była metoda owulacyjna Billings&oacute;w, kt&oacute;ra polegała na&nbsp; obserwacjach wydzieliny śluzowej szyjki macicy oraz odczuć w&nbsp;okolicach przedsionka pochwy. Zesp&oacute;ł badaczy z Omaha pod kierownictwem T. Hilgersa przeprowadził standaryzację co do jakości jak i ilości cech płodnych śluzu oraz obserwacji i odczuć kobiety. Wieloletnie obserwacje wybranych parametr&oacute;w cyklu płciowego umożliwiły wyr&oacute;żnienie kobiet z typowymi problemami zdrowotnymi układu rozrodczego o określonych cechach zapis&oacute;w. Stało się to przyczynkiem do wyr&oacute;żnienia tzw. biomarker&oacute;w cyklu (typu i&nbsp;ilości obserwowanego śluzu, dynamiki jego zmian, długości i&nbsp;przebiegu fazy przedowulacyjnej, długości i&nbsp;stabilności fazy poowulacyjnej, długości cykli, występowania plamienia przedmenstruacyjnego, przedłużania się brązowego plamienia po miesiączce&nbsp;itp.).</p>\r\n<p class="Standard">Przez poznanie biomarker&oacute;w płodności (NaPro TRACK) łatwiejszym staje się diagnostyka jak r&oacute;wnież terapia:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li>endometriozy</li>\r\n<li>zespołu policystycznych jajnik&oacute;w (PCOS)</li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n</ul>\r\n<p class="Standard">Lekarz Konsultant prowadzi r&oacute;wnież diagnostykę i leczenie czynnika męskiego niepłodności.</p>\r\n<p>CrMS jest naukowo przebadany, precyzyjny i skuteczny, wsp&oacute;łpracuje z płodnością, szanuje godność kobiety i integralność małżeństwa oraz jest całkowicie pozbawiony efekt&oacute;w ubocznych dla każdego z małżonk&oacute;w.</p>\r\n<p>Leczenie NaPro polega na kompleksowym wykorzystaniu najnowocześniejszych osiągnięć medycyny oraz chirurgii we wsp&oacute;łpracy z naturalnym cyklem menstruacyjnym kobiety, tak aby osiągnąć optymalną funkcjonalność bez tłumienia bądź niszczenia płodności. To także propozycja leczenia dla mężczyzn.(tutaj link do badanie andrologiczne lub niepłodność męska)</p>\r\n<p>W dostępnej literaturze skumulowane wskaźniki ciąż po leczeniu NaProTECHNOLOGY z powodu niepłodności uzyskano w</p>\r\n<p>do 12 miesięcy - uzyskano 44% ciąż,<br />do 24 miesięcy uzyskano 62% ciąż,<br />w 48 miesięcy od rozpoczęcia leczenia 71%.</p>\r\n<p>Naprotechnologia bazuje na perfekcyjnym poznaniu fizjologii cyklu płciowego kobiety i ocenia występujące zaburzenia korzystając z biomarker&oacute;w określanych jako NaProTRACK. Takie podejście umożliwia eliminację czynnika sprawczego powodującego obniżenie płodności (zwane także jako niepłodność).</p>', 'pl', 'napro-technology-napro-technologia-naprotechnologia-napro-napro'),
	(9, 'Instruktor', '<p>NaPro MED prowadzi wsp&oacute;łpracę z następującymi Instruktorami z wojew&oacute;dztwa wielkopolskiego<br /> <br /> <b>Paulina Michalska</b><br /> Poznań, tel. kom. 661 145 459, <a href="mailto:paulina.michalska@creightonmodel.com.pl">paulina.michalska@creightonmodel.com.pl</a><br /> <br /> <b>Szymon Kuznowicz</b><br /> Licheń/Konin, tel. kom. 693 298 938, <a href="mailto:szkuznowicz@wp.pl">szkuznowicz@wp.pl</a></p>', 'pl', 'instruktor'),
	(10, 'Model Creighton ', '<p>W latach 70-tych prof.&nbsp;<strong>Thomas Hilgers</strong>&nbsp;przeprowadził z gronem wsp&oacute;łpracownik&oacute;w&nbsp;szereg badań nad metodami obserwacji cyklu menstruacyjnego i rozpoznawania płodności,&nbsp;w tym szczeg&oacute;lną uwagę poświęcił metodzie owulacji Billingsa. Wypracował on nową&nbsp;metodę- Creighton Model FertilityCare&trade; System (CrMS), wystandaryzowaną modyfikację&nbsp;metody rozpoznawania płodności&nbsp;<strong>Billingsa</strong><strong>.</strong> CrMS stał się pierwszym systemem, kt&oacute;ry&nbsp;<strong>ł</strong><strong>ączy obserwacje</strong>&nbsp;- język zdrowia kobiety,&nbsp;<strong>z </strong><strong>postępowaniem lekarskim</strong><strong>.</strong> System ten nie&nbsp;jest w żaden spos&oacute;b naturalną antykoncepcją. Stanowi on w pełni tego słowa znaczeniu&nbsp;metodę rozpoznawania płodności, kt&oacute;ra może być używana zar&oacute;wno do starania się o&nbsp;poczęcie jak i do odkładania poczęcia w czasie. Ponadto, system ten stanowi cenne źr&oacute;dło&nbsp;informacji dotyczącej całościowego wymiaru zdrowia prokreacyjnego.&nbsp;<strong>Korzyścią</strong><strong>&nbsp;</strong>dla kobiet&nbsp;jest to, że mogą one w tym systemie obserwacji monitorować swoje zdrowie rozrodcze i&nbsp;ginekologiczne. Jest to więc system, kt&oacute;ry łączy w sobie opiekę oraz kompleksową ochronę&nbsp;i troskę o zdrowie. Instruktorzy CrMS stanowią wykwalifikowany pomocniczy personel&nbsp;medyczny, zaś specjalnie wyszkoleni lekarze zostali przygotowani, by w swoją praktykę&nbsp;lekarską włączyć CrMS. Nauka tej metody dla kobiet, czy par pacjent&oacute;w odbywa się podczas&nbsp;<strong>8 spotkań</strong>&nbsp;w pierwszym roku stosowania metody. Para, czy kobieta obserwująca się, pozostaje&nbsp;w kontakcie oraz pod opieką swojego instruktora przez lata, w każdej sytuacji zmiany sytuacji&nbsp;rozrodczej lub intencji stosowania systemu (laktacja, ciąża, odkładanie poczęcia, staranie się&nbsp;o poczęcie) może ponownie udać się na konsultację<sup>1</sup>.</p>\r\n<p><br /> <strong>SZTUKA OBSERWACJI CYKLU</strong></p>\r\n<p>CrMS polega na wystandaryzowanych obserwacjach i zapisach na karcie wskaźnik&oacute;w&nbsp;biologicznych, kt&oacute;re są kluczowe dla zdrowia i płodności kobiety. Owe biowskaźniki są&nbsp;wyznacznikami występowania faz płodnych i niepłodnych. Mogą one r&oacute;wnież sygnalizować&nbsp;nieprawidłowości występujące w zdrowiu kobiety.</p>\r\n<p>Omawiany system obserwacji cyklu&nbsp;opiera się na wnikliwej obserwacji wskaźnik&oacute;w cyklu menstruacyjnego, w tym:</p>\r\n<ol>\r\n<li>obserwacji wzoru krwawienia menstruacyjnego;</li>\r\n<li>obserwacji nietypowych krwawień i&nbsp;ich charakteru;</li>\r\n<li>obserwacji i charakterystyki r&oacute;żnych wydzielin;</li>\r\n<li>obserwacji czasu&nbsp;trwania i wartości poszczeg&oacute;lnych faz cyklu;</li>\r\n<li>obserwacji zmodyfikowanego&nbsp;indeks śluzu szyjkowego, i innych.</li>\r\n</ol>\r\n<p>Dzięki szczeg&oacute;łowym obserwacjom kobiety mają&nbsp;możliwość precyzyjnego zrozumienia przebiegu cyklu, a z pomocą odpowiednio&nbsp;przeszkolonego instruktora CrMS, kobiety uzyskują interpretację i są skierowywane na&nbsp;diagnostykę w odniesieniu do możliwych nieprawidłowości, kt&oacute;re łatwo zidentyfikować&nbsp;na karcie obserwacji. CrMS stanowi więc podstawę dla nowej dyscypliny nauki <strong>-&nbsp;</strong><strong>NaProTECHNOLOGY</strong>. Dzięki temu po raz pierwszy w leczeniu zaburzeń w zakresie&nbsp;układu rozrodczego można wprowadzić diagnostykę i leczenie celowane z niezwykłą&nbsp;precyzją. Na podstawie karty obserwacji kobiety lekarz może dostosowywać diagnostykę&nbsp;i leczenie do przebiegu jej cykli oraz monitorować efekty terapii. Model Creighton cenny&nbsp;jest więc na r&oacute;żnych etapach życia kobiety, w każdej sytuacji, w kt&oacute;rej się ona znajduje,&nbsp;niezależnie czy jest osobą samotną, czy w związku. System obserwacji może bowiem&nbsp;posłużyć do monitorowania zdrowia w cyklach o regularnej jak i nieregularnej długości,&nbsp;w sytuacji problem&oacute;w hormonalnych czy w okresie karmienia piersią, a nawet w okresie&nbsp;premenopauzy<sup>2</sup>.</p>\r\n<p><br /> <strong>STATYSTYKI DOTYCZĄCE SAMOOBSERWACJI</strong></p>\r\n<p>Z badań wynika, że jeżeli para małżeńska zamierza odłożyć poczęcie, skuteczność metody&nbsp;CrMS wynosi 99,5 proc., natomiast uwzględniając błędy w użytkowaniu, skuteczność&nbsp;praktyczna to 96,8 procent<sup>3</sup>.&nbsp;Jeśli para o niezaburzonym stanie płodności stosuje model&nbsp;Creighton w celu starania się o poczęcie, dochodzi do ciąż aż u<strong>&nbsp;</strong><strong>76 proc.</strong>&nbsp;starających się&nbsp;<strong>już w pierwszym cyklu</strong>, a&nbsp;<strong>w pierwszych sześciu cyklach 98 proc.</strong><strong>&nbsp;</strong>zachodzi w ciążę. Sama&nbsp;znajomość swojego cyklu wystarczy do zaplanowania ciąży, jeśli ktoś nie ma większych&nbsp;problem&oacute;w z płodnością. Natomiast dla par, kt&oacute;re mają problemy zdrowia prokreacyjnego,&nbsp;system modelu Creighton daje więcej danych - dzięki większej ilości biowskaźnik&oacute;w, kt&oacute;re&nbsp;określają r&oacute;żne czynniki mające wpływ na płodność.&nbsp;<strong>Wstępna analiza cykli odbywa się&nbsp;zazwyczaj po ok. 3 cyklach obserwacji.</strong>&nbsp;Stosując tylko samą obserwację modelu Creighton,&nbsp;można pom&oacute;c ok. 20 proc. par<sup>4</sup>.</p>\r\n<p>Więcej informacji nt. Modelu Creighton można uzyskać na stronie:&nbsp;<a href="http://www.creightonmodelsystem.pl">www.creightonmodelsystem.pl</a>.</p>\r\n<p><img src="/useruploads/images/galeria/model-creightona.jpg" alt="" width="680" height="624" align="middle" /></p>\r\n<p><img src="/useruploads/images/galeria/model-creightona2.jpg" alt="" width="491" height="468" align="middle" /></p>\r\n<p>&nbsp;</p>', 'pl', 'model-creighton'),
	(11, 'Biomarker (NaPro TRACK)', '<p class="Standard">Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną The Creighton Model Fertility Care System (CrMS), stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>\r\n<p class="Standard">Systematyczne prowadzenie obserwacji za pomocą karty z naklejanymi piktogramami sprawia, że konsultant może uprawdopodobnić rozpoznanie schorzenia często bez poszukiwania &bdquo;na ślepo&rdquo; istoty schorzenia dającego jako objaw niepłodność małżeńską (obniżony potencjał płodności małżeńskiej). By zapisy na Karcie były diagnostyczne dla konsultanta, należy przestrzegać zasad prowadzenia obserwacji o kt&oacute;rych Małżonkowie są uczeni podczas sesji z Instruktorem.</p>\r\n<p class="Standard">Przez poznanie biomarker&oacute;w płodności (NaPro TRACK) łatwiejszym staje się diagnostyka jak r&oacute;wnież terapia:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li>endometriozy</li>\r\n<li>zespołu policystycznych jajnik&oacute;w (PCOS)</li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n</ul>', 'pl', 'biomarker-napro-track'),
	(12, 'Badania Lekarza Rodzinnego', '<p>Wykaz badań na jakie może skierować Pacjenta Lekarz Rodzinny &nbsp;dostępny na stronie Ministerstwa Zdrowia <a href="http://www.mz.gov.pl/poz/bezplatne-badania">http://www.mz.gov.pl/poz/bezplatne-badania</a> wymienia:</p>\r\n<p><u>Badania hematologiczne</u></p>\r\n<ul>\r\n<li>morfologia krwi obwodowej z wzorem odsetkowym,&nbsp;</li>\r\n<li>płytki krwi,</li>\r\n<li>retikulocyty;</li>\r\n<li>odczyn opadania krwinek czerwonych (OB),</li>\r\n<li>poziom glikozylacji hemoglobiny (HbA1c).</li>\r\n</ul>\r\n<p><u>Badania biochemiczne i immunochemiczne w surowicy krwi</u></p>\r\n<ul>\r\n<li>s&oacute;d,&nbsp;</li>\r\n<li>potas,</li>\r\n<li>wapń całkowity,</li>\r\n<li>żelazo,</li>\r\n<li>stężenie transferyny,</li>\r\n<li>mocznik,</li>\r\n<li>kreatynina,</li>\r\n<li>glukoza,</li>\r\n<li>test obciążenia glukozą,</li>\r\n<li>białko całkowite,</li>\r\n<li>proteinogram,</li>\r\n<li>albumina,</li>\r\n<li>białko C-reaktywne (CRP),</li>\r\n<li>kwas moczowy,</li>\r\n<li>cholesterol całkowity,</li>\r\n<li>cholesterol-HDL,</li>\r\n<li>cholesterol-LDL,</li>\r\n<li>triglicerydy (TG),</li>\r\n<li>bilirubina całkowita,</li>\r\n<li>bilirubina bezpośrednia,</li>\r\n<li>fosfataza alkaliczna (ALP),</li>\r\n<li>minotransferaza asparaginianowa (AST),</li>\r\n<li>aminotransferaza alaninowa (ALT),</li>\r\n<li>gammaglutamylotranspeptydaza (GGT),</li>\r\n<li>amylaza,</li>\r\n<li>kinaza kreatynowa (CK),</li>\r\n<li>fosfataza kwaśna całkowita (ACP),</li>\r\n<li>czynnik reumatoidalny (RF),</li>\r\n<li>miano antystreptolizyn O (ASO),</li>\r\n<li>hormon tyreotropowy (TSH),</li>\r\n<li>antygen HBs-AgHBs,</li>\r\n<li>VDRL.</li>\r\n</ul>\r\n<p><u>Badania moczu</u></p>\r\n<ul>\r\n<li>og&oacute;lne badanie moczu z oceną mikroskopową osadu,</li>\r\n<li>ilościowe oznaczanie białka,</li>\r\n<li>ilościowe oznaczanie glukozy,</li>\r\n<li>ilościowe oznaczanie wapnia,</li>\r\n<li>ilościowe oznaczanie amylazy.</li>\r\n</ul>\r\n<p><u>Badania kału</u></p>\r\n<ul>\r\n<li>badanie og&oacute;lne,</li>\r\n<li>pasożyty,</li>\r\n<li>krew utajona - metodą immunochemiczną.</li>\r\n</ul>\r\n<p><u>Badania układu krzepnięcia&nbsp;</u></p>\r\n<ul>\r\n<li>wskaźnik protrombinowy (INR),</li>\r\n<li>czas kaolinowo-kefalinowy (APTT),</li>\r\n<li>fibrynogen.</li>\r\n</ul>\r\n<p><u>Badania mikrobiologiczne&nbsp;</u></p>\r\n<ul>\r\n<li>posiew moczu z antybiogramem,</li>\r\n<li>posiew wymazu z gardła,</li>\r\n<li>og&oacute;lny posiew kału w kierunku pałeczek Salmonella, Shigella.</li>\r\n</ul>\r\n<p><u>Badanie elektrokardiograficzne (EKG) w spoczynku</u></p>\r\n<p><u>Badanie ultrasonografi czne (USG) jamy brzusznej</u></p>\r\n<p><u>Zdjęcia radiologiczne</u></p>\r\n<ul>\r\n<li>zdjęcie klatki piersiowej w projekcji AP i bocznej;</li>\r\n<li>zdjęcia kostne &ndash; w przypadku kręgosłupa, kończyn i miednicy w projekcji AP i bocznej,</li>\r\n<li>zdjęcie czaszki i zatok w projekcji AP i bocznej,</li>\r\n<li>zdjęcie przeglądowe jamy brzusznej.</li>\r\n</ul>', 'pl', 'badania-lekarza-rodzinnego'),
	(13, 'Medycyna niegodziwa etycznie', '<p class="Standard">Będąc Pacjentem lekarza NaPro Technologa zgadzasz się, że lekarz nie zaproponuje Wam metody, kt&oacute;ra jest niegodziwa etycznie czy wręcz szkodliwa dla zdrowia, choćby opracowania Towarzystw Naukowych zalecały takie postępowanie w Twoim przypadku. Dotyczy to w szczeg&oacute;lności:</p>\r\n<ul>\r\n<li>antykoncepcji</li>\r\n<li>aborcji</li>\r\n<li>prenatalnej diagnostyki eugenicznej</li>\r\n<li>zapłodnienia pozaustrojowego</li>\r\n<li>mikromanipulacji na gametach (ICSI, korekta chor&oacute;b mitochondrialnych z tworzeniem hybrydowego oocytu)</li>\r\n<li>transferu oocytu własnego &ndash; zamrożonego (FET)</li>\r\n<li>rodzicielstwa zastępczego</li>\r\n<li>donacji gamet</li>\r\n<li>inseminacji domacicznych</li>\r\n<li>leczenia genetycznego w stadium przedimplantacyjnym</li>\r\n<li>krioprezerwacji zarodk&oacute;w bioptat&oacute;w gonad czy gamet zar&oacute;wno podczas procedur ART jak i przed leczeniem niszczącym płodność (chemio - i radioterapia) zwanym oncofertility.</li>\r\n</ul>', 'pl', 'medycyna-niegodziwa-etycznie'),
	(14, 'Niepłodność męska, czynnik męski', '<p><b>Niepłodność męska</b> (męski czynnik niepłodności, <i>male infertility factor</i>, MIF) brak zdolności do produkcji pełnowartościowych plemnik&oacute;w (impotentia coeundi) lub niemożność odbycia stosunku płciowego (impotentia generandi). Przyjmuje się, że męski czynnik występuje u 40 % przypadk&oacute;w niepłodności małżeńskiej.&nbsp; Dodatkowo u 20 % par występuje łącznie czynnik męski i żeński. Należy podkreślić, że tylko całkowity i stały brak plemnik&oacute;w w nasieniu całkowicie przekreśla szanse mężczyzny na bycie ojcem. Do chwili obecnej nie ustalono dolnej granicy koncentracji plemnik&oacute;w w nasieniu, kt&oacute;ra wykluczyłaby mężczyznę z rozrodu. Badanie andrologiczne jest podstawą diagnostyki niepłodności męskiej.</p>\r\n<p>Na parametry nasienia wpływa bardzo wiele czynnik&oacute;w; dla potrzeb akademickich wymienić można:</p>\r\n<ul>\r\n<li>Zaburzenia genetyczne stanowiące ok. 15% przyczyn niepłodności męskiej. Najczęściej stwierdza się dodatkowy chromosom X, translokacje chromosomalne, mutację w genie CFTR czy mikrodelecje w chromosomie Y</li>\r\n<li>Wady wrodzone, często niezstąpione jądra, niedrożność przewod&oacute;w wyprowadzających CBAVD</li>\r\n<li>Żylaki powr&oacute;zka nasiennego powodują miejscowe podwyższenie temperatury w&nbsp;miejscu wydostawania się plemnik&oacute;w z&nbsp;jądra, co sprawia, że obniża się ich ruchliwość lub nawet&nbsp;giną.</li>\r\n<li>Każda choroba og&oacute;lnoustrojowa (nawet kr&oacute;tkotrwałe banalne infekcje) mają wpływ na parametry nasienia; zwykle jednak zmiany w spermiogramie obserwujemy z op&oacute;źnieniem 2 &ndash; 3 miesięcznym</li>\r\n<li>Przyczyny infekcyjne męskich narząd&oacute;w płciowych: przebyte w dzieciństwie (świnkowe wirusowe zapalenie jąder &ndash; zniszczenie jąder 25% przypadk&oacute;w) czy nabyte po rozpoczęciu życia seksualnego (zapalenie najądrzy powodowane np. przez chlamydie). Każdy stan zapalny męskich narząd&oacute;w rozrodczych może skutkować uszkodzeniem budowy i/lub funkcji plemnik&oacute;w lub spowodować zniszczenie najądrzy</li>\r\n<li>Urazy jąder, zar&oacute;wno związane z wypadkami jak i po operacjach, np. leczenia przepukliny pachwinowej, przebyty skręt jądra</li>\r\n<li>Ciężkie choroby og&oacute;lnoustrojowe: niewydolność wątroby, trzustki, nerek, układu krążenia, cukrzyca, niedokrwistość, nowotwory (zar&oacute;wno sam fakt choroby jak i następstwa leczenia przeciwnowotworowego: radio -&nbsp; i chemioterapia)</li>\r\n<li>Przyjmowane leki</li>\r\n<li>Wsteczna ejakulacja, kt&oacute;rej przyczyną są zaburzenia kurczliwości mięśni cewki moczowej, powodujące przesuwanie plemnik&oacute;w do pęcherza moczowego zamiast ujściem cewki moczowej na zewnątrz. Zaburzenia te mogą mieć charakter przejściowy lub&nbsp;trwały.</li>\r\n<li>Styl życia: nikotynizm, alkoholizm, narkomania</li>\r\n<li>Szkodliwe czynniki środowiskowe i zawodowe (przegrzanie okolic narząd&oacute;w płciowych, środki ochronny roślin, barwniki anilinowe, metale, narażenie na promieniowanie elektromagnetyczne, plastyfikatory używane w tworzywach sztucznych)</li>\r\n</ul>\r\n<p>Pomimo długiej listy nadal w 25 &ndash; 30% przypadk&oacute;w niepłodności męskiej nie udaje się ustalić przyczyny &ndash; rozpoznaje się wtedy niepłodność idiopatyczną.</p>', 'pl', 'nieplodnosc-meska-czynnik-meski'),
	(15, 'Niepłodność żeńska', '<p><b>Niepłodność żeńska</b> może dotyczyć zar&oacute;wno procesu powstawania oocytu, możliwości odbywania stosunku płciowego, drożności dr&oacute;g rodnych, stworzenia warunk&oacute;w do kontaktu plemnik&oacute;w z oocytem, aktywnego transportu zygoty do jamy macicy jak r&oacute;wnież implantacji &ndash; zagnieżdżenia nowego życia w organizmie matki. Zdolność do utrzymania nowego życia <i>(fecundity)</i> może być wikłana przez czynniki prowadzące do <b>poronienia</b> <i>(abortus)</i> czy wystąpienia <b>porodu przedwczesnego</b> <i>(partus praematurus, Praterm Labour PTL)</i> skutkującego nawet urodzeniem niezdolnego do przeżycia dziecka. Gdy do zgonu dziecka dochodzi wewnątrzmacicznie m&oacute;wi się o <b>wewnątrzmacicznym obumarciu</b> odpowiednio: zarodka <i>(poronienie zatrzymane, missed abortion)</i> lub płodu <i>(mors foetus intrauterina)</i>.&nbsp; Statystyki m&oacute;wią o 40% udziale czynnika żeńskiego w niepłodności małżeńskiej, dodatkowo u 20% par występuje łącznie żeński i męski czynnik odpowiedzialny za niepłodność.</p>\r\n<p><b>Najczęstsze przyczyny&nbsp;niepłodności&nbsp;kobiet:</b></p>\r\n<ul>\r\n<li>Zmiany anatomiczne dr&oacute;g rodnych (wrodzone i nabyte)</li>\r\n<li>Zaburzenia jajeczkowania (najczęściej zesp&oacute;ł PCO)</li>\r\n<li>Zaburzenia hormonalne (hiperprolaktynemia, zaburzenia fazy lutealnej, choroby tarczycy, nadnerczy)</li>\r\n<li>Zaburzenia immunologiczne (auto i alloimmunologiczne)</li>\r\n<li>Endometrioza (czynnik anatomiczny, zaburzenia jajeczkowania i czynnik immunologiczny)</li>\r\n</ul>', 'pl', 'nieplodnosc-zenska'),
	(16, 'Niepłodność', '<p>Niepłodność można definiować:</p>\r\n<p align="center"><u>Ze względu na zakres niepłodności</u></p>\r\n<p><strong>Niepłodność całkowita</strong> (<em>sterilitas absoluta</em>), czyli stan w kt&oacute;rym nie ma fizycznej możliwości do zajścia czy utrzymania ciąży. Obejmuje to u kobiety stany takie jak: brak jajnik&oacute;w, jajowod&oacute;w, macicy czy pochwy, a także poważne wady tych narząd&oacute;w zar&oacute;wno o podłożu wrodzonym czy nabytym. U mężczyzny o niepłodności całkowitej m&oacute;wimy w sytuacji braku jąder (wada wrodzona czy bądź nabyta czyli kastracja)</p>\r\n<p><strong>Niepłodność względna </strong>(<em>sterilitas relativa </em>lub <em>sterilitas temporaria</em>) to stan w kt&oacute;rym istnieje pierwotna przyczyna dająca szansę na wyleczenie.</p>\r\n<p align="center"><u>Ze względu na czas wystąpienia</u></p>\r\n<p><strong>Niepłodność pierwotna</strong> <em>(sterilitas primaria) </em>to niemożność zajścia w ciążę kobiety, lub niemożność zapłodnienia przez mężczyznę, od rozpoczęcia wsp&oacute;łżycia.</p>\r\n<p><strong>Niepłodność wt&oacute;rna</strong> <em>(sterilitas secundaria)</em> to stan w kt&oacute;rym istniała potwierdzona wcześniej płodność, lecz została zahamowana. Może ona mieć podłoże chorobowe (czynnik jajowodowy, przebyte stany zapalne , zaburzenia czynnościowe i inne) lub jatrogenne, tzn. jako skutek działalności lekarskiej (obustronna kastracja, obliteracja jajowod&oacute;w, niepłodność po stosowaniu antykoncepcji i inne)</p>\r\n<p align="center"><u>Ze względu na pochodzenie</u></p>\r\n<p><strong>Niepłodność męska</strong></p>\r\n<p><strong>Niepłodność żeńska</strong></p>\r\n<p>Niemniej zar&oacute;wno płodność jak i niepłodność należy rozpatrywać w kontekście konkretnej pary małżeńskiej, czyli rozpoznawać:</p>\r\n<p><strong>Niepłodność małżeńska</strong> w klasycznej definicji&nbsp; to niemożność uzyskania ciąży po rocznym wsp&oacute;łżyciu w celu koncepcyjnym. Obecnie dotyka ona 18-20% małżeństw w Polsce.</p>\r\n<p align="center"><u>Ze względu na zakończenie diagnostyki</u></p>\r\n<p><strong>Niepłodność idiopatyczna</strong> to sytuacja w kt&oacute;rej dostępnymi metodami nie jesteśmy w stanie czy to postawić rozpoznania czy zastosować skutecznej terapii. Statystyki podają od 14 do 30% niepłodności w kt&oacute;rych medycyna nie jest w stanie pom&oacute;c żadnymi dostępnymi sposobami. W grupie niepłodności idiopatycznej z powodu braku powszechnych metod analitycznych wyr&oacute;żnia się zaburzenia układu odpornościowego: <strong>alloimmunologiczne </strong>&nbsp;kiedy kobieta wytwarza przeciwciała przeciwko plemnikom partnera, albo jest uczulona na pewne antygeny trofoblastu i reaguje zamknięciem naczyń odżywiających go, co z&nbsp;kolei powoduje obumarcie odżywianego za pomocą trofoblastu zarodka. Występują też zaburzenia <strong>autoimmunologiczne</strong>, kiedy reakcja immunologiczna skierowana jest przeciwko własnym kom&oacute;rkom własnych narząd&oacute;w co może prowadzić np. do wytworzenia przeciwciał przeciwjajnikowych i do przedwczesnej niewydolności&nbsp;jajnik&oacute;w.</p>\r\n<p><strong>Niepłodność</strong> (Sterilitas, infertilitas, infecundity) jest objawem wielu schorzeń i ich wymienienie przekracza ramy tego opracowania. Reasumując; każde ciężkie schorzenie, zwłaszcza przewlekłe obniża płodność. Istotą leczenia niepłodności jest rozpoznanie występujących schorzeń i właściwe ich leczenie by odtworzyć utraconą płodność.</p>', 'pl', 'nieplodnosc');
/*!40000 ALTER TABLE `dictionary_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.download
CREATE TABLE IF NOT EXISTS `download` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file` text COLLATE utf8_polish_ci,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.download: ~1 rows (około)
/*!40000 ALTER TABLE `download` DISABLE KEYS */;
INSERT INTO `download` (`id`, `file`, `hidden`, `created_at`, `updated_at`) VALUES
	(1, '/useruploads/files//in_vitro_contra_naprotechnologia.pdf', 0, '2014-11-23 14:27:09', '2014-11-23 14:27:09');
/*!40000 ALTER TABLE `download` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.download_translation
CREATE TABLE IF NOT EXISTS `download_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `download_translation_sluggable_idx` (`slug`,`lang`,`title`),
  CONSTRAINT `download_translation_id_download_id` FOREIGN KEY (`id`) REFERENCES `download` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.download_translation: ~1 rows (około)
/*!40000 ALTER TABLE `download_translation` DISABLE KEYS */;
INSERT INTO `download_translation` (`id`, `title`, `lang`, `slug`) VALUES
	(1, 'In vitro kontra naprotechnologia', 'pl', 'in-vitro-kontra-naprotechnologia');
/*!40000 ALTER TABLE `download_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.faq
CREATE TABLE IF NOT EXISTS `faq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.faq: ~10 rows (około)
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` (`id`, `hidden`) VALUES
	(1, 0),
	(2, 0),
	(3, 0),
	(4, 0),
	(5, 0),
	(6, 0),
	(7, 0),
	(8, 0),
	(9, 0),
	(10, 0);
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.faq_translation
CREATE TABLE IF NOT EXISTS `faq_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `faq_translation_sluggable_idx` (`slug`,`lang`,`title`),
  CONSTRAINT `faq_translation_id_faq_id` FOREIGN KEY (`id`) REFERENCES `faq` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.faq_translation: ~9 rows (około)
/*!40000 ALTER TABLE `faq_translation` DISABLE KEYS */;
INSERT INTO `faq_translation` (`id`, `title`, `body`, `lang`, `slug`) VALUES
	(1, 'Co to jest Płodność?', '<p>Płodność to zdolność do przekazania (powołania) życia w łączności z osobą płci przeciwnej.</p>\r\n<p>Prawdopodobieństwo koncepcji u człowieka wynosi średnio 25 - 30% w jednym cyklu, natomiast zmniejszony potencjał rozrodczy obydwojga rodzic&oacute;w zmniejsza miesięczne prawdopodobieństwo koncepcji nawet do wartości setnych procenta. Dla jednej pary może ono wynosić 50%&nbsp; a dla innej 5%. Z tego wynika, że przy prawdopodobieństwie miesięcznym 50% potrzeba dw&oacute;ch miesięcy do poczęcia dziecka, podczas gdy para z 5% prawdopodobieństwem będzie potrzebowała 20 miesięcy, by doszło do koncepcji. Płodność zawsze dotyczy pary małżonk&oacute;w i jest wypadkową składowych płodności męża i żony.</p>\r\n<p>Szacuje się, że w populacji og&oacute;lnej (zawierającej r&oacute;wnież niepłodne pary) 84% kobiet zajdzie w ciążę po 12 m-cach regularnego wsp&oacute;łżycia, po dw&oacute;ch latach 92% a po trzech 93%, bez stosowania ingerencji terapeutycznych.</p>\r\n<p>Płodność kobiet obniża się z wiekiem, lecz całkowicie i bezpowrotnie zanika, gdy kobieta wejdzie w okres menopauzy. U mężczyzn natomiast obniża się, lecz nie znika nigdy całkowicie z powodu wieku.</p>\r\n<p>Około 12% mężczyzn diagnozowanych z powodu bezdzietności wykazuje pełną niepłodność właściwie bez szans na ustalenie przyczyn i dobranie odpowiedniej terapii, większość ( ok. 75% ) stanowią mężczyźni z obniżonym potencjałem płodności.</p>', 'pl', 'co-to-jest-plodnosc'),
	(2, 'Co to jest niepłodność?', '<p>Według profesora Hilgersa, niepłodność małżeńska nie jest chorobą lecz objawem r&oacute;żnych chor&oacute;b.</p>\r\n<p>Definicja upowszechniana przez autor&oacute;w takich jak: Kase i Weingold (1983), Benson (1988), Menning (1988), Hutton (1991), Kikendall (1994), Abma i in. (1997) określa mianem niepłodności</p>\r\n<p>indywidualną niezdolność kobiety do zajścia w <strong>ciążę </strong>i wydania na świat potomstwa pomimo normalnego, regularnego wsp&oacute;łżycia (trzy, cztery razy w tygodniu) ze zdrowym mężczyzną w ciągu jednego roku bez stosowania środk&oacute;w antykoncepcyjnych.</p>\r\n<p>Inni autorzy stosują ramy czasowe od 6 do 24 miesięcy.</p>', 'pl', 'co-to-jest-nieplodnosc'),
	(3, 'Co to jest NaProTECHNOLOGY® (NaProTechnologia)?', '<p class="Standard">NaProTechnologia jest dziedziną medycyny prokreacyjnej, kt&oacute;rą opracował Thomas W. Hilgers z USA (natural procreative technology) człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą integralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego. Z uwagi na stosowane podejście filozoficzne, umocowania kulturowe, zasady postępowania, podejście badawcze i implikacje społeczne stanowiące o zaistnieniu paradygmatu naukowego można nazywać ją nauką, stąd rozwinięcie &ndash; logia (greckie <em>logos</em> &ndash; <em>słowo</em>). Pojęcie NaPro Technology zostało utworzone jako opozycja do Artificial Reproductive Technology (ART), kt&oacute;re tłumaczy się jako technologia sztucznej reprodukcji. Widoczne tutaj podejście T.W. Hilgersa w odr&oacute;żnieniu angielskich sł&oacute;w Reproductive i Procreative ma znaczenie ontologiczne i uwydatnia rolę człowieka w tw&oacute;rczej wsp&oacute;łpracy z Bogiem i nie degraduje jego roli do reproduktora. Z kolei zamiana sł&oacute;w Artificial na Natural określa drogę i kierunek działań lekarza uwzględniającego w swym postępowaniu godność osobistą każdego człowieka (tutaj jako pacjenta).</p>\r\n<p class="Standard">Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną The Creighton Model Fertility Care System (CrMS), stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>\r\n<p class="Standard">Przez poznanie biomarker&oacute;w płodności (NaPro TRACK) łatwiejszym staje się diagnostyka jak r&oacute;wnież terapia:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li>endometriozy</li>\r\n<li>zespołu policystycznych jajnik&oacute;w (PCOS)</li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n</ul>\r\n<p>CrMS jest naukowo przebadany, dokładny, precyzyjny i skuteczny, wsp&oacute;łpracuje z płodnością, szanuje godność kobiety i integralność małżeństwa.</p>', 'pl', 'co-to-jest-naprotechnology-naprotechnologia'),
	(4, 'Jakie są szanse na poczęcie dziecka przy stosowaniu procedur NaProTECHNOLOGY?', '<p>W dostępnej literaturze skumulowane wskaźniki ciąż po leczeniu NaProTECHNOLOGY<sup>&reg;</sup> z powodu niepłodności uzyskano w</p>\r\n<p>do 12 miesięcy - uzyskano 44% ciąż,<br />do 24 miesięcy uzyskano 62% ciąż,<br />w 48 miesięcy od rozpoczęcia leczenia 71%.</p>\r\n<p>Wyniki leczenia kiedy rozpoznaną przyczyną niepłodności była endometrioza:</p>\r\n<p>45% do 12 miesięcy,<br />65% do 24 miesięcy,<br />78% do 36 miesięcy.</p>\r\n<p>Skumulowany wskaźnik ciąż dla pacjentek z rozpoznaniem: zesp&oacute;ł policystycznych jajnik&oacute;w (PCO):</p>\r\n<p>40% po 12 miesiącach<br />65% po 24 miesiącach<br />do 90% po 48 miesiącach</p>\r\n<p>NaProTECHNOLOGY<sup>&reg;</sup> okazuje się 2,67 razy bardziej skuteczna niż in vitro dla endometriozy, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w. W badaniu z Irlandii, w latach 1998-2002 zgłosiło się 1239 par małżeńskich z powodu niepłodności. Średni wiek kobiet to 35,8 lat, średnia długość trwania niepłodności 5,6 roku. 33% par wcześniej było leczonych ART. Wskaźnik ciąż <b>NaProTECHNOLOGY</b> wyni&oacute;sł 52%. Udało się pom&oacute;c około 30% par po niepowodzeniach ART, czyli technik wspomaganego rozrodu &bdquo;in vitro&rdquo;.(J Am Board Fam Med 2008;21:375&ndash;384.)</p>\r\n<p>Szczeg&oacute;łowe badania nad skutecznością metody w przypadkach problem&oacute;w z płodnością dostępne są na stronie: <a href="http://naprotechnology.com/infertility.htm" target="_blank">http://naprotechnology.com/infertility.htm</a></p>\r\n<p>Wyniki leczenia niepłodności metodą NaProTECHNOLOGY<sup>&reg;</sup> opublikowane zostały w 2004 roku przez prof. Thomasa Hilgersa w <i>The Medical and Surgical Practice of NaProTECHNOLOGY</i> oraz w 2008 roku w publikacji Josepha B. Stanforda, MD,MSPH, Tracey A.Parnella, MD and Phila C. Boyle, MB w czasopiśmie medycznym "Journal of the American Board of Family Medicine: Outcomes From Treatment of Infertility With Natural Procreative Technology in an Irish General Practice".</p>', 'pl', 'jakie-sa-szanse-na-poczecie-dziecka-przy-stosowaniu-procedur-naprotechnology'),
	(5, 'Na czym polega leczenie w protokole NaProTECHNOLOGY?', '<p>Na stworzeniu optymalnych warunk&oacute;w do naturalnego poczęcia i utrzymania ciąży. W tym celu lekarz konsultant dogłębnie analizuje sytuację zdrowotną pary, stawia rozpoznania istniejących schorzeń i nieprawidłowości, zaleca leczenie i dąży do przywr&oacute;cenia pełni płodności. Aby było to możliwe, konsultant musi mieć aktualną, obiektywną wiedzę na temat sytuacji endokrynologicznej kobiety i w tym celu wsp&oacute;łpracuje z Instruktorem metody The Creighton Model FertilityCare System, kt&oacute;ra daje niezastąpiony wgląd w cykl Kobiety poprzez szereg biomarker&oacute;w, określanych jako NaProTRACK.</p>\r\n<p>Początek terapii to nauka metody pod okiem certyfikowanego Instruktora, kt&oacute;ry po osiągnięciu wystarczających umiejętności prowadzenia obserwacji przez Parę kieruje do Konsultanta na pogłębioną diagnostykę i leczenie. Cały program terapeutyczny zamyka się w 18-24 miesiącach. Niekt&oacute;re ośrodki przedłużają ten okres i obserwują wzrost skumulowanych wskaźnik&oacute;w ciąż po 48 miesiącach terapii. Jeśli jednak nie dochodzi do poczęcia a zrobiono wszystko, co było możliwe proponuje się parze małżeńskiej procedurę adopcyjną jako propozycję realizacji powołania rodzicielskiego.</p>\r\n<p>Lekarz Konsultant NaProTECHNOLOGY nie zaproponuje nigdy parze metody, kt&oacute;ra jest niegodziwa etycznie czy wręcz szkodliwa dla zdrowia, choćby opracowania Towarzystw Naukowych zalecały takie postępowanie w Twoim przypadku. Dotyczy to w szczeg&oacute;lności: </p>\r\n<ul>\r\n<li>antykoncepcji</li>\r\n<li>aborcji</li>\r\n<li>prenatalnej diagnostyki eugenicznej</li>\r\n<li>zapłodnienia pozaustrojowego</li>\r\n<li>mikromanipulacji na gametach (ICSI, korekta chor&oacute;b mitochondrialnych z tworzeniem hybrydowego oocytu)</li>\r\n<li>transferu oocytu własnego &ndash; zamrożonego (FET)</li>\r\n<li>rodzicielstwa zastępczego</li>\r\n<li>donacji gamet</li>\r\n<li>inseminacji domacicznych</li>\r\n<li>leczenia genetycznego w stadium przedimplantacyjnym</li>\r\n<li>krioprezerwacji zarodk&oacute;w czy gamet zar&oacute;wno podczas procedur ART jak i przed leczeniem niszczącym płodność (chemio - i radioterapia) zwanym oncofertility.</li>\r\n</ul>', 'pl', 'na-czym-polega-leczenie-w-protokole-naprotechnology'),
	(6, 'Czy muszę uczyć się obserwacji cyklu?', '<p>Podstawą diagnostyki i leczenia jest obserwacja biomarker&oacute;w Creighton Model System (CrMS).</p>\r\n<p>Gromadzenie informacji na karcie służy nie tylko postawieniu diagnozy poprzez analizę biomarker&oacute;w (NaProTRACK), ale pozwala na precyzyjne i powtarzalne stawianie zaleceń, ujednolica przekaz informacji na poziomie Lekarz &ndash; Pacjent jak r&oacute;wnież umożliwia konsultacje pomiędzy Lekarzami. Poza tym standaryzacja opis&oacute;w i zapis&oacute;w w karcie obserwacji powoduje, że pacjentki na całym świecie są w ten sam spos&oacute;b uczone metody. Wstępna diagnostyka trwa od 3 do 5 miesięcy. Para dokonuje obserwacji pod opieką instruktora metody.</p>\r\n<p>Następnie małżeństwo trafia do lekarza i wchodzi w drugi etap, polegający na rozpoznaniu przyczyny i postawieniu rozpoznania. Wśr&oacute;d zlecanych badań najczęściej ocenia się poziomy hormon&oacute;w, badania biochemiczne i mikrobiologiczne oraz wykonuje się badanie USG. Diagnozuje się także mężczyznę w kierunku czynnika męskiego niepłodności. Ustalenie diagnozy może trwać r&oacute;żnie długo, ale jest ono konieczne przed wprowadzeniem Pary na kolejny, trzeci etap &ndash; terapię.</p>\r\n<p>Ten etap, czyli&nbsp; program terapeutyczny zamyka się w 18-24 miesiącach. Jeśli jednak nie dochodzi do poczęcia a zrobiono wszystko, co było możliwe proponuje się parze małżeńskiej procedurę adopcyjną jako propozycję realizacji powołania rodzicielskiego. Należy podkreślić, że Lekarz &ndash; Konsultant NaPro nie zaproponuje Parze metody niegodziwej etycznie czy wręcz szkodliwej dla zdrowia, choćby opracowania Towarzystw Naukowych zalecały takie postępowanie.</p>', 'pl', 'czy-musze-uczyc-sie-obserwacji-cyklu'),
	(7, 'Jak mogę przygotować się na pierwszą wizytę u Konsultanta NaProTECHNOLOGY?', '<p>Warto przynieść całą dostępną dokumentację medyczną, posegregować ją chronologicznie oddzielnie dla każdego z Małżonk&oacute;w.</p>\r\n<p class="Standard">Zanim um&oacute;wisz się na wizytę do gabinetu postaraj się wykonać (1-2 tyg wcześniej) następujące badania:</p>\r\n<ul>\r\n<li>krwi obwodowej:</li>\r\n<li>morfologia</li>\r\n<li>OB</li>\r\n<li>mocznik</li>\r\n<li>kreatynina</li>\r\n<li>kwas moczowy</li>\r\n<li>transaminaza alaninowa (AlAT)</li>\r\n<li>transaminaza asparaginianowa (AspAT)</li>\r\n<li>bilirubina całkowita</li>\r\n<li>cholesterol całkowity</li>\r\n<li>tr&oacute;jglicerydy</li>\r\n<li>glukoza na czczo</li>\r\n<li>antygen HBs</li>\r\n<li>VDRL</li>\r\n<li>badanie og&oacute;lne moczu (ze środkowego strumienia)</li>\r\n</ul>\r\n<p class="Standard">na te badania może skierować Was Lekarz Rodzinny.</p>\r\n<p>R&oacute;wnolegle do rozpoczęcia szkolenia u Instruktora CrMS i diagnostyki u Lekarza Rodzinnego pomyśl o wizycie u Stomatologa by zawczasu wyleczyć wszystkie ogniska zapalne i wymianę posiadanych wypełnień z amalgamatem mogące mieć wpływ na Twoje zdrowie.</p>', 'pl', 'jak-moge-przygotowac-sie-na-pierwsza-wizyte-u-konsultanta-naprotechnology'),
	(8, 'Czy NaProTECHNOLOGY daje większe szanse niż techniki rozrodu wspomaganego?', '<p>W dostępnej literaturze skuteczność leczenia metodą <b>NaProTECHNOLOGY</b> w por&oacute;wnaniu do postępowania in vitro przedstawiała się następująco:</p>\r\n<ul>\r\n<li>jeżeli przyczyną niepłodności był brak owulacji to uzyskano <b>81,8%</b> poczęć,</li>\r\n<li>jeżeli zesp&oacute;ł PCO to <b>62,5%</b></li>\r\n<li>jeżeli endometrioza to <b>56,7%,</b></li>\r\n<li>jeżeli niedrożność jajowod&oacute;w to <b>38,4%.</b></li>\r\n</ul>\r\n<p>Dla in vitro analogicznie wyniki z lat 1986 &ndash; 2001 <b>od 21 do 27%</b> <b>ciąż na kobietę</b>. Stosowanie w niekt&oacute;rych plac&oacute;wkach transferu do jamy macicy blastocysty (kt&oacute;re po implantacji rzadziej obumierają w jamie macicy) zwiększa w statystykach ilość ciąż na transfer (niekt&oacute;re ośrodki podają nawet 40%) ale zupełnie pomija obumieranie znacznie większej ilości zarodk&oacute;w na wcześniejszych etapach rozwoju w cieplarce, kt&oacute;re nie są podawane w statystykach. Ten manewr statystyczny często jest niedostrzegany przez nieprofesjonalist&oacute;w i często używany w celach promocji ART.</p>', 'pl', 'czy-naprotechnology-daje-wieksze-szanse-niz-techniki-rozrodu-wspomaganego'),
	(9, 'Czy NaProTECHNOLOGY leczy każdy rodzaj niepłodności?', '<p>Podział niepłodności obejmuje między inny innymi następujące pojęcia: </p>\r\n<p><b>Niepłodność całkowita</b> (<i>sterilitas absoluta</i>), czyli stan w kt&oacute;rym nie ma fizycznej możliwości do zajścia czy utrzymania ciąży. Obejmuje to u kobiety stany takie jak: brak jajnik&oacute;w, jajowod&oacute;w, macicy czy pochwy, a także poważne wady tych narząd&oacute;w zar&oacute;wno o podłożu wrodzonym czy nabytym. U mężczyzny o niepłodności całkowitej m&oacute;wimy w sytuacji braku jąder (wada wrodzona czy bądź nabyta czyli kastracja) </p>\r\n<p><b>Niepłodność względna</b><b> </b>(<i>sterilitas relativa </i>lub <i>sterilitas temporaria</i>) to stan w kt&oacute;rym istnieje pierwotna przyczyna dająca szansę na wyleczenie.</p>\r\n<p>Mając powyższy podział na uwadze, należy stwierdzić, że nie wszyscy mogą uzyskać płodność po zastosowanym leczeniu. Dotyczy to wszystkich obecnie stosowanych metod leczenia.</p>', 'pl', 'czy-naprotechnology-leczy-kazdy-rodzaj-nieplodnosci'),
	(10, 'Czy NaPro może pomóc gdy istnieje niepłodność męska?', '<p>Naprotechnologia to naturalne podejście do zagadnień zdrowia prokreacyjnego człowieka, z definicji szuka przyczyny problemu i proponuje najwłaściwszą terapię. Nie ma tu miejsca na &bdquo;obejście bokiem&rdquo; problemu, bo podważona była by sama idea leczenia a Pacjent pozostałby nadal ze swoim problemem , otrzymując co najwyżej &bdquo;Produkt&rdquo; procedur udzielanych przez Świadczeniodawc&oacute;w. Medycyna odczłowieczona, sprowadzona do świadczeniobiorc&oacute;w i udzielających świadczenie,&nbsp; deprecjonuje wartość każdej istoty ludzkiej zaangażowanej w ten system, tak Lekarza jak i Pacjenta. To stwierdzenie ma się w spos&oacute;b szczeg&oacute;lny do procedur zapłodnienia pozaustrojowego i docytoplazmatycznego wstrzyknięcia plemnika do kom&oacute;rki jajowej (ICSI), kt&oacute;re są nadal szeroko proponowane Pacjentom z obniżonymi parametrami nasienia.</p>\r\n<p>Płodność małżeństwa zawsze musi być rozpatrywana w odniesieniu do pary. Zmniejszony potencjał rozrodczy jednego z małżonk&oacute;w może być kompensowany do pewnego stopnia zwiększeniem potencjału rozrodczego drugiego z nich. W przypadku podejrzenia, że istnieje czynnik męski (male factor infertility) należy zadbać o jak najlepsze parametry śluzu (bo w lepszym śluzie nawet mniejsza liczba plemnik&oacute;w będzie miała szansę na zapłodnienie) jak r&oacute;wnież o prawidłowy cykl owulacyjny. Poza tym wnikliwa ocena czynnik&oacute;w powodujących pogorszenie parametr&oacute;w nasienia często pozwala na zastosowanie terapii celowanej i uzyskanie nie tylko poprawy w świetle ocenianych parametr&oacute;w seminologicznych, ale co najważniejsze &ndash; ciążę, kt&oacute;ra stanowi owoc miłości małżonk&oacute;w i starań Lekarza Konsultanta NaPro. Poszukiwanie istoty choroby to gł&oacute;wny cel każdego Lekarza, bo tylko takie postępowanie jest uczciwe i daje szansę na zastosowanie skutecznego leczenia.</p>\r\n<p>Trzeba też stale pamiętać, że obecnie u ok. 40 &ndash; 50 % par borykających się z niepłodnością istnieje łącznie czynnik męski i żeński niepłodności, zatem po rozpoznaniu problemu u męża nie należy zaniedbywać diagnostyki i leczenia żony, gdyż i z jej strony może istnieć dodatkowa przeszkoda, kt&oacute;ra do tej pory nie została odkryta a diagnozowanie i leczenie wyłącznie mężczyzny może nie dać spodziewanych efekt&oacute;w.</p>\r\n<p>Lekarz &ndash; Konsultant NaPro pomoże ustalić plan diagnostyki i zaproponuje leczenie niepłodności męskiej. Konsultacja andrologiczna jest proponowana wszystkim mężczyznom zainteresowanym własną płodnością, nawet gdy Małżonka nie leczy się u Ginekologa lub gdy Mężczyzna nie jest żonaty a interesuje się własnym zdrowiem prokreacyjnym.</p>', 'pl', 'czy-napro-moze-pomoc-gdy-istnieje-nieplodnosc-meska');
/*!40000 ALTER TABLE `faq_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.gallery_1
CREATE TABLE IF NOT EXISTS `gallery_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.gallery_1: ~0 rows (około)
/*!40000 ALTER TABLE `gallery_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_1` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.lang
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

-- Zrzucanie danych dla tabeli napromed_dev.lang: ~4 rows (około)
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
INSERT INTO `lang` (`id`, `name`, `flag`, `slug`, `hidden`, `position`) VALUES
	(1, 'Polski', '/useruploads/images/flagi/flaga_pl.gif', 'pl', 0, 1),
	(2, 'Niemiecki', '/useruploads/images/flagi/flaga_de.gif', 'de', 1, 2),
	(3, 'Angielski', '/useruploads/images/flagi/flaga_en.gif', 'en', 1, 3),
	(4, 'Rosyjski', '/useruploads/images/flagi/flaga_ru.jpg', 'ru', 1, 4);
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.mail_data
CREATE TABLE IF NOT EXISTS `mail_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email_from` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `name_from` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.mail_data: ~1 rows (około)
/*!40000 ALTER TABLE `mail_data` DISABLE KEYS */;
INSERT INTO `mail_data` (`id`, `type`, `email_from`, `name_from`, `phone`) VALUES
	(1, 'kontakt', 'piotr_broda@poczta.onet.pl', 'Napromed - Naprotechnologia', '+48 501 040 908');
/*!40000 ALTER TABLE `mail_data` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.mail_data_translation
CREATE TABLE IF NOT EXISTS `mail_data_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `mail_data_translation_id_mail_data_id` FOREIGN KEY (`id`) REFERENCES `mail_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.mail_data_translation: ~1 rows (około)
/*!40000 ALTER TABLE `mail_data_translation` DISABLE KEYS */;
INSERT INTO `mail_data_translation` (`id`, `subject`, `body`, `lang`) VALUES
	(1, 'Podziękowanie za przesłanie formularza', '<table border="0">\r\n<tbody>\r\n<tr style="background-color: #000000;">\r\n<td style="color: #fff;">\r\n<h2 align="center">NAPROMED</h2>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Dziękujemy za zainteresowanie się naszą ofertą oraz wysłaniem formularza kontaktowego.</p>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Wkr&oacute;tce się z z Tobą skontaktujemy.</p>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Zesp&oacute;ł Napromed - Naprotechnologia</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'pl');
/*!40000 ALTER TABLE `mail_data_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.media
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.media: ~5 rows (około)
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` (`id`, `module`, `parent_id`, `main`, `file`, `file_min1`, `file_min2`, `file_min3`, `position`) VALUES
	(104, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 17),
	(105, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 18),
	(106, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 19),
	(107, 'carousel_home', 1, 1, '/useruploads/images/karuzela/slide_1.jpg', '', '', '', 20),
	(108, 'carousel_home', 1, 0, '/useruploads/images/karuzela/slide_2.jpg', '', '', '', 21);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.media_size
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

-- Zrzucanie danych dla tabeli napromed_dev.media_size: ~5 rows (około)
/*!40000 ALTER TABLE `media_size` DISABLE KEYS */;
INSERT INTO `media_size` (`id`, `module_cms_id`, `min1`, `min2`, `min3`) VALUES
	(1, 7, '450x346', '127x101', '98x78'),
	(2, 12, '', '', ''),
	(3, 13, '150x80', '', ''),
	(4, 18, '', '', ''),
	(5, 10, '269x249', '', '');
/*!40000 ALTER TABLE `media_size` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.media_translation
CREATE TABLE IF NOT EXISTS `media_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `alternative` text COLLATE utf8_polish_ci,
  `link` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `media_translation_id_media_id` FOREIGN KEY (`id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.media_translation: ~6 rows (około)
/*!40000 ALTER TABLE `media_translation` DISABLE KEYS */;
INSERT INTO `media_translation` (`id`, `title`, `alternative`, `link`, `lang`) VALUES
	(73, '', '', '', 'pl'),
	(104, '', '', '', 'pl'),
	(105, '', '', '', 'pl'),
	(106, '', '', '', 'pl'),
	(107, 'Naprotechnologia', '<p><span>NaProTechnologia</span> jest dziedziną medycyny prokreacyjnej człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą intergralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego.</p>', '5/naprotechnologia-podstawy-teoretyczne.html', 'pl'),
	(108, 'Skuteczność <br>naprotechnologii', '<p><span>NaProTECHNOLOGY</span> okazuje się 2,67 razy bardziej skuteczna niż in vitro dla endometriozy, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w.</p>', '10/naprotechnologia-skutecznosc-metody.html', 'pl');
/*!40000 ALTER TABLE `media_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.meta_tag
CREATE TABLE IF NOT EXISTS `meta_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.meta_tag: ~0 rows (około)
/*!40000 ALTER TABLE `meta_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_tag` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.meta_tag_translation
CREATE TABLE IF NOT EXISTS `meta_tag_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `key_words` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `meta_tag_translation_id_meta_tag_id` FOREIGN KEY (`id`) REFERENCES `meta_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.meta_tag_translation: ~0 rows (około)
/*!40000 ALTER TABLE `meta_tag_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_tag_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.module_cms
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.module_cms: ~21 rows (około)
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
	(10, 'Artykuły', 'article', 1, 1, NULL),
	(11, 'Kategorie artykułów', 'article_category', 1, 1, NULL),
	(12, 'Karuzela Home', 'carousel_home', 6, 0, 12),
	(13, 'Galerie', 'gallery_1', 6, 1, NULL),
	(14, 'Ustawienia wiadomości', 'mail_data', 7, 0, 13),
	(15, 'Formularz kontaktowy', 'contact_form_1', 7, 1, NULL),
	(16, 'Kontakt - Obiekty komercyjne', 'contact_form_2', 7, 1, NULL),
	(17, 'Kontakt - Kontakt', 'contact_form_3', 7, 1, NULL),
	(18, 'Biura', 'product_card', 1, 1, NULL),
	(19, 'FAQ', 'faq', 1, 0, 14),
	(20, 'Słownik', 'dictionary', 1, 0, 15),
	(21, 'Do pobrania', 'download', 1, 0, 16);
/*!40000 ALTER TABLE `module_cms` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.module_group
CREATE TABLE IF NOT EXISTS `module_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_group_position_sortable_idx` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.module_group: ~7 rows (około)
/*!40000 ALTER TABLE `module_group` DISABLE KEYS */;
INSERT INTO `module_group` (`id`, `name`, `hidden`, `position`) VALUES
	(1, 'Strony', 0, 1),
	(2, 'Ustawienia', 0, 2),
	(3, 'Oferta', 1, NULL),
	(4, 'Użytkownicy', 0, NULL),
	(5, 'Strefa wiedzy', 1, NULL),
	(6, 'Media', 0, 6),
	(7, 'Wiadomości', 0, 7);
/*!40000 ALTER TABLE `module_group` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.module_group_permission
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

-- Zrzucanie danych dla tabeli napromed_dev.module_group_permission: ~12 rows (około)
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


-- Zrzut struktury tabela napromed_dev.module_permission
CREATE TABLE IF NOT EXISTS `module_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_id_idx` (`permission_id`),
  KEY `module_id_idx` (`module_id`),
  CONSTRAINT `module_permission_module_id_module_cms_id` FOREIGN KEY (`module_id`) REFERENCES `module_cms` (`id`),
  CONSTRAINT `module_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.module_permission: ~36 rows (około)
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
	(31, 11, 2),
	(32, 19, 1),
	(33, 19, 2),
	(34, 20, 1),
	(35, 20, 2),
	(36, 21, 1),
	(37, 21, 2);
/*!40000 ALTER TABLE `module_permission` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_from` date NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.news: ~0 rows (około)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.newsletter_address
CREATE TABLE IF NOT EXISTS `newsletter_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` text COLLATE utf8_polish_ci NOT NULL,
  `hash` varchar(40) COLLATE utf8_polish_ci DEFAULT NULL,
  `confirm` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.newsletter_address: ~0 rows (około)
/*!40000 ALTER TABLE `newsletter_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_address` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.news_translation
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

-- Zrzucanie danych dla tabeli napromed_dev.news_translation: ~0 rows (około)
/*!40000 ALTER TABLE `news_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.page
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.page: ~21 rows (około)
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`id`, `layout`, `route_name`, `route_hash`, `parent_id`, `hidden`, `not_in_menu`, `absolute_link`, `position`) VALUES
	(1, 'layoutHP', 'root', 'homepage', NULL, 0, 0, NULL, 1),
	(2, 'layoutHP', 'homepage', 'home', 1, 0, 1, '', 1),
	(3, 'layout', 'staticPage', 'about', 1, 0, 0, '', 2),
	(4, 'layout', 'napotechnologia', 'napotech', 1, 0, 0, '', 3),
	(5, 'layout', 'staticPage', 'naprotech_base', 4, 0, 0, '', 5),
	(7, 'layout', 'staticPage', 'naprotech_cure', 4, 0, 0, '', 6),
	(10, 'layout', 'staticPage', 'naprotech_efficacy', 4, 0, 0, '', 7),
	(13, 'layout', 'staticPage', 'naprotech_couple', 4, 0, 0, '', 8),
	(14, 'layout', 'staticPage', 'naprotech_doctor', 4, 0, 0, '', 9),
	(15, 'layout', 'nieplodnosc', 'infertility', 1, 0, 0, '', 10),
	(16, 'layout', 'staticPage', 'infertility_men', 15, 0, 0, '', 12),
	(17, 'layout', 'staticPage', 'infertility_women', 15, 0, 0, '', 13),
	(18, 'layout', 'conversions_hormons', 'conversions', 1, 0, 0, '', 13),
	(19, 'layout', 'conversions_hormons', 'conversions_hormons', 18, 0, 0, '', 19),
	(20, 'layout', 'conversions_hormons_complex', 'conversions_hormons_complex', 18, 0, 0, '', 20),
	(21, 'layout', 'conversions_antropometria', 'conversions_antropometria', 18, 0, 0, '', 21),
	(22, 'layoutFAQ', 'faq', 'faq', 1, 0, 0, '', 22),
	(23, 'layout', 'contact', 'contact', 1, 0, 0, '', 23),
	(24, 'layout', 'staticPage', 'infertility_general', 15, 0, 0, '', 11),
	(27, 'layoutFAQ', 'dictionary', 'dictionary', 4, 0, 0, '', 10),
	(28, 'layout', 'download', 'download', 4, 0, 0, '', 11);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.page_translation
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

-- Zrzucanie danych dla tabeli napromed_dev.page_translation: ~21 rows (około)
/*!40000 ALTER TABLE `page_translation` DISABLE KEYS */;
INSERT INTO `page_translation` (`id`, `title`, `subtitle`, `meta_title`, `meta_keywords`, `meta_description`, `template`, `lang`, `slug`) VALUES
	(1, 'Home', '', 'Naprotechnologia', '', '', 'home', 'pl', 'napro'),
	(2, 'Home', '', 'Naprotechnologia - Home - Napromed', '', '', 'home', 'pl', 'home'),
	(3, 'O mnie', '', 'Naprotechnologia - O mnie - Napromed', '', '', 'about', 'pl', 'o-mnie'),
	(4, 'Naprotechnologia', '', 'Naprotechnologia - Naprotechnologia - Napromed', 'naprotechnologia, leczenie niepłodności', 'NaProTechnologia jest dziedziną medycyny prokreacyjnej człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą intergralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego.', 'index', 'pl', 'naprotechnologia'),
	(5, 'Podstawy teoretyczne', '', 'Naprotechnologia - Podstawy teoretyczne - Naprotechnologia', '', 'NaProTechnologia jest dziedziną medycyny prokreacyjnej, którą opracował Thomas W. Hilgers z USA (natural procreative technology) człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą integralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego.', 'staticPage', 'pl', 'naprotechnologia-podstawy-teoretyczne'),
	(7, 'Wykorzystanie w leczeniu', '', 'Naprotechnologia - Wykorzystanie w leczeniu - Napromed', '', '', 'staticPage', 'pl', 'naprotechnologia-wykorzystanie-w-leczeniu'),
	(10, 'Skuteczność metody', '', 'Naprotechnologia - Skuteczność metody - Napromed', '', '', 'staticPage', 'pl', 'naprotechnologia-skutecznosc-metody'),
	(13, 'Schemat postępowania z niepłodną parą', '', 'Naprotechnologia - Schemat postępowania z niepłodną parą - Napromed', '', '', 'staticPage', 'pl', 'naprotechnologia-schemat-postepowania-z-nieplodna-para'),
	(14, 'Lekarze o naprotechnologi', '', 'Naprotechnologia - Lekarze o naprotechnologi - Napromed', '', '', 'staticPage', 'pl', 'naprotechnologia-lekarze-o-naprotechnologi'),
	(15, 'Niepłodność', '', 'Naprotechnologia - Niepłodność - Napromed', '', '', 'index', 'pl', 'nieplodnosc'),
	(16, 'Męska', '', 'Naprotechnologia  - Niepłodność męska - Napromed', '', '', 'staticPage', 'pl', 'nieplodnosc-meska'),
	(17, 'Żeńska', '', 'Naprotechnologia - Niepłodność żeńska - Napromed', '', '', 'staticPage', 'pl', 'nieplodnosc-zenska'),
	(18, 'Przeliczniki', '', 'Naprotechnologia - Przeliczniki - Napromed', '', '', 'index', 'pl', 'naprotechnologia-przeliczniki'),
	(19, 'Hormony', '', 'Naprotechnologia - Przeliczniki hormony - Napromed', '', '', 'hormon', 'pl', 'naprotechnologia-przeliczniki-hormony'),
	(20, 'Indeksy hormonalne', '', 'Naprotechnologia - Przeliczniki indeksy hormonalne - Napromed', '', '', 'hormonComplex', 'pl', 'naprotechnologia-przeliczniki-indeksy-hormonalne'),
	(21, 'Antropometria', '', 'Naprotechnologia - Przeliczniki antropometria - Napromed', '', '', 'antropometria', 'pl', 'naprotechnologia-przeliczniki-antropometria'),
	(22, 'FAQ', '', 'Naprotechnologia - FAQ - Napromed', 'Naprotechnologia - FAQ - Napromed', 'Naprotechnologia - FAQ - Napromed', 'index', 'pl', 'naprotechnologia-faq'),
	(23, 'Kontakt', '', 'Naprotechnologia - Kontakt - Napromed', '', '', 'index', 'pl', 'naprotechnologia-kontakt'),
	(24, 'Niepłodność', 'Niepłodność', 'Naprotechnologia - Niepłodność - Napromed', 'niepłodność', 'niepłodność', 'staticPage', 'pl', 'nieplodnosc-1'),
	(27, 'Słownik', '', 'Naprotechnologia - Słownik - Napromed', 'Słownik', 'Słownik', 'index', 'pl', 'slownik'),
	(28, 'Do pobrania', '', 'Naprotechnologia - Do pobrania - Napromed', 'download, downloads, do pobrania, materiały prasowe', 'Naprotechnologia - Do pobrania - Napromed', 'index', 'pl', 'do-pobrania');
/*!40000 ALTER TABLE `page_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.product
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

-- Zrzucanie danych dla tabeli napromed_dev.product: ~0 rows (około)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.product_card
CREATE TABLE IF NOT EXISTS `product_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_card_position_sortable_idx` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.product_card: ~0 rows (około)
/*!40000 ALTER TABLE `product_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_card` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.product_card_translation
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

-- Zrzucanie danych dla tabeli napromed_dev.product_card_translation: ~0 rows (około)
/*!40000 ALTER TABLE `product_card_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_card_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.product_categories
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

-- Zrzucanie danych dla tabeli napromed_dev.product_categories: ~0 rows (około)
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.product_categories_translation
CREATE TABLE IF NOT EXISTS `product_categories_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `product_categories_translation_sluggable_idx` (`slug`,`lang`,`name`),
  CONSTRAINT `product_categories_translation_id_product_categories_id` FOREIGN KEY (`id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.product_categories_translation: ~0 rows (około)
/*!40000 ALTER TABLE `product_categories_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.product_translation
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

-- Zrzucanie danych dla tabeli napromed_dev.product_translation: ~0 rows (około)
/*!40000 ALTER TABLE `product_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_translation` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.sf_guard_forgot_password
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

-- Zrzucanie danych dla tabeli napromed_dev.sf_guard_forgot_password: ~0 rows (około)
/*!40000 ALTER TABLE `sf_guard_forgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `sf_guard_forgot_password` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.sf_guard_group
CREATE TABLE IF NOT EXISTS `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.sf_guard_group: ~3 rows (około)
/*!40000 ALTER TABLE `sf_guard_group` DISABLE KEYS */;
INSERT INTO `sf_guard_group` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator group', '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
	(2, 'user', 'User group', '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
	(3, 'author', 'Grupa autorów publikacji', '2013-02-27 12:57:50', '2013-02-27 12:57:50');
/*!40000 ALTER TABLE `sf_guard_group` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.sf_guard_group_permission
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

-- Zrzucanie danych dla tabeli napromed_dev.sf_guard_group_permission: ~3 rows (około)
/*!40000 ALTER TABLE `sf_guard_group_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_group_permission` (`group_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
	(2, 2, '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
	(3, 3, '2013-02-27 12:57:50', '2013-02-27 12:57:50');
/*!40000 ALTER TABLE `sf_guard_group_permission` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.sf_guard_permission
CREATE TABLE IF NOT EXISTS `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.sf_guard_permission: ~3 rows (około)
/*!40000 ALTER TABLE `sf_guard_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator permission', '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
	(2, 'user', 'User permission', '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
	(3, 'author', 'Uprawnienia autora publikacji', '2013-02-27 12:53:25', '2013-02-27 12:57:19');
/*!40000 ALTER TABLE `sf_guard_permission` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.sf_guard_remember_key
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

-- Zrzucanie danych dla tabeli napromed_dev.sf_guard_remember_key: ~1 rows (około)
/*!40000 ALTER TABLE `sf_guard_remember_key` DISABLE KEYS */;
INSERT INTO `sf_guard_remember_key` (`id`, `user_id`, `remember_key`, `ip_address`, `created_at`, `updated_at`) VALUES
	(2, 1, 'jf85rz7e0eo8848ogcgw0w8o0wkg8g4', '127.0.0.1', '2014-02-11 22:31:24', '2014-02-11 22:31:24');
/*!40000 ALTER TABLE `sf_guard_remember_key` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.sf_guard_user
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

-- Zrzucanie danych dla tabeli napromed_dev.sf_guard_user: ~4 rows (około)
/*!40000 ALTER TABLE `sf_guard_user` DISABLE KEYS */;
INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`) VALUES
	(1, 'Tomasz', 'Rogalski', 'rogalski.tomaszek@gmail.com', 'admin', 'sha1', '1d494bdbba5a19a90d24ff50abb520ce', '9adad637317cc4ba87601de12b209d121be58a70', 1, 1, '2014-11-27 20:56:11', '2012-11-14 20:33:26', '2014-11-27 20:56:11'),
	(3, 'Joanna', 'Rogalska', 'rogalska.joasia@gmail.com', 'asia', 'sha1', '4963b9ec301b197d994a5acbd350a844', '93ebd8811fb1b117fd228d42d497a98554e80e5a', 1, 0, '2013-05-06 12:38:36', '2013-02-27 13:34:12', '2013-05-06 12:38:36'),
	(4, 'Jolanta', 'Dec', 'jolantadecnieruchomosci@gmail.com', 'jola', 'sha1', 'f5d5bf0f8f982cd66a0d7e30e06b0baa', '9d5bba0d287f26d0b4f5b50e2a38d373c83e905f', 1, 0, '2014-04-25 19:59:55', '2014-02-11 23:06:57', '2014-04-25 19:59:55'),
	(5, 'Artur', 'Dec', 'arturdec@gmail.com', 'artur', 'sha1', 'ff6f8430b8fcb5d46f45d7be58da368d', '847ce2bd1550a8d964ad49ec08321d9f042c9e16', 1, 0, NULL, '2014-02-11 23:09:16', '2014-02-11 23:09:16');
/*!40000 ALTER TABLE `sf_guard_user` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.sf_guard_user_group
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

-- Zrzucanie danych dla tabeli napromed_dev.sf_guard_user_group: ~4 rows (około)
/*!40000 ALTER TABLE `sf_guard_user_group` DISABLE KEYS */;
INSERT INTO `sf_guard_user_group` (`user_id`, `group_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
	(3, 3, '2013-02-27 13:34:12', '2013-02-27 13:34:12'),
	(4, 2, '2014-02-11 23:06:57', '2014-02-11 23:06:57'),
	(5, 2, '2014-02-11 23:09:16', '2014-02-11 23:09:16');
/*!40000 ALTER TABLE `sf_guard_user_group` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.sf_guard_user_permission
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

-- Zrzucanie danych dla tabeli napromed_dev.sf_guard_user_permission: ~3 rows (około)
/*!40000 ALTER TABLE `sf_guard_user_permission` DISABLE KEYS */;
INSERT INTO `sf_guard_user_permission` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(3, 3, '2013-02-27 13:34:12', '2013-02-27 13:34:12'),
	(4, 2, '2014-02-11 23:06:57', '2014-02-11 23:06:57'),
	(5, 2, '2014-02-11 23:09:16', '2014-02-11 23:09:16');
/*!40000 ALTER TABLE `sf_guard_user_permission` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.text
CREATE TABLE IF NOT EXISTS `text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.text: ~41 rows (około)
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` (`id`, `module`, `parent_id`, `hidden`) VALUES
	(33, 'page', 2, 0),
	(41, 'page', 3, 0),
	(53, 'page', 11, 0),
	(54, 'page', 8, 0),
	(55, 'page', 8, 0),
	(56, 'page', 8, 0),
	(57, 'page', 8, 0),
	(58, 'page', 8, 0),
	(62, 'page', 5, 0),
	(63, 'page', 5, 0),
	(64, 'page', 5, 0),
	(65, 'page', 7, 0),
	(66, 'page', 7, 0),
	(67, 'page', 7, 0),
	(68, 'page', 10, 0),
	(69, 'page', 10, 0),
	(70, 'page', 10, 0),
	(71, 'page', 13, 0),
	(72, 'page', 13, 0),
	(73, 'page', 13, 0),
	(74, 'page', 14, 0),
	(75, 'page', 14, 0),
	(76, 'page', 14, 0),
	(77, 'page', 24, 0),
	(78, 'page', 24, 0),
	(79, 'page', 24, 0),
	(80, 'page', 16, 0),
	(81, 'page', 16, 0),
	(82, 'page', 17, 0),
	(83, 'page', 17, 0),
	(84, 'page', 17, 0),
	(85, 'page', 22, 0),
	(86, 'page', 3, 0),
	(88, 'page', 27, 0),
	(89, 'page', 23, 0),
	(90, 'page', 23, 0),
	(91, 'page', 23, 0),
	(92, 'page', 19, 0),
	(93, 'page', 20, 0),
	(94, 'page', 21, 0),
	(95, 'page', 28, 0);
/*!40000 ALTER TABLE `text` ENABLE KEYS */;


-- Zrzut struktury tabela napromed_dev.text_translation
CREATE TABLE IF NOT EXISTS `text_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `context` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `text_translation_id_text_id` FOREIGN KEY (`id`) REFERENCES `text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli napromed_dev.text_translation: ~38 rows (około)
/*!40000 ALTER TABLE `text_translation` DISABLE KEYS */;
INSERT INTO `text_translation` (`id`, `title`, `context`, `lang`) VALUES
	(33, 'Home', '<p>Home</p>', 'pl'),
	(41, 'O mnie', '<h2>Lek. Piotr Broda</h2>\r\n<p>Urodzony i wychowany w Poznaniu, studia medyczne ukończył z drugą lokatą w Wojskowej Akademii Medycznej w Łodzi w 1999 r.</p>', 'pl'),
	(53, 'STREFA WIEDZY', '<p>Artykuły i porady</p>', 'pl'),
	(54, 'Kontakt', '<p>Zapraszamy do kontaktu</p>', 'pl'),
	(55, 'Jolmar Nieruchomości Sp. z o.o.', '<p>Wybierz jedną z najwygodnieszych form kontaktu dla Ciebie. Postaramy się jak najszybciej odpowiedzieć.</p>', 'pl'),
	(56, 'Adres', '<p>Kamionki, ul. Waniliowa 44, 62-023 Gądki<br /> <span> NIP: 777-322-76-95, REGON: 302215422<br /> KRS: 0000432803, Nr licencji zawodowej: 17070 </span></p>', 'pl'),
	(57, 'Telefon', '<p>+48 604 13 47 16</p>', 'pl'),
	(58, 'Email', '<p><a title="Napisz do nas" href="mailto:jolantadecnieruchomosci@gmail.com">jolantadecnieruchomosci@gmail.com</a></p>', 'pl'),
	(62, 'Podstawy teoretyczne', '<p><a href="/naprotechnologia-slownik.html#napro-technology-napro-technologia-naprotechnologia-napro-napro"><strong>NaProTechnologia</strong></a> jest dziedziną medycyny prokreacyjnej, kt&oacute;rą opracował Thomas W. Hilgers z USA (natural procreative technology) człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą integralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego. Z uwagi na stosowane podejście filozoficzne, umocowania kulturowe, zasady postępowania, podejście badawcze i implikacje społeczne stanowiące o zaistnieniu paradygmatu naukowego można nazywać ją nauką, stąd rozwinięcie &ndash; logia (greckie <em>logos</em> &ndash; <em>słowo</em>).</p>', 'pl'),
	(63, 'Druga sekcja', '<p>Pojęcie NaPro Technology zostało utworzone jako opozycja do Artificial Reproductive Technology (ART), kt&oacute;re tłumaczy się jako technologia sztucznej reprodukcji. Widoczne tutaj podejście T.W. Hilgersa w odr&oacute;żnieniu angielskich sł&oacute;w Reproductive i Procreative ma znaczenie ontologiczne i uwydatnia rolę człowieka w tw&oacute;rczej wsp&oacute;łpracy z Bogiem i nie degraduje jego roli do reproduktora. Z kolei zamiana sł&oacute;w Artificial na Natural określa drogę i kierunek działań lekarza uwzględniającego w swym postępowaniu godność osobistą każdego człowieka (tutaj jako pacjenta).</p>', 'pl'),
	(64, 'Trzecia sekcja', '<p class="Standard">Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną <a href="/naprotechnologia-slownik.html#model-creighton">The Creighton Model Fertility Care System (CrMS)</a>, stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>\r\n<p>Punktem wyjścia do opracowania modelu Creighton była metoda owulacyjna Billings&oacute;w, kt&oacute;ra polegała na&nbsp; obserwacjach wydzieliny śluzowej szyjki macicy oraz odczuć w&nbsp;okolicach przedsionka pochwy. Zesp&oacute;ł badaczy z Omaha pod kierownictwem T. Hilgersa przeprowadził standaryzację co do jakości jak i ilości cech płodnych śluzu oraz obserwacji i odczuć kobiety. Wieloletnie obserwacje wybranych parametr&oacute;w cyklu płciowego umożliwiły wyr&oacute;żnienie kobiet z typowymi problemami zdrowotnymi układu rozrodczego o określonych cechach zapis&oacute;w. Stało się to przyczynkiem do wyr&oacute;żnienia tzw. <a href="/naprotechnologia-slownik.html#biomarker-napro-track">biomarker&oacute;w</a> cyklu (typu i&nbsp;ilości obserwowanego śluzu, dynamiki jego zmian, długości i&nbsp;przebiegu fazy przedowulacyjnej, długości i&nbsp;stabilności fazy poowulacyjnej, długości cykli, występowania plamienia przedmenstruacyjnego, przedłużania się brązowego plamienia po miesiączce&nbsp;itp.).</p>\r\n<p class="Standard">Przez poznanie <a href="/naprotechnologia-slownik.html#biomarker-napro-track">biomarker&oacute;w płodności (NaPro TRACK)</a> łatwiejszym staje się diagnostyka jak r&oacute;wnież terapia:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li><a href="/naprotechnologia-slownik.html#endometrioza">endometriozy</a></li>\r\n<li>zespołu policystycznych jajnik&oacute;w (<a href="/naprotechnologia-slownik.html#pco">PCOS</a>)</li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n</ul>\r\n<p class="Standard">Lekarz <a href="/naprotechnologia-slownik.html#lekarz-konsultant-napro">Konsultant </a>prowadzi r&oacute;wnież diagnostykę i leczenie czynnika męskiego niepłodności.</p>\r\n<p>CrMS jest naukowo przebadany, precyzyjny i skuteczny, wsp&oacute;łpracuje z płodnością, szanuje godność kobiety i integralność małżeństwa oraz jest całkowicie pozbawiony efekt&oacute;w ubocznych dla każdego z małżonk&oacute;w.</p>\r\n<p>Leczenie NaPro polega na kompleksowym wykorzystaniu najnowocześniejszych osiągnięć medycyny oraz chirurgii we wsp&oacute;łpracy z naturalnym cyklem menstruacyjnym kobiety, tak aby osiągnąć optymalną funkcjonalność bez tłumienia bądź niszczenia płodności. To także propozycja leczenia dla <a href="/naprotechnologia-slownik.html#nieplodnosc-meska-czynnik-meski">mężczyzn</a>.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>W dostępnej literaturze skumulowane wskaźniki ciąż po leczeniu NaProTECHNOLOGY z powodu niepłodności uzyskano w</p>\r\n<p>do 12 miesięcy - uzyskano 44% ciąż,<br />do 24 miesięcy uzyskano 62% ciąż,<br />w 48 miesięcy od rozpoczęcia leczenia 71%.</p>\r\n<p>Naprotechnologia bazuje na perfekcyjnym poznaniu fizjologii cyklu płciowego kobiety i ocenia występujące zaburzenia korzystając z <a href="/naprotechnologia-slownik.html#biomarker-napro-track">biomarker&oacute;w </a>określanych jako <a href="/naprotechnologia-slownik.html#biomarker-napro-track">NaProTRACK</a>. Takie podejście umożliwia eliminację czynnika sprawczego powodującego obniżenie płodności (zwane także jako <a href="/naprotechnologia-slownik.html#nieplodnosc">niepłodność</a>)</p>', 'pl'),
	(65, 'Wykorzystanie w leczeniu', '<p>NaProTechnologia jest dziedziną medycyny prokreacyjnej człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą intergralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego.</p>', 'pl'),
	(66, 'Druga sekcja', '<p>Naprotechnologia jest użyteczna w leczeniu:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li><a href="/naprotechnologia-slownik.html#endometrioza">endometriozy</a></li>\r\n<li><a href="/naprotechnologia-slownik.html#pco">zespołu policystycznych jajnik&oacute;w (PCOS)</a></li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n</ul>\r\n<p>Lekarz Konsultant prowadzi r&oacute;wnież diagnostykę i leczenie <a href="/naprotechnologia-slownik.html#nieplodnosc-meska-czynnik-meski">czynnika męskiego</a> niepłodności.</p>', 'pl'),
	(67, 'Trzecia sekcja', '<p>Leczenie NaPro jest wielokierunkowe i wielopłaszczyznowe zorientowane na optymalizację potencjału rozrodczego pary małżeńskiej (zar&oacute;wno kobiety jak i mężczyzny). <a href="/naprotechnologia-slownik.html#lekarz-konsultant-napro">Konsultant </a>stara się wdrożyć leczenie każdego istotnego schorzenia wykorzystując wszystkie dostępne środki medyczne uwzględniając stan kliniczny Pacjenta takie jak: suplementację niedobor&oacute;w mikroelement&oacute;w i witamin, farmakoterapię, leczenie hormonalne, poradnictwo dietetyczne jak r&oacute;wnież leczenie zabiegowe zar&oacute;wno w technikach chirurgii otwartej (klasycznej) jak i technikami endoskopowymi (hysteroskopia, laparoskopia). Każda decyzja terapeutyczna jest poprzedzona wnikliwą diagnostyką: badaniem podmiotowym i przedmiotowym, kt&oacute;re są weryfikowane zapisami na karcie obserwacji cyklu w <a href="/naprotechnologia-slownik.html#model-creighton">modelu Creighton</a>, diagnostyką obrazową (HSG, USG), badaniami laboratoryjnymi, testami dynamicznymi i konsultacjami specjalistycznymi poza ośrodkiem. Leczenie jest zindywidualizowane i przebiega etapami usuwającymi kolejne wykryte schorzenia aż do stanu odzyskania pełnego potencjału płodności możliwego do uzyskania dla danej Pary. O kolejności diagnostyki decyduje lekarz <a href="/naprotechnologia-slownik.html#lekarz-konsultant-napro">konsultant NaPro</a> uwzględniając sytuację każdej Pary. Poczęcie dziecka w ramach NaPro występuje w trakcie pożycia małżeńskiego. Trzeba podkreślić, że lekarz konsultant nie zaproponuje Parze metody, kt&oacute;ra jest niegodziwa etycznie czy wręcz szkodliwa dla zdrowia, choćby opracowania Towarzystw Naukowych zalecały takie postępowanie w danym przypadku. Dotyczy to w szczeg&oacute;lności:</p>\r\n<ul>\r\n<li>antykoncepcji</li>\r\n<li>aborcji</li>\r\n<li>prenatalnej diagnostyki eugenicznej</li>\r\n<li>zapłodnienia pozaustrojowego</li>\r\n<li>mikromanipulacji na gametach (ICSI, korekta chor&oacute;b mitochondrialnych z tworzeniem hybrydowego oocytu)</li>\r\n<li>transferu oocytu własnego &ndash; zamrożonego (FET)</li>\r\n<li>rodzicielstwa zastępczego</li>\r\n<li>donacji gamet</li>\r\n<li>inseminacji domacicznych</li>\r\n<li>leczenia genetycznego w stadium przedimplantacyjnym</li>\r\n<li>krioprezerwacji zarodk&oacute;w bioptat&oacute;w gonad czy gamet zar&oacute;wno podczas procedur ART jak i przed leczeniem niszczącym płodność (chemio - i radioterapia) zwanym oncofertility.</li>\r\n</ul>', 'pl'),
	(68, 'Skuteczność metody', '<p>Wyniki leczenia niepłodności metodą NaProTECHNOLOGY opublikowane zostały w 2004 roku przez prof. Thomasa Hilgersa w The Medical and Surgical Practice of NaProTECHNOLOGY oraz w 2008 roku w publikacji Josepha B. Stanforda, MD,MSPH, Tracey A.Parnella, MD and Phila C. Boyle, MB w czasopiśmie medycznym "Journal of the American Board of Family Medicine: Outcomes From Treatment of Infertility With Natural Procreative Technology in an Irish General Practice".</p>', 'pl'),
	(69, 'Druga sekcja', '<p>Najpierw skumulowane wyniki, wskaźnik ciąż po leczeniu <b>NaProTECHNOLOGY</b> z powodu niepłodności, w przedziałach czasowych:</p>\r\n<ul>\r\n<li>do 12 miesięcy - uzyskano 44% ciąż,</li>\r\n<li>do 24 miesięcy uzyskano 62% ciąż,</li>\r\n<li>w 48 miesięcy od rozpoczęcia leczenia 71%.</li>\r\n</ul>\r\n<p>Wyniki leczenia kiedy rozpoznaną przyczyną niepłodności była endometrioza:</p>\r\n<ul>\r\n<li>45% do 12 miesięcy,</li>\r\n<li>65% do 24 miesięcy,</li>\r\n<li>78% do 36 miesięcy.</li>\r\n</ul>\r\n<p>Skumulowany wskaźnik ciąż dla pacjentek z zespołem policystycznych jajnik&oacute;w:</p>\r\n<ul>\r\n<li>40% po 12 miesiącach</li>\r\n<li>65% po 24 miesiącach</li>\r\n<li>do 90% po 48 miesiącach</li>\r\n</ul>', 'pl'),
	(70, 'Trzecia sekcja', '<p>Wreszcie skuteczność leczenia metodą <b>NaProTECHNOLOGY</b> w por&oacute;wnaniu do postępowania in vitro. Kiedy przyczyną niepłodności był brak owulacji to uzyskano 81,8% poczęć, jeżeli policystyczne jajniki to 62,5% przy endometriozie 56,7%, przy niedrożności jajowod&oacute;w 38,4%. Dla in vitro analogicznie wyniki z lat 1986 &ndash; 2001 od 21 do 27% ciąż na kobietę.</p>\r\n<p><b>NaProTECHNOLOGY</b> okazuje się 2,67 razy bardziej skuteczna niż in vitro dla endometriozy, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w. W badaniu z Irlandii, w latach 1998-2002 zgłosiło się 1239 par małżeńskich z powodu niepłodności. Średni wiek kobiet to 35,8 lat, średnia długość trwania niepłodności 5,6 roku. 33% par wcześniej było leczonych ART. Wskaźnik ciąż <b>NaProTECHNOLOGY</b> wyni&oacute;sł 52%. Udało się pom&oacute;c około 30% par po niepowodzeniach ART, czyli technik wspomaganego rozrodu &bdquo;in vitro&rdquo;.( J Am Board Fam Med 2008;21:375&ndash;384.)</p>\r\n<p>Szczeg&oacute;łowe badania nad skutecznością metody w przypadkach problem&oacute;w z płodnością dostępne są na stronie: <a href="http://naprotechnology.com/infertility.htm" target="_blank">http://naprotechnology.com/infertility.htm</a></p>', 'pl'),
	(71, 'Schemat postępowania z niepłodną parą', '<p>Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną Creighton Model Fertility Care System (CrMS), stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>', 'pl'),
	(72, 'Druga sekcja', '<p><strong>Plan lecczenia</strong></p>\r\n<ul>\r\n<li>Etap I Zidentyfikowanie problemu (2-5 m-cy)</li>\r\n<li>Etap II Naprawienie problemu (1-6 m-cy)</li>\r\n<li>Etap III Utrzymanie &bdquo; dobrych cykli" (1-18 m-cy)</li>\r\n</ul>\r\n<p><strong><u>Pamiętaj!</u></strong></p>\r\n<ul>\r\n<li>Kontrola poziomu hormon&oacute;w każdego miesiąca w dniu <strong>Peak +7</strong> (jeśli nie można określić dnia Peak, to w 21 dniu cyklu).</li>\r\n<li>Przynoś swoja kartę obserwacji na każdą wizytę.</li>\r\n</ul>\r\n<p><strong><u>Dobre Cykle</u></strong></p>\r\n<ul>\r\n<li>Program leczenia trwa około 12 efektywnych cykli leczenia.</li>\r\n<li>Przynoś wszystkie karty obserwacji i kompletną dokumentacje na każdą wizytę.</li>\r\n</ul>\r\n<p><strong><u>O efektywnych cyklach m&oacute;wimy gdy stwierdzamy:</u></strong></p>\r\n<p><strong>A.</strong></p>\r\n<ol>\r\n<li>Poziom hormon&oacute;w w dniu Peak+7 (lub P+6,+8,+9) jest optymalny czyli\r\n<ul>\r\n<li>Progesteron 19-32 ng/ml (60-100 nmol/l)</li>\r\n<li>Estradiol 109-218 pg/ml (400-800 pmol/1)</li>\r\n</ul>\r\n</li>\r\n<li>Zadowalający obraz śluzu szyjkowego</li>\r\n<li>Prawidłowy przebieg krwawienia miesięcznego</li>\r\n<li>Dobrą kontrolę zespołu napięcia przed miesiączkowego</li>\r\n<li>Normalny poziom &bdquo;energii"</li>\r\n<li>Prawidłowe badanie nasienia</li>\r\n</ol>\r\n<p><strong>B.</strong></p>\r\n<ol>\r\n<li>Ultrasonograficznie potwierdzenie pękania pęcherzyka Graafa (ocena owulacji)</li>\r\n<li>Potwierdzenie prawidłowej budowy anatomicznej (laparoskopia i/lub histeroskopia)</li>\r\n</ol>\r\n<p><strong>C.</strong></p>\r\n<ol>\r\n<li>Podczas okresu płodnego częste, niewymuszone wsp&oacute;łżycie małżeńskie&nbsp; (optymalnie od początku śluzu typu P do dnia P+2)</li>\r\n<li>Świadomość podlegania stresowi i umiejętność radzenia sobie z nim. (ekstremalna dieta lub wysiłek fizyczny, zaburzenia snu, b&oacute;l, choroba, praca, egzaminy, wakacje, żałoba, problemy emocjonalne)</li>\r\n</ol>', 'pl'),
	(73, 'Trzecia sekcja', '<p><strong><u>Postępowanie w ciąży - dzień P + 17</u></strong></p>\r\n<p>Jeśli miesiączka nie pojawi się w dniu P+17 zr&oacute;b rano test ciążowy. (jeśli przyjmujesz zastrzyki z HCG to może skutkować fałszywie pozytywnym testem ciążowym przed dniem P+17)</p>\r\n<p>Jeśli test ciążowy jest negatywny to miesiączka pojawi się w ciągu kilku najbliższych dni.</p>\r\n<p>To może się zdarzyć na skutek:</p>\r\n<ol>\r\n<li>Źle zidentyfikowanego dnia Peak</li>\r\n<li>Podw&oacute;jnego dnia Peak.</li>\r\n<li>Poziom hormon&oacute;w w dniu P+7 jest za wysoki lub za niski (na skutek leczenia).</li>\r\n</ol>\r\n<p><br /> <strong><u>JEŚLI test ciążowy jest dodatni wykonaj:</u></strong></p>\r\n<ol>\r\n<li>oznaczenie poziomu HCG, progesteronu i estradiolu we krwi - powtarzane co<br /> tydzień lub co 2 tygodnie (krew do badania powinna być pobrana przed<br /> przyjęciem leku zawierającego progesteron)</li>\r\n<li>Podawanie progesteronu w czasie ciąży może być konieczne, ustal to z<br /> lekarzom w czasie najbliższej konsultacji</li>\r\n<li>skontaktuj się z rejestracją aby ustalić termin badania USG: 3tyg po<br /> pozytywnym teście ciążowym.</li>\r\n</ol>\r\n<p>Jeśli twoja ciąża rozwija się prawidłowo to bicie serca dziecka będzie już wtedy widoczne.</p>\r\n<p>Po poczęciu potrzebna będzie zasadniczo jedna konsultacja w naszej przychodni, następnie dawkowanie progesteronu może być ustalane z lekarzem telefonicznie przez cały okres ciąży. Tw&oacute;j ginekolog może prowadzić ciążę, my będziemy odpowiedzialni za monitorowanie i ustalanie dawki progesteronu.</p>\r\n<p>Podawanie progesteronu zazwyczaj trwa 12-14 tygodni. jeśli poziom progesteronu będzie niski to leczenie może trwać dłużej</p>', 'pl'),
	(74, 'Lekarze o naprotechnologi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'pl'),
	(75, 'Druga sekcja', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl'),
	(76, 'Trzecia sekcja', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>', 'pl'),
	(77, 'Niepłodność', '<p><b>Niepłodność</b> (Sterilitas, infertilitas, infecundity) jest objawem wielu schorzeń i ich wymienienie przekracza ramy tego opracowania. Reasumując; każde ciężkie schorzenie, zwłaszcza przewlekłe obniża płodność. Istotą leczenia niepłodności jest rozpoznanie występujących schorzeń i właściwe ich leczenie by odtworzyć utraconą płodność.</p>', 'pl'),
	(78, 'Druga sekcja', '<h3 align="center"><u>Ze względu na zakres niepłodności</u></h3>\r\n<p><strong>Niepłodność całkowita</strong> (<em>sterilitas absoluta</em>), czyli stan w kt&oacute;rym nie ma fizycznej możliwości do zajścia czy utrzymania ciąży. Obejmuje to u kobiety stany takie jak: brak jajnik&oacute;w, jajowod&oacute;w, macicy czy pochwy, a także poważne wady tych narząd&oacute;w zar&oacute;wno o podłożu wrodzonym czy nabytym. U mężczyzny o niepłodności całkowitej m&oacute;wimy w sytuacji braku jąder (wada wrodzona czy bądź nabyta czyli kastracja)</p>\r\n<p><strong>Niepłodność względna </strong>(<em>sterilitas relativa </em>lub <em>sterilitas temporaria</em>) to stan w kt&oacute;rym istnieje pierwotna przyczyna dająca szansę na wyleczenie.</p>\r\n<h3 align="center"><u>Ze względu na czas wystąpienia</u></h3>\r\n<p><strong>Niepłodność pierwotna</strong> <em>(sterilitas primaria) </em>to niemożność zajścia w ciążę kobiety, lub niemożność zapłodnienia przez mężczyznę, od rozpoczęcia wsp&oacute;łżycia.</p>\r\n<p><strong>Niepłodność wt&oacute;rna</strong> <em>(sterilitas secundaria)</em> to stan w kt&oacute;rym istniała potwierdzona wcześniej płodność, lecz została zahamowana. Może ona mieć podłoże chorobowe (czynnik jajowodowy, przebyte stany zapalne , zaburzenia czynnościowe i inne) lub jatrogenne, tzn. jako skutek działalności lekarskiej (obustronna kastracja, obliteracja jajowod&oacute;w, niepłodność po stosowaniu antykoncepcji i inne)</p>', 'pl'),
	(79, 'Trzecia sekcja', '<h3 align="center"><u>Ze względu na zakończenie diagnostyki</u></h3>\r\n<p><strong>Niepłodność idiopatyczna</strong> to sytuacja w kt&oacute;rej dostępnymi metodami nie jesteśmy w stanie czy to postawić rozpoznania czy zastosować skutecznej terapii. Statystyki podają od 14 do 30% niepłodności w kt&oacute;rych medycyna nie jest w stanie pom&oacute;c żadnymi dostępnymi sposobami. W grupie niepłodności idiopatycznej z powodu braku powszechnych metod analitycznych wyr&oacute;żnia się zaburzenia układu odpornościowego: <strong>alloimmunologiczne </strong>&nbsp;kiedy kobieta wytwarza przeciwciała przeciwko plemnikom partnera, albo jest uczulona na pewne antygeny trofoblastu i reaguje zamknięciem naczyń odżywiających go, co z&nbsp;kolei powoduje obumarcie odżywianego za pomocą trofoblastu zarodka. Występują też zaburzenia <strong>autoimmunologiczne</strong>, kiedy reakcja immunologiczna skierowana jest przeciwko własnym kom&oacute;rkom własnych narząd&oacute;w co może prowadzić np. do wytworzenia przeciwciał przeciwjajnikowych i do przedwczesnej niewydolności&nbsp;jajnik&oacute;w.</p>\r\n<p><strong>Niepłodność małżeńska</strong> w klasycznej definicji&nbsp; to niemożność uzyskania ciąży po rocznym wsp&oacute;łżyciu w celu koncepcyjnym. Obecnie dotyka ona 18-20% małżeństw w Polsce.</p>', 'pl'),
	(80, 'Niepłodność męska', '<p><strong>Niepłodność męska</strong> (męski czynnik niepłodności, <em>male infertility factor</em>, MIF) brak zdolności do produkcji pełnowartościowych plemnik&oacute;w (impotentia coeundi) lub niemożność odbycia stosunku płciowego (impotentia generandi). Przyjmuje się, że męski czynnik występuje u 40 % przypadk&oacute;w niepłodności małżeńskiej.&nbsp; Dodatkowo u 20 % par występuje łącznie czynnik męski i żeński. Należy podkreślić, że tylko całkowity i stały brak plemnik&oacute;w w nasieniu całkowicie przekreśla szanse mężczyzny na bycie ojcem. Do chwili obecnej nie ustalono dolnej granicy koncentracji plemnik&oacute;w w nasieniu, kt&oacute;ra wykluczyłaby mężczyznę z rozrodu. <a href="/naprotechnologia-slownik.html#badanie-andrologiczne">Badanie andrologiczne</a> jest podstawą diagnostyki niepłodności męskiej.</p>', 'pl'),
	(81, 'Druga sekcja', '<p>Na <a href="/naprotechnologia-slownik.html#parametry-nasienia">parametry nasienia</a> wpływa bardzo wiele czynnik&oacute;w; dla potrzeb akademickich wymienić można:</p>\r\n<ul>\r\n<li>Zaburzenia genetyczne stanowiące ok. 15% przyczyn niepłodności męskiej. Najczęściej stwierdza się dodatkowy chromosom X, translokacje chromosomalne, mutację w genie CFTR czy mikrodelecje w chromosomie Y</li>\r\n<li>Wady wrodzone, często niezstąpione jądra, niedrożność przewod&oacute;w wyprowadzających CBAVD</li>\r\n<li>Żylaki powr&oacute;zka nasiennego powodują miejscowe podwyższenie temperatury w&nbsp;miejscu wydostawania się plemnik&oacute;w z&nbsp;jądra, co sprawia, że obniża się ich ruchliwość lub nawet&nbsp;giną.</li>\r\n<li>Każda choroba og&oacute;lnoustrojowa (nawet kr&oacute;tkotrwałe banalne infekcje) mają wpływ na parametry nasienia; zwykle jednak zmiany w spermiogramie obserwujemy z op&oacute;źnieniem 2 &ndash; 3 miesięcznym</li>\r\n<li>Przyczyny infekcyjne męskich narząd&oacute;w płciowych: przebyte w dzieciństwie (świnkowe wirusowe zapalenie jąder &ndash; zniszczenie jąder 25% przypadk&oacute;w) czy nabyte po rozpoczęciu życia seksualnego (zapalenie najądrzy powodowane np. przez chlamydie). Każdy stan zapalny męskich narząd&oacute;w rozrodczych może skutkować uszkodzeniem budowy i/lub funkcji plemnik&oacute;w lub spowodować zniszczenie najądrzy</li>\r\n<li>Urazy jąder, zar&oacute;wno związane z wypadkami jak i po operacjach, np. leczenia przepukliny pachwinowej, skręt jądra</li>\r\n<li>Ciężkie choroby og&oacute;lnoustrojowe: niewydolność wątroby, trzustki, nerek, układu krążenia, cukrzyca, niedokrwistość, nowotwory (zar&oacute;wno sam fakt choroby jak i następstwa leczenia przeciwnowotworowego: radio -&nbsp; i chemioterapia)</li>\r\n<li>Przyjmowane leki</li>\r\n<li>Wsteczna ejakulacja, kt&oacute;rej przyczyną są zaburzenia kurczliwości mięśni cewki moczowej, powodujące przesuwanie plemnik&oacute;w do pęcherza moczowego zamiast ujściem cewki moczowej na zewnątrz. Zaburzenia te mogą mieć charakter przejściowy lub&nbsp;trwały.</li>\r\n<li>Styl życia: nikotynizm, alkoholizm, narkomania</li>\r\n<li>Szkodliwe czynniki środowiskowe i zawodowe (przegrzanie okolic narząd&oacute;w płciowych, środki ochronny roślin, barwniki anilinowe, metale, narażenie na promieniowanie elektromagnetyczne, plastyfikatory używane w tworzywach sztucznych)</li>\r\n</ul>\r\n<p>Pomimo długiej listy nadal w 25 &ndash; 30% przypadk&oacute;w niepłodności męskiej nie udaje się ustalić przyczyny &ndash; rozpoznaje się wtedy niepłodność idiopatyczną.</p>', 'pl'),
	(82, 'Niepłodność żeńska', '<p><b>Niepłodność żeńska</b> może dotyczyć zar&oacute;wno procesu powstawania oocytu, możliwości odbywania stosunku płciowego, drożności dr&oacute;g rodnych, stworzenia warunk&oacute;w do kontaktu plemnik&oacute;w z oocytem, aktywnego transportu zygoty do jamy macicy jak r&oacute;wnież implantacji &ndash; zagnieżdżenia nowego życia w organizmie matki.</p>', 'pl'),
	(83, 'Druga sekcja', '<p>Zdolność do utrzymania nowego życia <i>(fecundity)</i> może być wikłana przez czynniki prowadzące do <b>poronienia</b> <i>(abortus)</i> czy wystąpienia <b>porodu przedwczesnego</b> <i>(partus praematurus, Praterm Labour PTL)</i> skutkującego nawet urodzeniem niezdolnego do przeżycia dziecka. Gdy do zgonu dziecka dochodzi wewnątrzmacicznie m&oacute;wi się o <b>wewnątrzmacicznym obumarciu</b> odpowiednio: zarodka <i>(poronienie zatrzymane, missed abortion)</i> lub płodu <i>(mors foetus intrauterina)</i>.&nbsp; Statystyki m&oacute;wią o 40% udziale czynnika żeńskiego w niepłodności małżeńskiej, dodatkowo u 20% par występuje łącznie żeński i męski czynnik odpowiedzialny za niepłodność.</p>', 'pl'),
	(84, 'Trzecia sekcja', '<p><b>Przyczyny&nbsp;niepłodności&nbsp;kobiet:</b></p>\r\n<ul>\r\n<li>Zmiany anatomiczne dr&oacute;g rodnych (wrodzone i nabyte)</li>\r\n<li>Zaburzenia jajeczkowania (najczęściej zesp&oacute;ł PCO)</li>\r\n<li>Zaburzenia hormonalne (hiperprolaktynemia, zaburzenia fazy lutealnej, choroby tarczycy, nadnerczy)</li>\r\n<li>Zaburzenia immunologiczne (autoi i alloimmunologiczne)</li>\r\n<li>Endometrioza (czynnik anatomiczny, zaburzenia jajeczkowania i czynnik immunologiczny)</li>\r\n</ul>', 'pl'),
	(85, 'FAQ', '<p>FAQ</p>', 'pl'),
	(86, 'Druga sekcja', '<p>W trakcie studi&oacute;w pod inspiracją swoich nauczycieli (p<b>rof. H. H&uuml;bner &ndash; </b>biolog i genetyk, <b>prof. H. Bartel</b> &ndash; embriolog<b>, prof. S. Orkisz</b> &ndash; histolog, wsp&oacute;łodkrywca translacji DNA-RNA nagrodzonej <b>nagrodą Nobla</b>,&nbsp; <b>dr. D. Tosik</b> &ndash; embriolog, histolog, <b>prof. H. Tch&oacute;rzewski</b> &ndash; patofizjolog i immunolog, <b>prof. K. Zeman</b> &ndash; immunolog, <b>prof. Z. Baj</b> &ndash; patofizjolog, <b>prof. K. Zieliński</b> &ndash; patomorfolog, <b>prof. A. Malinowski</b> &ndash; ginekolog, immunolog, <b>dr W. Budźko</b> &ndash; ginekolog, położnik) rozpoczął pracę w Studenckich kołach naukowych. W tym okresie zainteresowania ogniskowały się na indukowanych wadach wrodzonych u myszy (ocena makroskopowa i w mikroskopie świetlnym oraz elektronowym) gł&oacute;wnie rozszczepach podniebienia indukowanych bromodeoksyurydyną, zagadnieniach związanych z generowaniem reaktywnych form tlenu u ludzi, procesami genetycznym prowadzącymi do apoptozy w procesach rozwoju prenatalnego u myszy poddawanych wpływowi teratogen&oacute;w, immunologicznymi przyczynami niepłodności, gł&oacute;wnie obecnością przeciwciał blokujących we krwi kobiet z par niepłodnych, możliwościami terapeutycznymi leczenia niepłodności o podłożu immunologicznym, gł&oacute;wnie szczepieniem limfocytami partnera w reakcji MLR, przyczynami psychologicznymi w niepłodności małżeńskiej (wsp&oacute;łpraca z <b>prof. Bielawską &ndash; Batorowicz</b>), możliwością zastosowaniu <b>OXTDAN-u</b> w terapii ran poporodowych (badania kliniczne III fazy), wpływem nadwagi i otyłości na wybrane parametry ciąży, porodu i połogu i czynnikami środowiskowymi mogącymi prowadzić do uszkodzenia funkcji generatywnej jajnika u myszy &ndash; ocena wybranych parametr&oacute;w morfologicznych&nbsp; jajnik&oacute;w myszy poddawanych działaniu kofeiny; ocena w mikroskopie świetlnym i elektronowym, badania immunoenzymatyczne i metodami genetyki molekularnej. <b>Za swoje prace nagradzany i wyr&oacute;żniany</b> na konferencjach studenckich, zar&oacute;wno og&oacute;lnopolskich jak i międzynarodowych.</p>\r\n<p><b>Specjalizację z położnictwa i ginekologii</b> rozpoczął&nbsp; 2001 r. pod okiem <b>prof. J.R. Wilczyńskiego</b> w Instytucie Centrum Zdrowia Matki Polki w Łodzi. Z powod&oacute;w rodzinnych kontynuował specjalizację w Ginekologiczno &ndash; Położniczym Szpitalu Klinicznym w Poznaniu na ul Polnej 33, r&oacute;wnolegle zdobywając doświadczenie zawodowe w Szpitalu Powiatowym w Wałczu. W trakcie specjalizacji nawiązał wsp&oacute;łpracę naukową z <b>prof. W. Baranowskim</b> z CSK WIM w Warszawie, gdzie r&oacute;wnież szkolił się w technikach endoskopowych w ginekologii i w procedurach diagnostycznych i leczeniu operacyjnym w uroginekologii. Od 2006 r. zainteresowany naturalnymi metodami planowania rodziny, a w 2009 r. zetknął się z <b>naprotechnologią</b> jako alternatywą leczenia niepłodności <b>wobec ART.</b> (techniki rozrodu wspomaganego).&nbsp;&nbsp; W latach 2012 &ndash; 2013 brał udział w kursie dla konsultant&oacute;w medycznych metod naturalnego planowania rodziny i szkoleniu z systemu obserwacji cyklu płciowemu kobiety <b>modelem Creighton</b> (the Creighton Model Fertility Care System, CrMS) oraz szkoleniu z <b>NaPro TECHNOLOGY <sup>&trade;</sup></b>. Prowadził wykłady na temat działania antykoncepcji dla słuchaczy Studium Rodziny przy Wydziale Teologicznym Uniwersytetu im Adama Mickiewicza w Poznaniu i dla student&oacute;w Warszawskiego Uniwersytetu Medycznego w ramach konferencji &bdquo;Ginekologia in vivo&rdquo; a także dla lekarzy podczas IX Gdańskich spotkań z etyką lekarską i spotkaniach ginekolog&oacute;w katolickich i środowisk NaPro. W swoich opracowaniach ogniskował się na wpływie antykoncepcji na parametry zdrowotne i epidemiologiczne. Zainteresowany czynnikiem męskim w niepłodności małżeńskiej.</p>\r\n<p>Członek zwykły <b>Polskiego Towarzystwa Andrologicznego</b>, <b>Polskiego Towarzystwa Ginekologicznego</b>, <b>Polskiego Towarzystwa Endokrynologii Ginekologicznej</b>.</p>', 'pl'),
	(88, 'Słownik', '<p>Słownik</p>', 'pl'),
	(89, 'Dane kontaktowe', '<h2>Lek. Piotr Broda</h2>', 'pl'),
	(90, 'Pierwszy gabinet', '<h2>Gabinet przyjęć</h2>\r\n<p>alvamed<br />ul. Podg&oacute;rna 9<br />61-828 Poznań</p>\r\n<p>podw&oacute;rze dawnego Szpitala im. J. Strusia, wejście "I"</p>\r\n<p>Adresy, rejestracja</p>\r\n<p><a href="http://www.naprotechnologia-poznan.pl/">http://www.naprotechnologia-poznan.pl/</a><a href="http://alvamed.pl/index.php/naprotechnologia"><br />http://alvamed.pl/index.php/naprotechnologia</a></p>', 'pl'),
	(91, 'Drugi gabinet', '<h2>Gabinet przyjęć</h2>\r\n<p>Gabinet ginekologiczny w Ośrodku Wsparcia Płodności &bdquo;NaProTechnologia&rdquo;<br />ul. Klasztorna 4<br />62-563 Licheń Stary</p>\r\n<p>Godziny przyjęć, rejestracja, cennik, dojazd:</p>\r\n<p><a href="http://www.lichen.pl/pl/472/godziny_przyjec">http://www.lichen.pl/pl/472/godziny_przyjec</a></p>\r\n<p>&nbsp;</p>', 'pl'),
	(92, 'Hormony', '<p>Wiele laboratori&oacute;w stosuje nie tylko inne metody analityczne podczas praparatyki materiału, ale r&oacute;wnież przedstawia wynik w innych jednostkach miary. Nieuwzględnienie tego faktu może skutkować błędami diagnostycznymi i w konsekwencji niewłaściwą terapią.</p>\r\n<p>Tutaj możesz zweryfikować swoje wyniki w r&oacute;żnych jednostkach.</p>', 'pl'),
	(93, 'Indeksy hormonalne', '<p>Wsp&oacute;łczesna medycyna w diagnostyce stosuje r&oacute;żne skale i wsp&oacute;łczynniki.</p>\r\n<p>HOMA, insulinooporność, testosteron biodostępny i in.</p>\r\n<p>Twoje badanie jest wyrażone w innych jednostkach?</p>\r\n<p>Tutaj wszystko przeliczysz i uzyskasz wynik jaki możesz przekazać Pacjentowi.</p>', 'pl'),
	(94, 'Antropometria', '<p>BMI, WHR, powierzchnia ciała, klirens kreatyniny, grupa krwi dziecka a grupa krwi rodzic&oacute;w, kalkulator ciążowy dla ludzi i zwierząt.</p>\r\n<p>Podstaw dane a otrzymasz wynik!</p>', 'pl'),
	(95, 'Do pobrania', '<p>Do pobrania</p>', 'pl');
/*!40000 ALTER TABLE `text_translation` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
