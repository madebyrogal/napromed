-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 10.128.49.25
-- Czas wygenerowania: 12 Gru 2015, 15:39
-- Wersja serwera: 5.1.73
-- Wersja PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `db1052233_napromed`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_from` date NOT NULL,
  `article_category_id` bigint(20) DEFAULT NULL,
  `author` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_category_id_idx` (`article_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `article`
--

INSERT INTO `article` (`id`, `date_from`, `article_category_id`, `author`, `hidden`, `created_at`, `updated_at`) VALUES
(1, '2014-02-09', 1, '', 0, '2014-02-11 22:58:28', '2014-02-11 22:58:28'),
(2, '2014-02-10', 2, '', 0, '2014-02-11 22:59:13', '2014-02-11 22:59:13'),
(3, '2014-02-11', 3, '', 0, '2014-02-11 22:59:47', '2014-02-11 22:59:47'),
(4, '2014-02-12', 1, '', 0, '2014-02-28 21:10:12', '2014-02-28 21:10:12');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article_category`
--

CREATE TABLE IF NOT EXISTS `article_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `article_category`
--

INSERT INTO `article_category` (`id`, `hidden`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article_category_translation`
--

CREATE TABLE IF NOT EXISTS `article_category_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `article_category_translation_sluggable_idx` (`slug`,`lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `article_category_translation`
--

INSERT INTO `article_category_translation` (`id`, `name`, `lang`, `slug`) VALUES
(1, 'Kategoria 1', 'pl', 'kategoria-1'),
(2, 'Kategoria 2', 'pl', 'kategoria-2'),
(3, 'Kategoria 3', 'pl', 'kategoria-3'),
(4, 'Kategoria 4', 'pl', 'kategoria-4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article_translation`
--

CREATE TABLE IF NOT EXISTS `article_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `sneak_peak` text COLLATE utf8_polish_ci,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `article_translation_sluggable_idx` (`slug`,`lang`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `article_translation`
--

INSERT INTO `article_translation` (`id`, `title`, `sneak_peak`, `body`, `lang`, `slug`) VALUES
(1, 'Tytuł artykułu 1', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-1'),
(2, 'Tytuł artykułu 2', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-2'),
(3, 'Tytuł artykułu 3', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-3'),
(4, 'Tytuł artykułu 4', 'Quisque blandit rutrum malesuada. Curabitur tincidunt dui convallis convallis sagittis. Nulla dapibus lorem nisi, a interdum nulla iaculis ut.\r\n\r\nNam id massa eu dui lobortis vestibulum eget eu magna. Duis ornare malesuada faucibus. Nulla tincidunt porta commodo. Pellentesque tincidunt pharetra pellentesque.', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl', 'tytul-artykulu-4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attachment`
--

CREATE TABLE IF NOT EXISTS `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `file` text COLLATE utf8_polish_ci NOT NULL,
  `extenstion` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attachment_translation`
--

CREATE TABLE IF NOT EXISTS `attachment_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attribute_def`
--

CREATE TABLE IF NOT EXISTS `attribute_def` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id_idx` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attribute_def_translation`
--

CREATE TABLE IF NOT EXISTS `attribute_def_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attribute_def_value`
--

CREATE TABLE IF NOT EXISTS `attribute_def_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_def_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_def_id_idx` (`attribute_def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attribute_def_value_translation`
--

CREATE TABLE IF NOT EXISTS `attribute_def_value_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attribute_type`
--

CREATE TABLE IF NOT EXISTS `attribute_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `attribute_type`
--

INSERT INTO `attribute_type` (`id`, `name`) VALUES
(1, 'value'),
(2, 'single'),
(3, 'multiple');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attribute_value`
--

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
  KEY `product_id_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `attribute_value_translation`
--

CREATE TABLE IF NOT EXISTS `attribute_value_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `carousel_home`
--

CREATE TABLE IF NOT EXISTS `carousel_home` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `number_of_slides` bigint(20) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `carousel_home`
--

INSERT INTO `carousel_home` (`id`, `name`, `number_of_slides`, `type`, `hidden`) VALUES
(1, 'home', 4, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact_form_1`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `contact_form_1`
--

INSERT INTO `contact_form_1` (`id`, `name`, `subject`, `firm`, `phone`, `email`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Tomasz Rogalski', 'Testowy temat', '', '', 'rogalski.tomaszek@gmail.com', 0, 'Test', '2014-04-25 19:27:00', '2014-04-25 19:27:40'),
(2, 'Tomasz Rogalski', 'Testowy temat 2', '', '', 'rogalski.tomaszek@gmail.com', 0, 'Test 2', '2014-04-25 19:31:00', '2014-04-25 19:31:07'),
(3, 'Tomasz', 'Test', NULL, NULL, 'tomasz.rogalski@vp.pl', 0, 'Treść', '2014-04-28 22:36:29', '2014-04-28 22:36:29'),
(4, 'Tomasz', 'Test z kontaktu', NULL, NULL, 'tomasz.rogalski@vp.pl', 0, 'ĄŚĆąśćó', '2014-04-28 22:37:32', '2014-04-28 22:37:32'),
(5, 'Tomasz Rogalski', 'Test formularza kontaktowego', NULL, NULL, 'tomasz.rogalski@vp.pl', 0, 'Test', '2014-05-04 10:17:08', '2014-05-04 10:17:08');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact_form_2`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact_form_3`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dictionary`
--

CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=17 ;

--
-- Zrzut danych tabeli `dictionary`
--

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dictionary_translation`
--

CREATE TABLE IF NOT EXISTS `dictionary_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `dictionary_translation_sluggable_idx` (`slug`,`lang`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `dictionary_translation`
--

INSERT INTO `dictionary_translation` (`id`, `title`, `body`, `lang`, `slug`) VALUES
(1, 'PCO', '<p>Zesp&oacute;ł policystycznych jajnik&oacute;w (PCOS) jest bardzo często powiązany z&nbsp;niepłodnością. Wynika to stąd, że jajniki nie funkcjonują prawidłowo, a owulacja pojawia się nieregularnie. Dlatego kobiety cierpiące na zesp&oacute;ł policystycznych jajnik&oacute;w mają zazwyczaj długie i&nbsp;nieregularne cykle menstruacyjne. Ta najczęstsza endokrynopatia dotyka około 10-15% kobiet w wieku reprodukcyjnym.</p>\r\n<p>Wiele lat temu syndrom ten identyfikowano jako zesp&oacute;l Steina-Leventhala. Był on związany z&nbsp;brakiem miesiączki, otyłością, nadmiernym owłosieniem ciała, nadciśnieniem i&nbsp;niepłodnością a jajniki podczas przeprowadzanych operacji opisywano jako porcelanowe z licznymi drobnymi torbielkami na obwodzie. Wsp&oacute;łczesna nauka, dzięki badaniom hormonalnym, ultrasonograficznym i&nbsp;laparoskopowym pokazała, że znaczna część kobiet cierpiąca z&nbsp;powodu zespołu policystycznych jajnik&oacute;w wcale nie jest otyła, nie ma nadciśnienia i&nbsp;występuje u&nbsp;nich miesiączka (choć mają długie i&nbsp;nieregularne cykle). Kobiety te mają natomiast bardzo często problem z&nbsp;płodnością.</p>\r\n<p>Obecnie uznaje się, że u samego podłoża tej endokrynopatii leży szereg czynnik&oacute;w wzajemnie na siebie wpływających i wywołujących patologiczne reakcje w mechanizmie tzw. błędnego koła. Początek kaskady tych niekorzystnych zdarzeń upatruje się w:</p>\r\n<ul>\r\n<li>Czynnikach genetycznych (mutacje w genie P450c-17 i 11 HSD-1)</li>\r\n<li>Wewnątrzmacicznej ekspozycji płodu dziewczęcego na wysokie poziomy androgen&oacute;w u matki</li>\r\n<li>Siedzący tryb życia</li>\r\n<li>Otyłość</li>\r\n</ul>\r\n<p><strong>Diagnostyka zespołu policystycznych jajnik&oacute;w (PCO)</strong></p>\r\n<p>Śledzenie cyklu menstruacyjnego jest bardzo ważne dla oceny zdrowia pacjentki, a następnie dla zastosowania odpowiedniego leczenia. Wymagane jest wykonanie pełnego profilu hormonalnego, badań USG, oceny owulacji. Powinien on zawierać badania hormon&oacute;w takich jak: FSH, LH, androstendionu, testosteronu, wolnego testosteronu, DHEA, prolaktyny, beta-endorfin, TSH, FT3, FT4, progesteronu i&nbsp;estradiolu a czasem także 17&alpha;OHP. Należy jednak przede wszystkim zlecić wykonanie doustnego testu obciążenia glukozą z ocena poziomu insuliny w spoczynku i po 2 godz. testu.</p>\r\n<p>Po wykonaniu tych badań możliwe jest wyeliminowanie niekt&oacute;rych przyczyn nieregularnych cykli i&nbsp;definitywnie zdiagnozowanie zespołu PCO. Dodatkowo wykonywane jest badanie ultrasonograficzne miednicy mniejszej. Jajniki kobiety z&nbsp;PCO często są o&nbsp;wiele większe i&nbsp;wielotorbielowate z hiperechogenicznym zrębem. W&nbsp;pewnych przypadkach przeprowadzana jest r&oacute;wnież diagnostyka laparoskopowa.</p>\r\n<p><strong>Leczenie zespołu policystycznych jajnik&oacute;w (PCOS)</strong></p>\r\n<p>Jednym z&nbsp;pierwszych zadań w&nbsp;leczeniu zespołu policystycznych jajnik&oacute;w jest zmniejszenie produkcji męskich hormon&oacute;w poprzez redukcję hiperinsulinemii i insulinooporności.</p>\r\n<p>Uzyskuje się to farmakologicznie lub przez klinową resekcję jajnik&oacute;w. Leczeniu zawsze musi towarzyszyć zmiana stylu życia i zwiększony wydatek energetyczny. Leczenie operacyjne daje trwałe rezultaty w postaci przywr&oacute;cenia płodności i zniesieniu zaburzeń metabolicznych. Leczenie płodności można osiągnąć także przez stymulację owulacji np. letrozolem czy klomifenem. Wspomniana wyżej klinowa resekcja jajnik&oacute;w jest procedurą chirurgiczną polegającą na klinowym usunięciu części tkanki jajnika, przez co ulega on zmniejszeniu i&nbsp;poprawia się jego funkcjonowanie. Choć jest to operacja znana od dawna, obecnie powraca do łask, gdyż znacząco poprawiła się w&nbsp;medycynie zdolność do zapobiegania powstawaniu zrost&oacute;w. Dodatkowo, zabieg jest wyjątkowo skuteczny jeśli chodzi o trwałe obniżenie poziomu męskich hormon&oacute;w (hiperandrogenemia) oraz ich działania (hiperandrogenizm) i&nbsp;regulację cyklu menstruacyjnego, co jednocześnie poprawia płodność i&nbsp;obniża ryzyko wystąpienia raka piersi i błony śluzowej macicy.</p>\r\n<p>Wyniki leczenia niepłodności metodą NaProTECHNOLOGY opublikowane zostały w 2004 roku przez prof. Thomasa Hilgersa w <em><strong>The Medical and Surgical Practice of NaProTECHNOLOGY</strong></em> oraz w 2008 roku w publikacji Josepha B. Stanforda, MD,MSPH, Tracey A.Parnella, MD and Phila C. Boyle, MB w czasopiśmie medycznym <strong>"Journal of the American Board of Family Medicine: Outcomes From Treatment of Infertility With Natural Procreative Technology in an Irish General Practice"</strong>.</p>\r\n<p>Skumulowany wskaźnik ciąż dla pacjentek z zespołem policystycznych jajnik&oacute;w:</p>\r\n<ol>\r\n<li>40% po 12 miesiącach</li>\r\n<li>65% po 24 miesiącach</li>\r\n<li>do 90% po 48 miesiącach</li>\r\n</ol>\r\n<p><strong>NaProTECHNOLOGY</strong> okazuje się <strong>2,36 razy bardziej skuteczna niż in vitro dla PCOS</strong>, 2,67 razy dla endometriozy i 1,41 razy dla niedrożności jajowod&oacute;w. W badaniu z Irlandii, w latach 1998-2002 zgłosiło się 1239 par małżeńskich z powodu niepłodności. Średni wiek kobiet to 35,8 lat, średnia długość trwania niepłodności 5,6 roku. 33% par wcześniej było leczonych ART. Wskaźnik ciąż <strong>NaProTECHNOLOGY</strong> wyni&oacute;sł 52%. Udało się pom&oacute;c około 30% par po niepowodzeniach ART, czyli technik wspomaganego rozrodu &bdquo;in vitro&rdquo;(J Am Board Fam Med 2008;21:375&ndash;384.).</p>\r\n<p>Szczeg&oacute;łowe badania nad skutecznością metody w przypadkach problem&oacute;w z płodnością dostępne są na stronie: <a href="http://naprotechnology.com/infertility.htm" target="_blank">http://naprotechnology.com/infertility.htm</a></p>', 'pl', 'pcos'),
(2, 'Endometrioza', '<p>Schorzenie to ma niejasne przyczyny i polega na pojawieniu się fragment&oacute;w błony śluzowej macicy (endometrium) poza jej naturalnym umiejscowieniem czyli poza jamą macicy, co jest przyczyną przewlekłej reakcji zapalnej. Endometrium takie zachowuje zdolność do wzrostu i przemian hormonalnych; cyklicznie złuszcza się, powodując występowanie b&oacute;lu i krwawień, niszczenie zajętego narządu, wystąpienie stanu zapalnego i zrost&oacute;w.</p>\r\n<p>Częstość występowania endometriozy w populacji kobiet:</p>\r\n<ul>\r\n<li>u młodocianych i w wieku rozrodczym występuje u około 6 &ndash; 15%</li>\r\n<li>po menopauzie -&nbsp; 3%</li>\r\n<li>wśr&oacute;d kobiet z przewlekłym b&oacute;lem w miednicy - 70%</li>\r\n<li>z niepłodnością &ndash; 25 &ndash; 50%</li>\r\n</ul>\r\n<p>Obserwuje się 7 krotnie większe ryzyko rozwoju endometriozy u kobiet, kt&oacute;rych krewna pierwszego stopnia miała rozpoznaną tę chorobę.</p>\r\n<p>Nie ustalono mechanizmu prowadzącego do rozwoju tego schorzenia, rozpatruje się obecnie następujące teorie:</p>\r\n<ul>\r\n<li>wstecznego miesiączkowania przez jajowody do jamy otrzewnowej</li>\r\n<li>metaplazji kom&oacute;rek jamy ciała z resztek embrionalnych przewod&oacute;w M&uuml;llera</li>\r\n<li>wadliwego r&oacute;żnicowania i proliferacji kom&oacute;rek macierzystych</li>\r\n<li>przerzutu limfatycznego i naczyniowego</li>\r\n</ul>\r\n<p>Ważnym elementem powstania endometriozy jest nieprawidłowa odpowiedź immunologiczna polegająca zar&oacute;wno na nieskutecznym niszczeniu powstałych ognisk jak i wytworzeniu przewlekłego stanu zapalnego. Nie ustalono, czy reakcja immunologiczna jest źr&oacute;dłem powstania ognisk chorobowych (cytokiny wzrostu i r&oacute;żnicowania), czy tylko nieadekwatną reakcją na patologiczną tkankę.</p>\r\n<p>Charakterystycznymi objawami towarzyszącymi endometriozie są bardzo bolesne miesiączki, bolesne wypr&oacute;żnienia, b&oacute;l podczas wsp&oacute;łżycia, b&oacute;l podczas owulacji, krwinkomocz, zesp&oacute;ł napięcia przedmiesiączkowego, przewlekły b&oacute;l miednicy, zesp&oacute;ł przewlekłego zmęczenia i niepłodność. Patologiczna reakcja immunologiczna wpływa na występowanie innych, mniej swoistych objaw&oacute;w.</p>\r\n<p>Jako przyczynę występującej w endometriozie niepłodności upatruje się embriotoksyczny wpływ płynu otrzewnowego bogatego w cytokiny i wadliwą reakcję immunologiczną organizmu matki prowadzącą do stworzenia niekorzystnych dla prokreacji warunk&oacute;w. Innymi czynnikami są zrosty czasem prowadzące do niedrożności jajowod&oacute;w (czynnik jajowodowy) i zaburzenia jajeczkowania w zniszczonych endometriozą jajnikach.</p>\r\n<p>Diagnostyka polega na dokładnie zebranym wywiadzie, badaniu ginekologicznym (we wzierniku, przez pochwę i/lub przez odbytnicę, ultrasonografii. Złotym standardem postawienia rozpoznania jest wykonanie laparoskopii lub uwidocznienie zmian w pochwie (ocena wzrokowa) z ewentualną weryfikacją rozpoznania w badaniu histopatologicznym pobranych tkanek. Zmiany naciekowe są łatwiejsze do zdiagnozowania ginekologicznego podczas trwania miesiączki.</p>\r\n<p>Wskazaniami do laparoskopii są: silne dolegliwości b&oacute;lowe, typowe zmiany w badaniu ginekologicznym, niepłodność bez potwierdzonej w badaniach istotnej patologii.</p>\r\n<p>Podejmowane pr&oacute;by oceny nasilenia schorzenia w oparciu o skale rozległości anatomicznej procesu chorobowego często nie znajdują potwierdzenia w zgłaszanych przez Pacjentkę dolegliwościach. Nawet Endometrioza minimalna może być źr&oacute;dłem bardzo nasilonego b&oacute;lu w miednicy i niepłodności, podczas gdy duże torbiele i zrosty mogą takich dolegliwości nie wywoływać.</p>\r\n<p>Wyr&oacute;żnia się 3 typy endometriozy:</p>\r\n<ul>\r\n<li>otrzewnową</li>\r\n<li>jajnikową</li>\r\n<li>głęboko naciekającą</li>\r\n</ul>\r\n<p>Leczenie jest uzależnione od sytuacji Pacjentki; jeśli gł&oacute;wną dolegliwością jest niepłodność małżeńska, to optymalnym postępowaniem jest zachowawcze leczenie operacyjne z wycięciem wszystkich zmienionych chorobowo tkanek. Leczenie takie jest trudne i może być także okaleczające (wycięcie fragment&oacute;w jelit, pęcherza, tworzenie nowych zrost&oacute;w), niemniej w statystykach prof. T. Hilgersa bardzo skuteczne, zwłaszcza w por&oacute;wnaniu do metod ART. Koniecznym jest też korekta nieprawidłowej reakcji immunologicznej możliwa do uzyskania przez stosowanie suplement&oacute;w i optymalizację diety.</p>\r\n<p>Wyniki leczenia niepłodności metodą NaProTECHNOLOGY opublikowane zostały w 2004 roku przez prof. Thomasa Hilgersa w <strong><em>The Medical and Surgical Practice of NaProTECHNOLOGY</em></strong> oraz w 2008 roku w publikacji Josepha B. Stanforda, MD,MSPH, Tracey A.Parnella, MD and Phila C. Boyle, MB w czasopiśmie medycznym <strong>"Journal of the American Board of Family Medicine: Outcomes From Treatment of Infertility With Natural Procreative Technology in an Irish General Practice"</strong>.</p>\r\n<p>Wyniki leczenia kiedy rozpoznaną przyczyną niepłodności była endometrioza:</p>\r\n<ol start="1">\r\n<li>45% do 12 miesięcy,</li>\r\n<li>65% do 24 miesięcy,</li>\r\n<li>78% do 36 miesięcy.</li>\r\n</ol>\r\n<p>&nbsp;<strong>NaProTECHNOLOGY</strong> okazuje się <b>2,67 razy bardziej skuteczna niż in vitro dla endometriozy</b>, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w. W badaniu z Irlandii, w latach 1998-2002 zgłosiło się 1239 par małżeńskich z powodu niepłodności. Średni wiek kobiet to 35,8 lat, średnia długość trwania niepłodności 5,6 roku. 33% par wcześniej było leczonych ART. Wskaźnik ciąż <strong>NaProTECHNOLOGY</strong> wyni&oacute;sł 52%. Udało się pom&oacute;c około 30% par po niepowodzeniach ART, czyli technik wspomaganego rozrodu &bdquo;in vitro&rdquo; (J Am Board Fam Med 2008;21:375&ndash;384.).</p>\r\n<p>Szczeg&oacute;łowe badania nad skutecznością metody w przypadkach problem&oacute;w z płodnością dostępne są na stronie: <a href="http://naprotechnology.com/infertility.htm" target="_blank">http://naprotechnology.com/infertility.htm</a></p>', 'pl', 'endometrioza'),
(3, 'Parametry nasienia', '<p>Obowiązujące powszechnie dolne wartości parametr&oacute;w nasienia wg zaleceń WHO z 2010 r. to 5 percentyl z badań nasienia uzyskanych od mężczyzn, kt&oacute;rzy uzyskali potomstwo w czasie poniżej 12 miesięcy. Z tego wynika parę wniosk&oacute;w:</p>\r\n<ul>\r\n<li>Wydłużenie czasu obserwacji &gt;12 m-cy może obniżyć normę dla 5 percentyla płodnych mężczyzn</li>\r\n<li>Norma 2,5 percentyla jest niższa niż w 5 percentylu a mężczyźni ci też uzyskali ciąże w ciągu 12 miesięcy obserwacji, wydłużenie obserwacji może obniżyć i tę normę</li>\r\n<li>Nie ustalono dolnej granicy poniżej kt&oacute;rej m&oacute;wić można o całkowitej niepłodności męskiej (za wyjątkiem trwałej azoospermii)</li>\r\n</ul>\r\n<p>Dla postawienia wstępnego rozpoznania powinny być przeprowadzone co najmniej 2&mdash;3 badania wykonane w odstępach 7-21 dni od poprzedniego z zachowaniem podobnego okresu wstrzemięźliwości płciowej (2-7 dni).</p>\r\n<p>Opis badania nasienia powinien być wystandaryzowany wg wzoru Komisji do Spraw Konsensusu Lekarsko - Diagnostycznego Polskiego Towarzystwa Andrologicznego.</p>\r\n<p><strong>Dolne wartości referencyjne dla parametr&oacute;w nasienia wg WHO z 2010 r.</strong></p>\r\n<ul>\r\n<li>Objętość &ndash; 1,5 ml</li>\r\n<li>Całkowita liczba plemnik&oacute;w (mln/ejakulat) &ndash; 39</li>\r\n<li>Koncentracja plemnik&oacute;w (mln/ml) &ndash; 15</li>\r\n<li>Całkowity rych plemnik&oacute;w (%) &ndash; 40</li>\r\n<li>Ruch postępowy plemnik&oacute;w (%) &ndash; 32</li>\r\n<li>Żywotność plemnik&oacute;w (%) &ndash; 58</li>\r\n<li>Prawidłowa morfologia plemnik&oacute;w (%) &ndash; 4</li>\r\n<li>Pozostałe uzgodnione wartości progowe\r\n<ul>\r\n<li>Czas upłynnienia ejakulatu - &lt; 60 minut</li>\r\n<li>pH &ndash; &ge; 7,2</li>\r\n<li>leukocyty peroksydazo-dodatnie <em>LeucoScreen</em> (mln/ml) - &lt; 1</li>\r\n<li>kom&oacute;rki okrągłe (mln/ml) &ndash; &lt; 5</li>\r\n</ul>\r\n</li>\r\n<li>dodatkowe testy\r\n<ul>\r\n<li>MAR-test (% ruchomych plemnik&oacute;w związanych z kuleczkami) &ndash; &lt; 50</li>\r\n<li>Immunobead test (% ruchomych plemnik&oacute;w związanych z kuleczkami) &ndash; &lt; 50</li>\r\n</ul>\r\n</li>\r\n<li>Testy biochemiczne nasienia\r\n<ul>\r\n<li>Cynk (&micro;mol/ejakulat) &ndash; &ge; 2,4</li>\r\n<li>Fruktoza (&micro;mol/ejakulat) &ndash; &ge; 13 lub (mg/ejakulat) &gt; 2,4</li>\r\n<li>Fruktoza skorygowana N: 2,5 &ndash; 8 mg fruktozy / mln plemnik&oacute;w / ml</li>\r\n<li>&alpha; glukozydaza obojętna NAG (mU/ejakulat) - &ge; 20</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<p>W celu obliczenia wskaźnik&oacute;w zaburzeń morfologicznych plemnik&oacute;w (TZI, SDI, MAI) laboratorium musi używać morfologicznych kryteri&oacute;w opracowanych wg rekomendacji WHO z 2010 r.</p>\r\n<p>Badania dodatkowe, kt&oacute;re można oceniać w wybranych przypadkach to:</p>\r\n<ul>\r\n<li>Test TRAP</li>\r\n<li>Test HBA</li>\r\n<li>Test ROS</li>\r\n<li>Test przeżywalności plemnik&oacute;w</li>\r\n<li>Badanie reakcji akrosomalnej</li>\r\n<li>Badanie chromatyny plemnikowej DFI N: &lt; 15 %</li>\r\n<li>ocena białek jądrowych (nukleoprotein) - protaminacji N: &ge; 70 %</li>\r\n<li>Test migracyjny <em>Swimm Up</em></li>\r\n<li>Badanie aktywności mitochondrialnej we wstawkach plemnik&oacute;w, (test NADH-NBT; test formazanowy)</li>\r\n<li>test akrozynowy</li>\r\n<li>transferyna &ge; 85 &mu;g/ejakulat</li>\r\n</ul>\r\n<p>Lekarz konsultant zleci także badania mikrobiologiczne nasienia (posiew i antybiogram) w kierunku:</p>\r\n<ul>\r\n<li>Bakterii tlenowych</li>\r\n<li>Bakterii beztlenowych</li>\r\n<li>Drobnoustroj&oacute;w mikroaerofilnych</li>\r\n<li>Mykoplasm / Ureaplasm</li>\r\n<li>Grzyb&oacute;w</li>\r\n</ul>\r\n<p>oraz dokona diagnostyki w kierunku Chlamydia spp.</p>\r\n<p>&nbsp;</p>\r\n<p>Inne, obecnie niezalecane elementy badania nasienia to:</p>\r\n<ul>\r\n<li>barwa</li>\r\n<li>lepkość</li>\r\n<li>zapach</li>\r\n<li>test po stosunku PCT</li>\r\n<li>karnityna N: 0,8 - 2,9 mmol/ejakulat</li>\r\n<li>kwas cytrynowy N: &gt; 52 &mu;mol/ejakulat</li>\r\n<li>kwaśna fosfataza N: &gt; 200 U/ejakulat</li>\r\n</ul>', 'pl', 'parametry-nasienia'),
(4, 'Badanie andrologiczne', '<p>Niepłodność małżeńska jako objaw schorzenia musi być rozpatrywana w danym układzie dwojga ludzi, stąd konieczność diagnostyki i leczenia obojga partner&oacute;w. Czynnik męski niepłodności występuje u około 40 % niepłodnych małżeństw. Dodatkowo u ok 20 % par stwierdza się wsp&oacute;łwystępowanie czynnika męskiego i żeńskiego.</p>\r\n<p>W trakcie wizyty w gabinecie Konsultant zaproponuje przeprowadzenie badania męskich narząd&oacute;w płciowych czyli <strong>badanie andrologiczne</strong>. W celu postawienia diagnozy konsultant NaProTECHNOLOGY wykona:</p>\r\n<p><strong>Badanie podmiotowe</strong> &ndash; czyli wywiad lekarski rozszerzony zagadnienia związane z życiem płciowym Pacjenta, narażeniem na szkodliwe czynniki środowiskowe i zagadnienia genetyczne.</p>\r\n<p><strong>Badanie przedmiotowe</strong> &ndash; czyli badanie fizykalne uwzględniające zagadnienia antropometryczne, badanie pola widzenia i obecność węchu, stopień rozwoju cech płciowych, badanie palpacyjne jąder i badanie urologiczne gruczoł&oacute;w płciowych dodatkowych. <b>Badanie USG: jąder</b> i transrektalne wnosi wiele danych do rozpoznania. Podczas badania USG Konsultant NaPro - androlog oceni wielkość i echostrukturę jąder, najądrzy, oceni splot żylny (wiciowaty) powr&oacute;zka nasiennego, obecność torbieli jądra, osłonki białawej, najądrza, nasieniowodu, poszerzenie sieci jądra / śr&oacute;djądrza, obecność zmian typu TART czy obecnoąć płynu pomiędzy osłonkami jądra (wodniak). Obecność nasieniowodu stwierdza się badaniem palpacyjnym z ewentualnym potwierdzeniem podczas badania USG. Kluczowym elementem badania andrologicznego jest wykluczenie zmian guzowatych i dyzgenetycznych w jądrach.</p>\r\n<p>Pamiętać też należy, że często jedynym objawem toczącego się procesu nowotworowego w jądrze jest niepłodność i nieprawidłowości w badaniu nasienia. Ta przesłanka nakazuje wnikliwą ocenę narząd&oacute;w moszny w celu wczesnego wykrycia i ewentualnego leczenia <b>raka jądra</b>.</p>\r\n<p>Z badaniach laboratoryjnych zleca się badania z zakresu kompetencji Lekarza POZ jak i specjalistyczne badania hormonalne. Badanie musi być rozszerzone o ocenę parametr&oacute;w nasienia.</p>', 'pl', 'badanie-andrologiczne'),
(5, 'Dobre cykle', '<p><b>O efektywnych (dobrych) cyklach m&oacute;wimy gdy stwierdzamy:</b><b></b></p>\r\n<p><b>A.</b></p>\r\n<ol>\r\n<li>Poziom hormon&oacute;w w dniu Peak+7 (lub P+6,+8,+9) jest optymalny czyli\r\n<ul>\r\n<li>Progesteron 19-32 ng/ml (60-100 nmol/l)</li>\r\n<li>Estradiol 109-218 pg/ml (400-800 pmol/1)</li>\r\n<li>Zadowalający obraz śluzu szyjkowego</li>\r\n</ul>\r\n</li>\r\n<li>Prawidłowy przebieg krwawienia miesięcznego</li>\r\n<li>Dobrą kontrolę zespołu napięcia przed miesiączkowego</li>\r\n<li>Normalny poziom &bdquo;energii"</li>\r\n<li>Prawidłowe badanie nasienia</li>\r\n</ol>\r\n<p><b>B.</b></p>\r\n<ol>\r\n<li>Ultrasonograficznie potwierdzenie pękania pęcherzyka Graafa (ocena owulacji)</li>\r\n<li>Potwierdzenie prawidłowej budowy anatomicznej (ultrasonografia i/lub laparoskopia i/lub histeroskopia)</li>\r\n</ol>\r\n<p><b>C.</b></p>\r\n<ol>\r\n<li>Podczas okresu płodnego częste, niewymuszone wsp&oacute;łżycie małżeńskie&nbsp; (optymalnie od początku śluzu typu P do dnia P+2)</li>\r\n<li>Świadomość podlegania stresowi i umiejętność radzenia sobie z nim. (ekstremalna dieta lub wysiłek fizyczny, zaburzenia snu, b&oacute;l, choroba, praca, egzaminy, wakacje, żałoba, problemy emocjonalne)</li>\r\n</ol>', 'pl', 'dobre-cykle'),
(6, 'Czynnik jajowodowy', '<p>W ostatnich dekadach gwałtownie zwiększa się ilość par małżeńskich z rozpoznawaną niepłodnością. Początek tego trendu sięga jednej do dw&oacute;ch dekad po upowszechnieniu metod antykoncepcji hormonalnej. Wbrew zaklęciom firm farmaceutycznych i płatnych protagonist&oacute;w nie tylko nie zmniejszyła się ilość &bdquo;niechcianych ciąż&rdquo; ale r&oacute;wnież ilość chor&oacute;b przenoszonych drogą płciową (<strong>STD</strong> &ndash; <em>sexually transmitted diseases</em>). Wiele teoretycznych opracowań minionych (na szczęście) dekad zakładało, że taka zmiana obyczajowości doprowadzi ludzkość do pełnej wolności a przez to do pełni szczęścia. Niestety stany zapalne dr&oacute;g rodnych przenoszone z chorych kobiet przez zdrowych mężczyzn na zdrowe kobiety prowadzą do wielu patologii nierzadko o dramatycznym finale. W wielkim skr&oacute;cie do schorzeń przenoszonych drogą kontakt&oacute;w seksualnych zaliczyć można:</p>\r\n<ul>\r\n<li>Infekcje wirusem opryszczki</li>\r\n<li>Grzybica drożdżakowa</li>\r\n<li>Rzęsistkowica</li>\r\n<li>Kiła</li>\r\n<li>Rzeżączka</li>\r\n<li>Wirusowe zapalenie wątroby</li>\r\n<li>HIV/AIDS</li>\r\n<li>Infekcja wirusami HPV</li>\r\n<li>Nierzeżączkowe zapalenie cewki moczowej</li>\r\n<li>Infekcja Chlamydia trachomatis</li>\r\n</ul>\r\n<p>Ten z potrzeby pobieżny wykaz schorzeń przenoszonych drogą płciową pozwala uzmysłowić sobie, że większość schorzeń w naszej strefie klimatycznej przebiega skąpoobjawowo a przez to objawy mogą być zbagatelizowane przez chorego, co prowadzi do stanu przewlekłego, często z niszczeniem zajętego narządu. Co do zasady &ndash; im mniej objaw&oacute;w stanu zapalnego, tym częściej rozpoznaje się chorobę w stadium przewlekłym i przez to szersze występowanie danego patogenu w populacji. Na to ostatnie stwierdzenie ma duży wpływ rodzaj zachowań seksualnych w społeczeństwie.</p>\r\n<p>Istnieje zgodność, że najczęstszym patogenem przenoszonym drogą płciową jest Chlamydia trachomatis. Badania ośrodka warszawskiego wykazały, że u ponad 10% aktywnych seksualne nastolatek wykrywa się przeciwciała przeciwchlamydialne a nie jest to czuła metoda wykrywania tej infekcji. Pomijając całość przebiegu naturalnego tej choroby zwr&oacute;cić tu należy na fakt doprowadzenia do niedrożności mechanicznej jajowod&oacute;w przez tworzenie zrost&oacute;w jak i zniszczenie nabłonka światła jajowod&oacute;w, co nawet przy zachowanej ich drożności mechanicznej stwarza wybitnie niekorzystne środowisko dla prawidłowego rozwoju nowego życia i jego dalszego pasażu do jamy macicy, gdzie może dojść do prawidłowego zagnieżdżenia.</p>\r\n<p>Poza infekcją chlamydialną także inne bakteryjne infekcje zwane zapaleniem przydatk&oacute;w mogą prowadzić do niedrożności jajowod&oacute;w. Poza tym także postać endometriozy w cieśni jajowod&oacute;w nazywana <em>salpingitis isthmica nodosa</em> prowadzi do niepłodności mechanicznej. Ponadto każda operacja w jamie brzusznej a zwłaszcza przebycie operacji na przydatkach czy macicy może prowadzić do tworzenia się zrost&oacute;w uniemożliwiających prawidłowy pasaż jajowodowy.</p>\r\n<p>Dla potrzeb akademickich wymienić także należy: obustronną agenezję jajowod&oacute;w czy swoiste zapalenie przydatk&oacute;w (gruźlicze czy promienicze).</p>\r\n<p>Czynnik jajowodowy stanowi od 15 do 40 % wszystkich przypadk&oacute;w niepłodności żeńskiej.</p>\r\n<p>Jeżeli powodem niedrożności jajowodowej są zrosty zlokalizowane w jamie otrzewnowej czy w dystalnym odcinku jajowodu &ndash; istnieje dość wysoka szansa na przywr&oacute;cenie drożności jajowodu metodami operacyjnymi (laparoskopia, chirurgia otwarta, hysteroskopowe udrożnienie giętkimi cewnikami czy pod kontrolą RTG). Jeżeli zmiany są umiejscowione poza aparatem strzępkowym to możliwa jest metoda mikrochirurgiczna. To samo dotyczy procesu zwanego <em>salpingistis isthmica nodosa</em>, gdzie po wycięciu zmienionych tkanek wszywa się zdrowy odcinek jajowodu do ściany macicy. Metody mikrochirurgiczne, aczkolwiek wynalezione już dawno nie znalazły wielu propagator&oacute;w nie tylko z uwagi na ich czaso- i kosztochłonność ale r&oacute;wnież na szerokie rozpowszechnienie ART. Klasyczna medycyna stosuje r&oacute;wnież leczenie bodźcowe, przeciwzapalne i szeroko rozumianą balneologię w przypadku czynnika jajowodowego.</p>\r\n<p>Szansa na ciążę po operacyjnym uwolnieniu zrost&oacute;w jest oceniana na powyżej 40% przypadk&oacute;w, natomiast wszczepienie jajowodu do ściany macicy daje 18% szans na własne potomstwo metodami naturalnymi. Po tych operacjach istnieje też 11-14% ryzyko, że ciąża będzie rozwijać się ektopowo.</p>\r\n<p>Rozpoznanie niedrożności jajowodu można postawić poprzez wykonanie HSG pod kontrolą RTG czy SHSG pod kontrolą USG oraz hydrotubacji (chromoskopii) podczas zabiegu laparoskopowego czy fertiloskopowego (hydrolaparoskopia, salpingoskopia, falloskopia).</p>\r\n<p>Stanowiska Towarzystw zrzeszających lekarzy w przypadku postawienia rozpoznania niedrożności jajowodowej zalecają metody ART, kt&oacute;re jako niegodziwe etycznie nie zostaną zaproponowane Parze przez konsultanta ale o kt&oacute;rych to zaleceniach zostaną poinformowani.</p>', 'pl', 'czynnik-jajowodowy'),
(7, 'Lekarz konsultant NaPro', '<p>Urodzony i wychowany w Poznaniu, studia medyczne ukończył z drugą lokatą w Wojskowej Akademii Medycznej w Łodzi w 1999 r. W trakcie studi&oacute;w pod inspiracją swoich nauczycieli (prof. H. H&uuml;bner &ndash; biolog i genetyk, prof. H. Bartel &ndash; embriolog, prof. S. Orkisz &ndash; histolog, wsp&oacute;łodkrywca translacji DNA-RNA nagrodzonej nagrodą Nobla,&nbsp; dr. D. Tosik &ndash; embriolog, histolog, prof. H. Tch&oacute;rzewski &ndash; patofizjolog i immunolog, prof. K. Zeman &ndash; immunolog, prof. Z. Baj &ndash; patofizjolog, prof. K. Zieliński &ndash; patomorfolog, prof. A. Malinowski &ndash; ginekolog, immunolog, dr W. Budźko &ndash; ginekolog, położnik) rozpoczął pracę w Studenckich kołach naukowych. W tym okresie zainteresowania ogniskowały się na indukowanych wadach wrodzonych u myszy (ocena makroskopowa i w mikroskopie świetlnym oraz elektronowym) gł&oacute;wnie rozszczepach podniebienia indukowanych bromodeoksyurydyną, zagadnieniach związanych z generowaniem reaktywnych form tlenu u ludzi, procesami genetycznym prowadzącymi do apoptozy w procesach rozwoju prenatalnego u myszy poddawanych wpływowi teratogen&oacute;w, immunologicznymi przyczynami niepłodności, gł&oacute;wnie obecnością przeciwciał blokujących we krwi kobiet z par niepłodnych, możliwościami terapeutycznymi leczenia niepłodności o podłożu immunologicznym, gł&oacute;wnie szczepieniem limfocytami partnera w reakcji MLR, przyczynami psychologicznymi w niepłodności małżeńskiej (wsp&oacute;łpraca z prof. Bielawską &ndash; Batorowicz), możliwością zastosowaniu OXTDAN-u w terapii ran poporodowych (badania kliniczne III fazy), wpływem nadwagi i otyłości na wybrane parametry ciąży, porodu i połogu i czynnikami środowiskowymi mogącymi prowadzić do uszkodzenia funkcji generatywnej jajnika u myszy &ndash; ocena wybranych parametr&oacute;w morfologicznych&nbsp; jajnik&oacute;w myszy poddawanych działaniu kofeiny; ocena w mikroskopie świetlnym i elektronowym, badania immunoenzymatyczne i metodami genetyki molekularnej. Za swoje prace nagradzany i wyr&oacute;żniany na konferencjach studenckich, zar&oacute;wno og&oacute;lnopolskich jak i międzynarodowych.</p>\r\n<p>Specjalizację z położnictwa i ginekologii rozpoczął&nbsp; 2001 r. pod okiem prof. J.R. Wilczyńskiego w Instytucie Centrum Zdrowia Matki Polki w Łodzi. Z powod&oacute;w rodzinnych kontynuował specjalizację w Ginekologiczno &ndash; Położniczym Szpitalu Klinicznym w Poznaniu na ul Polnej 33, r&oacute;wnolegle zdobywając doświadczenie zawodowe w Szpitalu Powiatowym w Wałczu. W trakcie specjalizacji nawiązał wsp&oacute;łpracę naukową z prof. W. Baranowskim z CSK WIM w Warszawie, gdzie r&oacute;wnież szkolił się w technikach endoskopowych w ginekologii i w procedurach diagnostycznych i leczeniu operacyjnym w uroginekologii. Od 2006 r. zainteresowany naturalnymi metodami planowania rodziny, a w 2009 r. zetknął się z naprotechnologią jako alternatywą leczenia niepłodności wobec ART. (techniki rozrodu wspomaganego).&nbsp;&nbsp; W latach 2012 &ndash; 2013 brał udział w kursie dla konsultant&oacute;w medycznych metod naturalnego planowania rodziny i szkoleniu z systemu obserwacji cyklu płciowemu kobiety modelem Creighton (the Creighton Model Fertility Care System, CrMS) oraz szkoleniu z NaPro TECHNOLOGY <sup>&trade;</sup>. Prowadził wykłady na temat działania antykoncepcji dla słuchaczy Studium Rodziny przy Wydziale Teologicznym Uniwersytetu im Adama Mickiewicza w Poznaniu i dla student&oacute;w Warszawskiego Uniwersytetu Medycznego w ramach konferencji &bdquo;Ginekologia in vivo&rdquo; a także dla lekarzy podczas IX Gdańskich spotkań z etyką lekarską i spotkaniach ginekolog&oacute;w katolickich i środowisk napro. W swoich opracowaniach ogniskował się na wpływie antykoncepcji na parametry zdrowotne i epidemiologiczne. Zainteresowany czynnikiem męskim w niepłodności małżeńskiej.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Członek zwykły Polskiego Towarzystwa Andrologicznego, Polskiego Towarzystwa Ginekologicznego, Polskiego Towarzystwa Endokrynologii Ginekologicznej.</p>', 'pl', 'lekarz-konsultant-napro'),
(8, 'NaPro TECHNOLOGY (NaPro Technologia, naprotechnologia, NaPro, napro)', '<p class="Standard">NaProTechnologia jest dziedziną medycyny prokreacyjnej, kt&oacute;rą opracował Thomas W. Hilgers z USA (natural procreative technology) człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą integralność osobową Pacjenta i <a title="Nauczanie społeczne KK - baza link&oacute;w" href="http://www.lichen.pl/pl/303/dokumenty_i_zrodla" target="_blank">nauczanie społeczne Kościoła Katolickiego</a>. Z uwagi na stosowane podejście filozoficzne, umocowania kulturowe, zasady postępowania, podejście badawcze i implikacje społeczne stanowiące o zaistnieniu paradygmatu naukowego można nazywać ją nauką, stąd rozwinięcie &ndash;logia (greckie <em>logos</em> &ndash; <em>słowo</em>). Pojęcie NaPro Technology zostało utworzone jako opozycja do Artificial Reproductive Technology (ART), kt&oacute;re tłumaczy się jako technologia sztucznej reprodukcji. Widoczne tutaj podejście T.W. Hilgersa w odr&oacute;żnieniu angielskich sł&oacute;w Reproductive i Procreative ma znaczenie ontologiczne i uwydatnia rolę człowieka w tw&oacute;rczej wsp&oacute;łpracy z Bogiem i nie degraduje jego roli do reproduktora. Z kolei zamiana sł&oacute;w Artificial na Natural określa drogę i kierunek działań lekarza uwzględniającego w swym postępowaniu godność osobistą każdego człowieka (tutaj jako pacjenta).</p>\r\n<p class="Standard">Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną The Creighton Model Fertility Care System (CrMS), stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>\r\n<p>Punktem wyjścia do opracowania modelu Creighton była metoda owulacyjna Billings&oacute;w, kt&oacute;ra polegała na&nbsp; obserwacjach wydzieliny śluzowej szyjki macicy oraz odczuć w&nbsp;okolicach przedsionka pochwy. Zesp&oacute;ł badaczy z Omaha pod kierownictwem T. Hilgersa przeprowadził standaryzację co do jakości jak i ilości cech płodnych śluzu oraz obserwacji i odczuć kobiety. Wieloletnie obserwacje wybranych parametr&oacute;w cyklu płciowego umożliwiły wyr&oacute;żnienie kobiet z typowymi problemami zdrowotnymi układu rozrodczego o określonych cechach zapis&oacute;w. Stało się to przyczynkiem do wyr&oacute;żnienia tzw. biomarker&oacute;w cyklu (typu i&nbsp;ilości obserwowanego śluzu, dynamiki jego zmian, długości i&nbsp;przebiegu fazy przedowulacyjnej, długości i&nbsp;stabilności fazy poowulacyjnej, długości cykli, występowania plamienia przedmenstruacyjnego, przedłużania się brązowego plamienia po miesiączce&nbsp;itp.).</p>\r\n<p class="Standard">Przez poznanie biomarker&oacute;w płodności (NaPro TRACK) łatwiejszym staje się diagnostyka jak r&oacute;wnież terapia:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li>endometriozy</li>\r\n<li>zespołu policystycznych jajnik&oacute;w (PCOS)</li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n</ul>\r\n<p class="Standard">Lekarz Konsultant prowadzi r&oacute;wnież diagnostykę i leczenie czynnika męskiego niepłodności.</p>\r\n<p>CrMS jest naukowo przebadany, precyzyjny i skuteczny, wsp&oacute;łpracuje z płodnością, szanuje godność kobiety i integralność małżeństwa oraz jest całkowicie pozbawiony efekt&oacute;w ubocznych dla każdego z małżonk&oacute;w.</p>\r\n<p>Leczenie NaPro polega na kompleksowym wykorzystaniu najnowocześniejszych osiągnięć medycyny oraz chirurgii we wsp&oacute;łpracy z naturalnym cyklem menstruacyjnym kobiety, tak aby osiągnąć optymalną funkcjonalność bez tłumienia bądź niszczenia płodności. To także propozycja leczenia dla mężczyzn.(tutaj link do badanie andrologiczne lub niepłodność męska)</p>\r\n<p>W dostępnej literaturze skumulowane wskaźniki ciąż po leczeniu NaProTECHNOLOGY z powodu niepłodności uzyskano w</p>\r\n<p>do 12 miesięcy - uzyskano 44% ciąż,<br />do 24 miesięcy uzyskano 62% ciąż,<br />w 48 miesięcy od rozpoczęcia leczenia 71%.</p>\r\n<p>Naprotechnologia bazuje na perfekcyjnym poznaniu fizjologii cyklu płciowego kobiety i ocenia występujące zaburzenia korzystając z biomarker&oacute;w określanych jako NaProTRACK. Takie podejście umożliwia eliminację czynnika sprawczego powodującego obniżenie płodności (zwane także jako niepłodność).</p>', 'pl', 'napro-technology-napro-technologia-naprotechnologia-napro-napro'),
(9, 'Instruktor', '<p>NaPro MED prowadzi wsp&oacute;łpracę z następującymi Instruktorami z wojew&oacute;dztwa wielkopolskiego<br /> <br /> <img title="dr Paulina Michalska FCP Instruktor CrMS Poznań, Wielkoposka" src="/useruploads/images/dr_paulina_michalska_fcp.jpg" alt="dr Paulina Michalska FCP" width="80" height="80" /><strong>Paulina Michalska</strong><br /> Poznań, wielkopolskie, tel. kom. 661 145 459,</p>\r\n<p><a title="dr Paulina Michalska FCP" href="http://naprovita.cal.pl/" target="_blank">http://naprovita.cal.pl/&nbsp;</a></p>\r\n<p><a href="mailto:paulina.michalska@creightonmodel.com.pl">paulina.michalska@creightonmodel.com.pl</a><br /> <br /> <strong>Szymon Kuznowicz</strong><br /> Licheń Stary/Konin, wielkopolskie, tel. kom. 693 298 938,</p>\r\n<p><a title="sesje wprowadzające do CrMS" href="http://www.lichen.pl/pl/278/kontakt" target="_blank">http://www.lichen.pl/pl/278/kontakt</a></p>\r\n<p><a href="mailto:szkuznowicz@wp.pl">szkuznowicz@wp.pl</a></p>', 'pl', 'instruktor CrMS'),
(10, 'Model Creighton ', '<p>W latach 70-tych prof.&nbsp;<strong>Thomas Hilgers</strong>&nbsp;przeprowadził z gronem wsp&oacute;łpracownik&oacute;w&nbsp;szereg badań nad metodami obserwacji cyklu menstruacyjnego i rozpoznawania płodności,&nbsp;w tym szczeg&oacute;lną uwagę poświęcił metodzie owulacji Billingsa. Wypracował on nową&nbsp;metodę- Creighton Model FertilityCare&trade; System (CrMS), wystandaryzowaną modyfikację&nbsp;metody rozpoznawania płodności&nbsp;<strong>Billingsa</strong><strong>.</strong> CrMS stał się pierwszym systemem, kt&oacute;ry&nbsp;<strong>ł</strong><strong>ączy obserwacje</strong>&nbsp;- język zdrowia kobiety,&nbsp;<strong>z </strong><strong>postępowaniem lekarskim</strong><strong>.</strong> System ten nie&nbsp;jest w żaden spos&oacute;b naturalną antykoncepcją. Stanowi on w pełni tego słowa znaczeniu&nbsp;metodę rozpoznawania płodności, kt&oacute;ra może być używana zar&oacute;wno do starania się o&nbsp;poczęcie jak i do odkładania poczęcia w czasie. Ponadto, system ten stanowi cenne źr&oacute;dło&nbsp;informacji dotyczącej całościowego wymiaru zdrowia prokreacyjnego.&nbsp;<strong>Korzyścią</strong><strong>&nbsp;</strong>dla kobiet&nbsp;jest to, że mogą one w tym systemie obserwacji monitorować swoje zdrowie rozrodcze i&nbsp;ginekologiczne. Jest to więc system, kt&oacute;ry łączy w sobie opiekę oraz kompleksową ochronę&nbsp;i troskę o zdrowie. Instruktorzy CrMS stanowią wykwalifikowany pomocniczy personel&nbsp;medyczny, zaś specjalnie wyszkoleni lekarze zostali przygotowani, by w swoją praktykę&nbsp;lekarską włączyć CrMS. Nauka tej metody dla kobiet, czy par pacjent&oacute;w odbywa się podczas&nbsp;<strong>8 spotkań</strong>&nbsp;w pierwszym roku stosowania metody. Para, czy kobieta obserwująca się, pozostaje&nbsp;w kontakcie oraz pod opieką swojego instruktora przez lata, w każdej sytuacji zmiany sytuacji&nbsp;rozrodczej lub intencji stosowania systemu (laktacja, ciąża, odkładanie poczęcia, staranie się&nbsp;o poczęcie) może ponownie udać się na konsultację<sup>1</sup>.</p>\r\n<p><br /> <strong>SZTUKA OBSERWACJI CYKLU</strong></p>\r\n<p>CrMS polega na wystandaryzowanych obserwacjach i zapisach na karcie wskaźnik&oacute;w&nbsp;biologicznych, kt&oacute;re są kluczowe dla zdrowia i płodności kobiety. Owe biowskaźniki są&nbsp;wyznacznikami występowania faz płodnych i niepłodnych. Mogą one r&oacute;wnież sygnalizować&nbsp;nieprawidłowości występujące w zdrowiu kobiety.</p>\r\n<p>Omawiany system obserwacji cyklu&nbsp;opiera się na wnikliwej obserwacji wskaźnik&oacute;w cyklu menstruacyjnego, w tym:</p>\r\n<ol>\r\n<li>obserwacji wzoru krwawienia menstruacyjnego;</li>\r\n<li>obserwacji nietypowych krwawień i&nbsp;ich charakteru;</li>\r\n<li>obserwacji i charakterystyki r&oacute;żnych wydzielin;</li>\r\n<li>obserwacji czasu&nbsp;trwania i wartości poszczeg&oacute;lnych faz cyklu;</li>\r\n<li>obserwacji zmodyfikowanego&nbsp;indeks śluzu szyjkowego, i innych.</li>\r\n</ol>\r\n<p>Dzięki szczeg&oacute;łowym obserwacjom kobiety mają&nbsp;możliwość precyzyjnego zrozumienia przebiegu cyklu, a z pomocą odpowiednio&nbsp;przeszkolonego instruktora CrMS, kobiety uzyskują interpretację i są skierowywane na&nbsp;diagnostykę w odniesieniu do możliwych nieprawidłowości, kt&oacute;re łatwo zidentyfikować&nbsp;na karcie obserwacji. CrMS stanowi więc podstawę dla nowej dyscypliny nauki <strong>-&nbsp;</strong><strong>NaProTECHNOLOGY</strong>. Dzięki temu po raz pierwszy w leczeniu zaburzeń w zakresie&nbsp;układu rozrodczego można wprowadzić diagnostykę i leczenie celowane z niezwykłą&nbsp;precyzją. Na podstawie karty obserwacji kobiety lekarz może dostosowywać diagnostykę&nbsp;i leczenie do przebiegu jej cykli oraz monitorować efekty terapii. Model Creighton cenny&nbsp;jest więc na r&oacute;żnych etapach życia kobiety, w każdej sytuacji, w kt&oacute;rej się ona znajduje,&nbsp;niezależnie czy jest osobą samotną, czy w związku. System obserwacji może bowiem&nbsp;posłużyć do monitorowania zdrowia w cyklach o regularnej jak i nieregularnej długości,&nbsp;w sytuacji problem&oacute;w hormonalnych czy w okresie karmienia piersią, a nawet w okresie&nbsp;premenopauzy<sup>2</sup>.</p>\r\n<p><br /> <strong>STATYSTYKI DOTYCZĄCE SAMOOBSERWACJI</strong></p>\r\n<p>Z badań wynika, że jeżeli para małżeńska zamierza odłożyć poczęcie, skuteczność metody&nbsp;CrMS wynosi 99,5 proc., natomiast uwzględniając błędy w użytkowaniu, skuteczność&nbsp;praktyczna to 96,8 procent<sup>3</sup>.&nbsp;Jeśli para o niezaburzonym stanie płodności stosuje model&nbsp;Creighton w celu starania się o poczęcie, dochodzi do ciąż aż u<strong>&nbsp;</strong><strong>76 proc.</strong>&nbsp;starających się&nbsp;<strong>już w pierwszym cyklu</strong>, a&nbsp;<strong>w pierwszych sześciu cyklach 98 proc.</strong><strong>&nbsp;</strong>zachodzi w ciążę. Sama&nbsp;znajomość swojego cyklu wystarczy do zaplanowania ciąży, jeśli ktoś nie ma większych&nbsp;problem&oacute;w z płodnością. Natomiast dla par, kt&oacute;re mają problemy zdrowia prokreacyjnego,&nbsp;system modelu Creighton daje więcej danych - dzięki większej ilości biowskaźnik&oacute;w, kt&oacute;re&nbsp;określają r&oacute;żne czynniki mające wpływ na płodność.&nbsp;<strong>Wstępna analiza cykli odbywa się&nbsp;zazwyczaj po ok. 3 cyklach obserwacji.</strong>&nbsp;Stosując tylko samą obserwację modelu Creighton,&nbsp;można pom&oacute;c ok. 20 proc. par<sup>4</sup>.</p>\r\n<p>Więcej informacji nt. Modelu Creighton można uzyskać na stronie:&nbsp;<a href="http://www.creightonmodelsystem.pl">www.creightonmodelsystem.pl</a>.</p>\r\n<p><img src="/useruploads/images/galeria/model-creightona.jpg" alt="" width="680" height="624" align="middle" /></p>\r\n<p><img src="/useruploads/images/galeria/model-creightona2.jpg" alt="" width="491" height="468" align="middle" /></p>\r\n<p>&nbsp;</p>', 'pl', 'model-creighton'),
(11, 'Biomarker (NaPro TRACK)', '<p class="Standard">Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną The Creighton Model Fertility Care System (CrMS), stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>\r\n<p class="Standard">Systematyczne prowadzenie obserwacji za pomocą karty z naklejanymi piktogramami sprawia, że konsultant może uprawdopodobnić rozpoznanie schorzenia często bez poszukiwania &bdquo;na ślepo&rdquo; istoty schorzenia dającego jako objaw niepłodność małżeńską (obniżony potencjał płodności małżeńskiej). By zapisy na Karcie były diagnostyczne dla konsultanta, należy przestrzegać zasad prowadzenia obserwacji o kt&oacute;rych Małżonkowie są uczeni podczas sesji z Instruktorem.</p>\r\n<p class="Standard">Przez poznanie biomarker&oacute;w płodności (NaPro TRACK) łatwiejszym staje się diagnostyka jak r&oacute;wnież terapia:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li>endometriozy</li>\r\n<li>zespołu policystycznych jajnik&oacute;w (PCOS)</li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n</ul>', 'pl', 'biomarker-napro-track'),
(12, 'Badania Lekarza Rodzinnego', '<p><b>1. Badania hematologiczne:<br /> </b>1) morfologia krwi obwodowej z&nbsp;płytkami krwi; <br /> 2) morfologia krwi obwodowej z&nbsp;wzorem odsetkowym i&nbsp;płytkami krwi; <br /> 3) retikulocyty; <br /> 4) odczyn opadania krwinek czerwonych (OB);</p>\r\n<p><b>2. Badania biochemiczne i&nbsp;immunochemiczne w&nbsp;surowicy krwi: <br /> </b>1) s&oacute;d;<br /> 2) potas;<br /> 3) wapń zjonizowany;<br /> 4) żelazo; <br /> 5) żelazo &ndash; całkowita zdolność wiązania (TIBC) <br /> 6) stężenie transferyny; <br /> 7) stężenie hemoglobiny glikowanej (HbA1c) <br /> 8) mocznik; <br /> 9) kreatynina; <br /> 10) glukoza; <br /> 11) test obciążenia glukozą; <br /> 12) białko całkowite; <br /> 13) proteinogram; <br /> 14) albumina; <br /> 15) białko C-reaktywne (CRP); <br /> 16) kwas moczowy; <br /> 17) cholesterol całkowity; <br /> 18) cholesterol-HDL; <br /> 19) cholesterol-LDL; <br /> 20) triglicerydy (TG); <br /> 21) bilirubina całkowita; <br /> 22) bilirubina bezpośrednia; <br /> 23) fosfataza alkaliczna (ALP); <br /> 24) aminotransferaza asparaginianowa (AST); <br /> 25) aminotransferaza alaninowa (ALT); <br /> 26) gammaglutamylotranspeptydaza (GGTP); <br /> 27) amylaza; <br /> 28) kinaza kreatynowa (CK); <br /> 29) fosfataza kwaśna całkowita (ACP); <br /> 30) czynnik reumatoidalny (RF); <br /> 31) miano antystreptolizyn O&nbsp;(ASO); <br /> 32) hormon tyreotropowy (TSH); <br /> 33) antygen HBs-AgHBs; <br /> 34) VDRL. <br /> 35) FT3 <br /> 36) FT4<br /> 37) Antygen swoisty dla stercza całkowity</p>\r\n<p>&nbsp;</p>\r\n<p><b>3. Badania moczu: <br /> </b>1) og&oacute;lne badanie moczu z&nbsp;oceną właściwości fizycznych, chemicznych oraz oceną mikroskopową osadu; <br /> 2) ilościowe oznaczanie białka; <br /> 3) ilościowe oznaczanie glukozy; <br /> 4) ilościowe oznaczanie wapnia; <br /> 5) ilościowe oznaczanie amylazy.</p>\r\n<p><b>4. Badania kału: <br /> </b>1) badanie og&oacute;lne; <br /> 2) pasożyty; <br /> 3) krew utajona &ndash; metodą immunochemiczną.</p>\r\n<p><b>5. Badania układu krzepnięcia: <br /> </b>1) wskaźnik protrombinowy (INR); <br /> 2) czas kaolinowo-kefalinowy (APTT); <br /> 3) fibrynogen.</p>\r\n<p><b>6. Badania mikrobiologiczne: <br /> </b>1) posiew moczu z&nbsp;antybiogramem; <br /> 2) posiew wymazu z&nbsp;gardła z&nbsp;anbybiogramem; <br /> 3) og&oacute;lny posiew kału w&nbsp;kierunku pałeczek Salmonella, Shigella.</p>\r\n<p><b>7. Badanie elektrokardiograficzne (EKG) w&nbsp;spoczynku. </b></p>\r\n<p><b>8. Diagnostyka ultrasonograficzna: </b><b><br /> </b>1) 88.713 - USG tarczycy i&nbsp;przytarczyc; <br /> 2) 88.717 - USG ślinianek<br /> 3) 88.752 - USG nerek, moczowod&oacute;w i&nbsp;pęcherza moczowego; <br /> 4) 88.761 - USG brzucha i&nbsp;przestrzeni zaotrzewnowej, w&nbsp;tym wstępnej oceny gruczołu krokowego; <br /> 5) 88.790 - USG obwodowych węzł&oacute;w chłonnych</p>\r\n<p><b>9. Spirometria</b><b> </b></p>\r\n<p><b>10. Zdjęcia radiologiczne: <br /> </b>1) zdjęcie klatki piersiowej w&nbsp;projekcji AP i&nbsp;bocznej; <br /> 2) zdjęcia kostne &ndash; w&nbsp;przypadku kręgosłupa; kończyn i&nbsp;miednicy w&nbsp;projekcji AP i&nbsp;bocznej; <br /> 3) zdjęcie czaszki; <br /> 4) zdjęcie zatok; <br /> 5) zdjęcie przeglądowe jamy brzusznej.</p>\r\n<p><b>11. Lekarz POZ może wystawić skierowanie na badania endoskopowe<br /> </b>1) gastroskopia; <br /> 2) kolonoskopia.</p>', 'pl', 'badania-lekarza-rodzinnego'),
(13, 'Medycyna niegodziwa etycznie', '<p class="Standard">Będąc Pacjentem lekarza NaPro Technologa zgadzasz się, że lekarz nie zaproponuje Wam metody, kt&oacute;ra jest niegodziwa etycznie czy wręcz szkodliwa dla zdrowia, choćby opracowania Towarzystw Naukowych zalecały takie postępowanie w danym przypadku. Dotyczy to w szczeg&oacute;lności:</p>\r\n<ul>\r\n<li>antykoncepcji</li>\r\n<li>aborcji</li>\r\n<li>prenatalnej diagnostyki eugenicznej</li>\r\n<li>poradnictwa eugenicznego</li>\r\n<li>zapłodnienia pozaustrojowego</li>\r\n<li>mikromanipulacji na gametach (ICSI, korekta chor&oacute;b mitochondrialnych z tworzeniem hybrydowego oocytu)</li>\r\n<li>transferu oocytu własnego &ndash; zamrożonego (FET)</li>\r\n<li>rodzicielstwa zastępczego</li>\r\n<li>donacji gamet</li>\r\n<li>inseminacji domacicznych</li>\r\n<li>leczenia genetycznego w stadium przedimplantacyjnym</li>\r\n<li>krioprezerwacji zarodk&oacute;w bioptat&oacute;w gonad czy gamet zar&oacute;wno podczas procedur ART jak i przed leczeniem niszczącym płodność (chemio - i radioterapia) zwanym oncofertility.</li>\r\n</ul>', 'pl', 'medycyna-niegodziwa-etycznie');
INSERT INTO `dictionary_translation` (`id`, `title`, `body`, `lang`, `slug`) VALUES
(14, 'Niepłodność męska, czynnik męski', '<p><strong>Niepłodność męska</strong> (męski czynnik niepłodności, <em>male infertility factor</em>, MIF) brak zdolności do produkcji pełnowartościowych plemnik&oacute;w (impotentia coeundi) lub niemożność odbycia stosunku płciowego (impotentia generandi). Przyjmuje się, że męski czynnik występuje u 40 % przypadk&oacute;w niepłodności małżeńskiej.&nbsp; Dodatkowo u 20 % par występuje łącznie czynnik męski i żeński. Należy podkreślić, że tylko całkowity i stały brak plemnik&oacute;w w nasieniu całkowicie przekreśla szanse mężczyzny na bycie ojcem. Do chwili obecnej nie ustalono dolnej granicy koncentracji plemnik&oacute;w w nasieniu, kt&oacute;ra wykluczyłaby mężczyznę z rozrodu. Badanie andrologiczne jest podstawą diagnostyki niepłodności męskiej.</p>\r\n<p>Na parametry nasienia wpływa bardzo wiele czynnik&oacute;w; dla potrzeb akademickich wymienić można:</p>\r\n<ul>\r\n<li>Zaburzenia genetyczne stanowiące ok. 15% przyczyn niepłodności męskiej. Najczęściej stwierdza się dodatkowy chromosom X, translokacje chromosomalne, mutację w genie CFTR czy mikrodelecje w chromosomie Y</li>\r\n<li>Wady wrodzone, często niezstąpione jądra, niedrożność przewod&oacute;w wyprowadzających CBAVD</li>\r\n<li>Żylaki powr&oacute;zka nasiennego powodują miejscowe podwyższenie temperatury w&nbsp;miejscu wydostawania się plemnik&oacute;w z&nbsp;jądra, co sprawia, że obniża się ich ruchliwość lub nawet&nbsp;giną.</li>\r\n<li>Każda choroba og&oacute;lnoustrojowa (nawet kr&oacute;tkotrwałe banalne infekcje) mają wpływ na parametry nasienia; zwykle jednak zmiany w spermiogramie obserwujemy z op&oacute;źnieniem 2 &ndash; 3 miesięcznym</li>\r\n<li>Przyczyny infekcyjne męskich narząd&oacute;w płciowych: przebyte w dzieciństwie (świnkowe wirusowe zapalenie jąder &ndash; zniszczenie jąder 25% przypadk&oacute;w) czy nabyte po rozpoczęciu życia seksualnego (zapalenie najądrzy powodowane np. przez chlamydie). Każdy stan zapalny męskich narząd&oacute;w rozrodczych może skutkować uszkodzeniem budowy i/lub funkcji plemnik&oacute;w lub spowodować zniszczenie najądrzy</li>\r\n<li>Urazy jąder, zar&oacute;wno związane z wypadkami jak i po operacjach, np. leczenia przepukliny pachwinowej, przebyty skręt jądra</li>\r\n<li>Ciężkie choroby og&oacute;lnoustrojowe: niewydolność wątroby, trzustki, nerek, układu krążenia, cukrzyca, niedokrwistość, nowotwory (zar&oacute;wno sam fakt choroby jak i następstwa leczenia przeciwnowotworowego: radio -&nbsp; i chemioterapia)</li>\r\n<li>Przyjmowane leki</li>\r\n<li>Wsteczna ejakulacja, kt&oacute;rej przyczyną są zaburzenia kurczliwości mięśni cewki moczowej, powodujące przesuwanie plemnik&oacute;w do pęcherza moczowego zamiast ujściem cewki moczowej na zewnątrz. Zaburzenia te mogą mieć charakter przejściowy lub&nbsp;trwały.</li>\r\n<li>Styl życia: nikotynizm, alkoholizm, narkomania</li>\r\n<li>Szkodliwe czynniki środowiskowe i zawodowe (przegrzanie okolic narząd&oacute;w płciowych, środki ochronny roślin, barwniki anilinowe, metale, narażenie na promieniowanie elektromagnetyczne, plastyfikatory używane w tworzywach sztucznych)</li>\r\n</ul>\r\n<p><span>Warto podkreślić fakt, że także w grupie zdrowych mężczyzn podczas oceny materiału genetycznego plemnik&oacute;w stwierdzono występowanie aberracji chromosomowych na poziomie 10 - 14 %, z czego 1 - 4 % stanowiły aneuploidie.</span></p>\r\n<p>Pomimo długiej listy nadal w 25 &ndash; 30% przypadk&oacute;w niepłodności męskiej nie udaje się ustalić przyczyny &ndash; rozpoznaje się wtedy niepłodność idiopatyczną.</p>', 'pl', 'nieplodnosc-meska-czynnik-meski'),
(15, 'Niepłodność żeńska', '<p><strong>Niepłodność żeńska</strong> może dotyczyć zar&oacute;wno procesu powstawania oocytu, możliwości odbywania stosunku płciowego, drożności dr&oacute;g rodnych, stworzenia warunk&oacute;w do kontaktu plemnik&oacute;w z oocytem, aktywnego transportu zygoty do jamy macicy jak r&oacute;wnież implantacji &ndash; zagnieżdżenia nowego życia w organizmie matki. Zdolność do utrzymania nowego życia <em>(fecundity)</em> może być wikłana przez czynniki prowadzące do <strong>poronienia</strong> <em>(abortus)</em> czy wystąpienia <strong>porodu przedwczesnego</strong> <em>(partus praematurus, Praterm Labour PTL)</em> skutkującego nawet urodzeniem niezdolnego do przeżycia dziecka. Gdy do zgonu dziecka dochodzi wewnątrzmacicznie m&oacute;wi się o <strong>wewnątrzmacicznym obumarciu</strong> odpowiednio: zarodka <em>(poronienie zatrzymane, missed abortion)</em> lub płodu <em>(mors foetus intrauterina)</em>.&nbsp; Statystyki m&oacute;wią o 40% udziale czynnika żeńskiego w niepłodności małżeńskiej, dodatkowo u 20% par występuje łącznie żeński i męski czynnik odpowiedzialny za niepłodność.</p>\r\n<p><strong>Najczęstsze przyczyny&nbsp;niepłodności&nbsp;kobiet:</strong></p>\r\n<ul>\r\n<li>Zmiany anatomiczne dr&oacute;g rodnych (wrodzone i nabyte)</li>\r\n<li>Zaburzenia jajeczkowania (najczęściej zesp&oacute;ł PCO)</li>\r\n<li>Zaburzenia hormonalne (hiperprolaktynemia, zaburzenia fazy lutealnej, choroby tarczycy, nadnerczy)</li>\r\n<li>Zaburzenia immunologiczne (auto i alloimmunologiczne)</li>\r\n<li>Endometrioza (czynnik anatomiczny, zaburzenia jajeczkowania i czynnik immunologiczny)</li>\r\n<li>Zaburzenia genetyczne</li>\r\n</ul>\r\n<p>Czynnik genetyczny może mieć wpływ zar&oacute;wno bezpośredni (sprawczy) na wystąpienie obserwowanych zaburzeń z innych grup, jak r&oacute;wnież może przyczyniać się do obniżenia potencjału płodności kobiety. Warto tu jednak dodać, że w populacji kobiet podczas oceny materiału genetycznego pobranego z oocyt&oacute;w uzyskanych przy stosowaniu protokołu przed technikami wspomaganego rozrodu (ART) stwierdzono występowanie nieprawidłowej ilości materiału z chromosom&oacute;w (aneuploidii) na poziomie aż 20%. Otwartym pozostaje pyytanie czy na ten wynik nie mają wpływu same procedury stosowane podczas hiperstymulacji jajnik&oacute;w. Wydaje się być udowodniony&nbsp;<a title="prof Stanisław Cebrat genetyk" href="http://napromed.pl/32/genetyk.html" target="_blank">szkodliwy wpływ procedur ART na występowanie zmian genetycznych u dzieci</a>&nbsp;poczętych po tych zabiegach.</p>', 'pl', 'nieplodnosc-zenska'),
(16, 'Niepłodność', '<p>Niepłodność można definiować:</p>\r\n<p align="center"><u>Ze względu na zakres niepłodności</u></p>\r\n<p><strong>Niepłodność całkowita</strong> (<em>sterilitas absoluta</em>), czyli stan w kt&oacute;rym nie ma fizycznej możliwości do zajścia czy utrzymania ciąży. Obejmuje to u kobiety stany takie jak: brak jajnik&oacute;w, jajowod&oacute;w, macicy czy pochwy, a także poważne wady tych narząd&oacute;w zar&oacute;wno o podłożu wrodzonym czy nabytym. U mężczyzny o niepłodności całkowitej m&oacute;wimy w sytuacji braku jąder (wada wrodzona czy bądź nabyta czyli kastracja)</p>\r\n<p><strong>Niepłodność względna </strong>(<em>sterilitas relativa </em>lub <em>sterilitas temporaria</em>) to stan w kt&oacute;rym istnieje pierwotna przyczyna dająca szansę na wyleczenie.</p>\r\n<p align="center"><u>Ze względu na czas wystąpienia</u></p>\r\n<p><strong>Niepłodność pierwotna</strong> <em>(sterilitas primaria) </em>to niemożność zajścia w ciążę kobiety, lub niemożność zapłodnienia przez mężczyznę, od rozpoczęcia wsp&oacute;łżycia.</p>\r\n<p><strong>Niepłodność wt&oacute;rna</strong> <em>(sterilitas secundaria)</em> to stan w kt&oacute;rym istniała potwierdzona wcześniej płodność, lecz została zahamowana. Może ona mieć podłoże chorobowe (czynnik jajowodowy, przebyte stany zapalne , zaburzenia czynnościowe i inne) lub jatrogenne, tzn. jako skutek działalności lekarskiej (obustronna kastracja, obliteracja jajowod&oacute;w, niepłodność po stosowaniu antykoncepcji i inne)</p>\r\n<p align="center"><u>Ze względu na pochodzenie</u></p>\r\n<p><strong>Niepłodność męska</strong></p>\r\n<p><strong>Niepłodność żeńska</strong></p>\r\n<p>Niemniej zar&oacute;wno płodność jak i niepłodność należy rozpatrywać w kontekście konkretnej pary małżeńskiej, czyli rozpoznawać:</p>\r\n<p><strong>Niepłodność małżeńska</strong> w klasycznej definicji&nbsp; to niemożność uzyskania ciąży po rocznym wsp&oacute;łżyciu w celu koncepcyjnym. Obecnie dotyka ona 18-20% małżeństw w Polsce.</p>\r\n<p align="center"><u>Ze względu na zakończenie diagnostyki</u></p>\r\n<p><strong>Niepłodność idiopatyczna</strong> to sytuacja w kt&oacute;rej dostępnymi metodami nie jesteśmy w stanie czy to postawić rozpoznania czy zastosować skutecznej terapii. Statystyki podają od 14 do 30% niepłodności w kt&oacute;rych medycyna nie jest w stanie pom&oacute;c żadnymi dostępnymi sposobami. W grupie niepłodności idiopatycznej z powodu braku powszechnych metod analitycznych wyr&oacute;żnia się zaburzenia układu odpornościowego: <strong>alloimmunologiczne </strong>&nbsp;kiedy kobieta wytwarza przeciwciała przeciwko plemnikom partnera, albo jest uczulona na pewne antygeny trofoblastu i reaguje zamknięciem naczyń odżywiających go, co z&nbsp;kolei powoduje obumarcie odżywianego za pomocą trofoblastu zarodka. Występują też zaburzenia <strong>autoimmunologiczne</strong>, kiedy reakcja immunologiczna skierowana jest przeciwko własnym kom&oacute;rkom własnych narząd&oacute;w co może prowadzić np. do wytworzenia przeciwciał przeciwjajnikowych i do przedwczesnej niewydolności&nbsp;jajnik&oacute;w.</p>\r\n<p><strong>Niepłodność</strong>(Sterilitas, infertilitas, infecundity) jest objawem wielu schorzeń i ich wymienienie przekracza ramy tego opracowania. Reasumując; każde ciężkie schorzenie, zwłaszcza przewlekłe obniża płodność. Istotą leczenia niepłodności jest rozpoznanie występujących schorzeń i właściwe ich leczenie by odtworzyć utraconą płodność.&nbsp;<span>Klasycznie o niepłodności m&oacute;wi się, gdy do poczęcia nie dochodzi pomimo rodbywania regularnych stosunk&oacute;w płciowych (2-3 razy w tygodniu) przez ponad 12 miesięcy bez stosowania antykoncepcji.&nbsp;<span>W ok. 80% związk&oacute;w po roku regularnego wsp&oacute;łżycia kobieta poniżej 40 lat zachodzi w ciążę.</span></span></p>', 'pl', 'nieplodnosc');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file` text COLLATE utf8_polish_ci,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `download`
--

INSERT INTO `download` (`id`, `file`, `hidden`, `created_at`, `updated_at`) VALUES
(2, '/useruploads/files//pigułka_po_-_pytania_i_odpowiedzi.pdf', 0, '2015-06-23 17:27:15', '2015-06-23 17:27:15'),
(3, '/useruploads/files//in_vitro_-_pytania_i_odpowiedzi.pdf', 0, '2015-06-23 17:28:27', '2015-06-23 17:28:27'),
(4, '/useruploads/files//nadzieja_na_dziecko_ulotka.pdf', 0, '2015-06-23 17:31:05', '2015-06-23 17:31:05'),
(5, '/useruploads/files//nadzieja_na_dziecko.jpg', 0, '2015-06-23 17:31:51', '2015-06-23 17:31:51'),
(6, '/useruploads/files//o_naprotechnologii_-_wywiad.doc', 0, '2015-06-23 17:35:29', '2015-06-23 17:35:29'),
(8, '/useruploads/files//in_vitro_kontra_naprotechnologia.pdf', 0, '2015-07-10 18:04:32', '2015-07-10 18:04:32'),
(9, '/useruploads/files//bydgoszcz_xi_2015_sesja_wprowadzająca.pdf', 0, '2015-11-02 15:31:32', '2015-11-02 15:31:32'),
(10, '/useruploads/files//gniezno_xi_2015_sesja_wprowadzająca.pdf', 0, '2015-11-02 15:32:26', '2015-11-02 15:32:26');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `download_translation`
--

CREATE TABLE IF NOT EXISTS `download_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `download_translation_sluggable_idx` (`slug`,`lang`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `download_translation`
--

INSERT INTO `download_translation` (`id`, `title`, `lang`, `slug`) VALUES
(9, 'Bydgoszcz sesja wprowadzająca naprotechnologia', 'pl', 'bydgoszcz-sesja-wprowadzajaca-naprotechnologia'),
(10, 'Gniezno sesja wprowadzająca naprotechnologia', 'pl', 'gniezno-sesja-wprowadzajaca-naprotechnologia'),
(8, 'In vitro kontra Naprotechnologia', 'pl', 'in-vitro-kontra-naprotechnologia'),
(3, 'In vitro - pytania i odpowiedzi', 'pl', 'in-vitro-pytania-i-odpowiedzi'),
(5, 'Nadzieja na dziecko - okładka', 'pl', 'nadzieja-na-dziecko-okladka'),
(4, 'Nadzieja na dziecko - ulotka ksiązki', 'pl', 'nadzieja-na-dziecko-ulotka-ksiazki'),
(6, 'O naprotechnologii - wywiad', 'pl', 'o-naprotechnologii-wywiad'),
(2, 'Pigułka po - pytania i odpowiedzi', 'pl', 'pigulka-po-pytania-i-odpowiedzi');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `faq`
--

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faq_translation`
--

CREATE TABLE IF NOT EXISTS `faq_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `faq_translation_sluggable_idx` (`slug`,`lang`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `faq_translation`
--

INSERT INTO `faq_translation` (`id`, `title`, `body`, `lang`, `slug`) VALUES
(1, 'Co to jest Płodność?', '<p>Płodność to zdolność do przekazania (powołania) życia w łączności z osobą płci przeciwnej.</p>\r\n<p>Prawdopodobieństwo koncepcji u człowieka wynosi średnio 25 - 30% w jednym cyklu, natomiast zmniejszony potencjał rozrodczy obydwojga rodzic&oacute;w zmniejsza miesięczne prawdopodobieństwo koncepcji nawet do wartości setnych procenta. Dla jednej pary może ono wynosić 50%&nbsp; a dla innej 5%. Z tego wynika, że przy prawdopodobieństwie miesięcznym 50% potrzeba dw&oacute;ch miesięcy do poczęcia dziecka, podczas gdy para z 5% prawdopodobieństwem będzie potrzebowała 20 miesięcy, by doszło do koncepcji. Płodność zawsze dotyczy pary małżonk&oacute;w i jest wypadkową składowych płodności męża i żony.</p>\r\n<p>Szacuje się, że w populacji og&oacute;lnej (zawierającej r&oacute;wnież niepłodne pary) 84% kobiet zajdzie w ciążę po 12 m-cach regularnego wsp&oacute;łżycia, po dw&oacute;ch latach 92% a po trzech 93%, bez stosowania ingerencji terapeutycznych.</p>\r\n<p>Płodność kobiet obniża się z wiekiem, lecz całkowicie i bezpowrotnie zanika, gdy kobieta wejdzie w okres menopauzy. U mężczyzn natomiast obniża się, lecz nie znika nigdy całkowicie z powodu wieku.</p>\r\n<p>Około 12% mężczyzn diagnozowanych z powodu bezdzietności wykazuje pełną niepłodność właściwie bez szans na ustalenie przyczyn i dobranie odpowiedniej terapii, większość ( ok. 75% ) stanowią mężczyźni z obniżonym potencjałem płodności.</p>', 'pl', 'co-to-jest-plodnosc'),
(2, 'Co to jest niepłodność?', '<p>Według profesora Hilgersa, niepłodność małżeńska nie jest chorobą lecz objawem r&oacute;żnych chor&oacute;b.</p>\r\n<p>Definicja upowszechniana przez autor&oacute;w takich jak: Kase i Weingold (1983), Benson (1988), Menning (1988), Hutton (1991), Kikendall (1994), Abma i in. (1997) określa mianem niepłodności</p>\r\n<p>indywidualną niezdolność kobiety do zajścia w <strong>ciążę </strong>i wydania na świat potomstwa pomimo normalnego, regularnego wsp&oacute;łżycia (trzy, cztery razy w tygodniu) ze zdrowym mężczyzną w ciągu jednego roku bez stosowania środk&oacute;w antykoncepcyjnych.</p>\r\n<p>Inni autorzy stosują ramy czasowe od 6 do 24 miesięcy.</p>', 'pl', 'co-to-jest-nieplodnosc'),
(3, 'Co to jest NaProTECHNOLOGY® (NaProTechnologia)?', '<p class="Standard">NaProTechnologia jest dziedziną medycyny prokreacyjnej, kt&oacute;rą opracował Thomas W. Hilgers z USA (natural procreative technology) człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą integralność osobową Pacjenta i <a title="Nauczanie społeczne KK - baza link&oacute;w" href="http://www.lichen.pl/pl/303/dokumenty_i_zrodla" target="_blank">nauczanie społeczne Kościoła Katolickiego</a>. Z uwagi na stosowane podejście filozoficzne, umocowania kulturowe, zasady postępowania, podejście badawcze i implikacje społeczne stanowiące o zaistnieniu paradygmatu naukowego można nazywać ją nauką, stąd rozwinięcie &ndash; logia (greckie <em>logos</em> &ndash; <em>słowo</em>). Pojęcie NaPro Technology zostało utworzone jako opozycja do Artificial Reproductive Technology (ART), kt&oacute;re tłumaczy się jako technologia sztucznej reprodukcji. Widoczne tutaj podejście T.W. Hilgersa w odr&oacute;żnieniu angielskich sł&oacute;w Reproductive i Procreative ma znaczenie ontologiczne i uwydatnia rolę człowieka w tw&oacute;rczej wsp&oacute;łpracy z Bogiem i nie degraduje jego roli do reproduktora. Z kolei zamiana sł&oacute;w Artificial na Natural określa drogę i kierunek działań lekarza uwzględniającego w swym postępowaniu godność osobistą każdego człowieka (tutaj jako pacjenta).</p>\r\n<p class="Standard">Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną The Creighton Model Fertility Care System (CrMS), stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>\r\n<p class="Standard">Przez poznanie biomarker&oacute;w płodności (NaPro TRACK) łatwiejszym staje się diagnostyka jak r&oacute;wnież terapia:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li>endometriozy</li>\r\n<li>zespołu policystycznych jajnik&oacute;w (PCOS)</li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n</ul>\r\n<p>CrMS jest naukowo przebadany, dokładny, precyzyjny i skuteczny, wsp&oacute;łpracuje z płodnością, szanuje godność kobiety i integralność małżeństwa.</p>', 'pl', 'co-to-jest-naprotechnology-naprotechnologia'),
(4, 'Jakie są szanse na poczęcie dziecka przy stosowaniu procedur NaProTECHNOLOGY?', '<p>W dostępnej literaturze skumulowane wskaźniki ciąż po leczeniu NaProTECHNOLOGY<sup>&reg;</sup> z powodu niepłodności uzyskano w</p>\r\n<p>do 12 miesięcy - uzyskano 44% ciąż,<br />do 24 miesięcy uzyskano 62% ciąż,<br />w 48 miesięcy od rozpoczęcia leczenia 71%.</p>\r\n<p>Wyniki leczenia kiedy rozpoznaną przyczyną niepłodności była endometrioza:</p>\r\n<p>45% do 12 miesięcy,<br />65% do 24 miesięcy,<br />78% do 36 miesięcy.</p>\r\n<p>Skumulowany wskaźnik ciąż dla pacjentek z rozpoznaniem: zesp&oacute;ł policystycznych jajnik&oacute;w (PCO):</p>\r\n<p>40% po 12 miesiącach<br />65% po 24 miesiącach<br />do 90% po 48 miesiącach</p>\r\n<p>NaProTECHNOLOGY<sup>&reg;</sup> okazuje się 2,67 razy bardziej skuteczna niż in vitro dla endometriozy, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w. W badaniu z Irlandii, w latach 1998-2002 zgłosiło się 1239 par małżeńskich z powodu niepłodności. Średni wiek kobiet to 35,8 lat, średnia długość trwania niepłodności 5,6 roku. 33% par wcześniej było leczonych ART. Wskaźnik ciąż <b>NaProTECHNOLOGY</b> wyni&oacute;sł 52%. Udało się pom&oacute;c około 30% par po niepowodzeniach ART, czyli technik wspomaganego rozrodu &bdquo;in vitro&rdquo;.(J Am Board Fam Med 2008;21:375&ndash;384.)</p>\r\n<p>Szczeg&oacute;łowe badania nad skutecznością metody w przypadkach problem&oacute;w z płodnością dostępne są na stronie: <a href="http://naprotechnology.com/infertility.htm" target="_blank">http://naprotechnology.com/infertility.htm</a></p>\r\n<p>Wyniki leczenia niepłodności metodą NaProTECHNOLOGY<sup>&reg;</sup> opublikowane zostały w 2004 roku przez prof. Thomasa Hilgersa w <i>The Medical and Surgical Practice of NaProTECHNOLOGY</i> oraz w 2008 roku w publikacji Josepha B. Stanforda, MD,MSPH, Tracey A.Parnella, MD and Phila C. Boyle, MB w czasopiśmie medycznym "Journal of the American Board of Family Medicine: Outcomes From Treatment of Infertility With Natural Procreative Technology in an Irish General Practice".</p>', 'pl', 'jakie-sa-szanse-na-poczecie-dziecka-przy-stosowaniu-procedur-naprotechnology'),
(5, 'Na czym polega leczenie w protokole NaProTECHNOLOGY?', '<p>Na stworzeniu optymalnych warunk&oacute;w do naturalnego poczęcia i utrzymania ciąży. W tym celu <a title="dr Piotr Broda ginekolog androlog naprotechnolog" href="http://napromed.pl/3/o-mnie.html" target="_blank">lekarz konsultant</a> dogłębnie analizuje sytuację zdrowotną pary, stawia rozpoznania istniejących schorzeń i nieprawidłowości, zaleca leczenie i dąży do przywr&oacute;cenia pełni płodności. Aby było to możliwe, konsultant musi mieć aktualną, obiektywną wiedzę na temat sytuacji endokrynologicznej kobiety i w tym celu wsp&oacute;łpracuje z Instruktorem metody The Creighton Model FertilityCare System, kt&oacute;ra daje niezastąpiony wgląd w cykl Kobiety poprzez szereg biomarker&oacute;w, określanych jako NaProTRACK.</p>\r\n<p>Początek terapii to nauka metody pod okiem certyfikowanego Instruktora, kt&oacute;ry po osiągnięciu wystarczających umiejętności prowadzenia obserwacji przez Parę kieruje do Konsultanta na pogłębioną diagnostykę i leczenie. Nauka zaczyna się od zapoznania się z metodą na tzw sesjach <a title="Sesja wprowadzająca naprotechnologia" href="http://naprovita.cal.pl/sesja-wprowadzajaca/" target="_blank">wprowadzających</a>. Sesje są prowadzone w następujących miastach: Poznaniu, <a title="Bydgoszcz naprotechnologia sesja wprowadzająca" href="/useruploads/files/bydgoszcz_xi_2015_sesja_wprowadzająca.pdf" target="_blank">Bydgoszczy</a>, <a title="Gniezno naprotechnologia sesja wprowadzająca" href="/useruploads/files/gniezno_xi_2015_sesja_wprowadzająca.pdf" target="_blank">Gnieźnie</a> oraz w <a title="Sesje wprowadzające w Licheniu" href="http://www.lichen.pl/pl/280/model_creighton" target="_blank">Licheniu Starym</a>. Po zakończeniu nauki metody obserwacji Instruktor przesyła Parę do Konsultanta. Cały program terapeutyczny zamyka się w 18-24 miesiącach. Niekt&oacute;re ośrodki przedłużają ten okres i obserwują wzrost skumulowanych wskaźnik&oacute;w ciąż po 48 miesiącach terapii. Jeśli jednak nie dochodzi do poczęcia a zrobiono wszystko, co było możliwe proponuje się parze małżeńskiej procedurę adopcyjną jako propozycję realizacji powołania rodzicielskiego.</p>\r\n<p><a title="dr Piotr Broda ginekolog androlog naprotechnolog" href="http://napromed.pl/3/o-mnie.html">Lekarz Konsultant NaProTECHNOLOGY</a> nie zaproponuje nigdy parze metody, kt&oacute;ra jest niegodziwa etycznie czy wręcz szkodliwa dla zdrowia, choćby opracowania Towarzystw Naukowych zalecały takie postępowanie w Twoim przypadku. Dotyczy to w szczeg&oacute;lności:</p>\r\n<ul>\r\n<li>antykoncepcji</li>\r\n<li>aborcji</li>\r\n<li>prenatalnej diagnostyki eugenicznej</li>\r\n<li>zapłodnienia pozaustrojowego</li>\r\n<li>mikromanipulacji na gametach (ICSI, korekta chor&oacute;b mitochondrialnych z tworzeniem hybrydowego oocytu)</li>\r\n<li>transferu oocytu własnego &ndash; zamrożonego (FET)</li>\r\n<li>rodzicielstwa zastępczego</li>\r\n<li>donacji gamet</li>\r\n<li>inseminacji domacicznych</li>\r\n<li>leczenia genetycznego w stadium przedimplantacyjnym</li>\r\n<li>krioprezerwacji zarodk&oacute;w czy gamet zar&oacute;wno podczas procedur ART jak i przed leczeniem niszczącym płodność (chemio - i radioterapia) zwanym oncofertility.</li>\r\n</ul>', 'pl', 'na-czym-polega-leczenie-w-protokole-naprotechnology'),
(6, 'Czy muszę uczyć się obserwacji cyklu?', '<p>Podstawą diagnostyki i leczenia jest obserwacja biomarker&oacute;w Creighton Model System (CrMS).</p>\r\n<p>Gromadzenie informacji na karcie służy nie tylko postawieniu diagnozy poprzez analizę biomarker&oacute;w (NaProTRACK), ale pozwala na precyzyjne i powtarzalne stawianie zaleceń, ujednolica przekaz informacji na poziomie Lekarz &ndash; Pacjent jak r&oacute;wnież umożliwia konsultacje pomiędzy Lekarzami. Poza tym standaryzacja opis&oacute;w i zapis&oacute;w w karcie obserwacji powoduje, że pacjentki na całym świecie są w ten sam spos&oacute;b uczone metody. Wstępna diagnostyka trwa od 3 do 5 miesięcy. Para dokonuje obserwacji pod opieką instruktora metody.</p>\r\n<p>Następnie małżeństwo trafia do lekarza i wchodzi w drugi etap, polegający na rozpoznaniu przyczyny i postawieniu rozpoznania. Wśr&oacute;d zlecanych badań najczęściej ocenia się poziomy hormon&oacute;w, badania biochemiczne i mikrobiologiczne oraz wykonuje się badanie USG. Diagnozuje się także mężczyznę w kierunku czynnika męskiego niepłodności. Ustalenie diagnozy może trwać r&oacute;żnie długo, ale jest ono konieczne przed wprowadzeniem Pary na kolejny, trzeci etap &ndash; terapię.</p>\r\n<p>Ten etap, czyli&nbsp; program terapeutyczny zamyka się w 18-24 miesiącach. Jeśli jednak nie dochodzi do poczęcia a zrobiono wszystko, co było możliwe proponuje się parze małżeńskiej procedurę adopcyjną jako propozycję realizacji powołania rodzicielskiego. Należy podkreślić, że <a title="dr Piotr Broda ginekolog androlog naprotechnolog" href="http://napromed.pl/3/o-mnie.html">Lekarz &ndash; Konsultant NaPro</a> nie zaproponuje Parze metody niegodziwej etycznie czy wręcz szkodliwej dla zdrowia, choćby opracowania Towarzystw Naukowych zalecały takie postępowanie.</p>', 'pl', 'czy-musze-uczyc-sie-obserwacji-cyklu'),
(7, 'Jak mogę przygotować się na pierwszą wizytę u Konsultanta NaProTECHNOLOGY?', '<p>Warto przynieść całą dostępną dokumentację medyczną, posegregować ją chronologicznie oddzielnie dla każdego z Małżonk&oacute;w.</p>\r\n<p class="Standard">Zanim um&oacute;wisz się na wizytę do gabinetu postaraj się wykonać (1-2 tyg wcześniej) następujące badania:</p>\r\n<ul>\r\n<li>krwi obwodowej:</li>\r\n<li>morfologia</li>\r\n<li>OB</li>\r\n<li>mocznik</li>\r\n<li>kreatynina</li>\r\n<li>kwas moczowy</li>\r\n<li>transaminaza alaninowa (AlAT)</li>\r\n<li>transaminaza asparaginianowa (AspAT)</li>\r\n<li>bilirubina całkowita</li>\r\n<li>cholesterol całkowity</li>\r\n<li>tr&oacute;jglicerydy</li>\r\n<li>glukoza na czczo</li>\r\n<li>antygen HBs</li>\r\n<li>VDRL</li>\r\n<li>badanie og&oacute;lne moczu (ze środkowego strumienia)</li>\r\n<li>tyreotropina (TSH)</li>\r\n<li>wolna tr&oacute;jjodotyronina (fT3)</li>\r\n<li>wolna tyroksyna (fT4)</li>\r\n</ul>\r\n<p class="Standard">na te badania może skierować Was Lekarz Rodzinny.</p>\r\n<p>R&oacute;wnolegle do rozpoczęcia szkolenia u Instruktora CrMS i diagnostyki u Lekarza Rodzinnego pomyśl o wizycie u Stomatologa by zawczasu wyleczyć wszystkie ogniska zapalne i wymianę posiadanych wypełnień z amalgamatem mogące mieć wpływ na Twoje zdrowie.</p>', 'pl', 'jak-moge-przygotowac-sie-na-pierwsza-wizyte-u-konsultanta-naprotechnology'),
(8, 'Czy NaProTECHNOLOGY daje większe szanse niż techniki rozrodu wspomaganego?', '<p>W dostępnej literaturze skuteczność leczenia metodą <b>NaProTECHNOLOGY</b> w por&oacute;wnaniu do postępowania in vitro przedstawiała się następująco:</p>\r\n<ul>\r\n<li>jeżeli przyczyną niepłodności był brak owulacji to uzyskano <b>81,8%</b> poczęć,</li>\r\n<li>jeżeli zesp&oacute;ł PCO to <b>62,5%</b></li>\r\n<li>jeżeli endometrioza to <b>56,7%,</b></li>\r\n<li>jeżeli niedrożność jajowod&oacute;w to <b>38,4%.</b></li>\r\n</ul>\r\n<p>Dla in vitro analogicznie wyniki z lat 1986 &ndash; 2001 <b>od 21 do 27%</b> <b>ciąż na kobietę</b>. Stosowanie w niekt&oacute;rych plac&oacute;wkach transferu do jamy macicy blastocysty (kt&oacute;re po implantacji rzadziej obumierają w jamie macicy) zwiększa w statystykach ilość ciąż na transfer (niekt&oacute;re ośrodki podają nawet 40%) ale zupełnie pomija obumieranie znacznie większej ilości zarodk&oacute;w na wcześniejszych etapach rozwoju w cieplarce, kt&oacute;re nie są podawane w statystykach. Ten manewr statystyczny często jest niedostrzegany przez nieprofesjonalist&oacute;w i często używany w celach promocji ART.</p>', 'pl', 'czy-naprotechnology-daje-wieksze-szanse-niz-techniki-rozrodu-wspomaganego'),
(9, 'Czy NaProTECHNOLOGY leczy każdy rodzaj niepłodności?', '<p>Podział niepłodności obejmuje między inny innymi następujące pojęcia:</p>\r\n<p><strong>Niepłodność całkowita</strong> (<em>sterilitas absoluta</em>), czyli stan w kt&oacute;rym nie ma fizycznej możliwości do zajścia czy utrzymania ciąży. Obejmuje to u kobiety stany takie jak: brak jajnik&oacute;w, jajowod&oacute;w, macicy czy pochwy, a także poważne wady tych narząd&oacute;w zar&oacute;wno o podłożu wrodzonym czy nabytym. U mężczyzny o niepłodności całkowitej m&oacute;wimy w sytuacji braku jąder (wada wrodzona czy bądź nabyta czyli kastracja)</p>\r\n<p><strong>Niepłodność względna</strong>(<em>sterilitas relativa </em>lub <em>sterilitas temporaria</em>) to stan w kt&oacute;rym istnieje pierwotna przyczyna niepłodności, a jej eliminacjadaje szansę na przywr&oacute;cenie płodności parze.</p>\r\n<p>Mając powyższy podział na uwadze, należy stwierdzić, że nie wszyscy mogą uzyskać płodność po zastosowanym leczeniu. Dotyczy to wszystkich obecnie stosowanych metod leczenia.</p>', 'pl', 'czy-naprotechnology-leczy-kazdy-rodzaj-nieplodnosci'),
(10, 'Czy NaPro może pomóc gdy istnieje niepłodność męska?', '<p>Naprotechnologia to naturalne podejście do zagadnień zdrowia prokreacyjnego człowieka, z definicji szuka przyczyny problemu i proponuje najwłaściwszą terapię. Nie ma tu miejsca na &bdquo;obejście bokiem&rdquo; problemu, bo podważona była by sama idea leczenia a Pacjent pozostałby nadal ze swoim problemem , otrzymując co najwyżej &bdquo;Produkt&rdquo; procedur udzielanych przez Świadczeniodawc&oacute;w. Medycyna odczłowieczona, sprowadzona do świadczeniobiorc&oacute;w i udzielających świadczenie,&nbsp; deprecjonuje wartość każdej istoty ludzkiej zaangażowanej w ten system, tak Lekarza jak i Pacjenta. To stwierdzenie ma się w spos&oacute;b szczeg&oacute;lny do procedur zapłodnienia pozaustrojowego i docytoplazmatycznego wstrzyknięcia plemnika do kom&oacute;rki jajowej (ICSI), kt&oacute;re są nadal szeroko proponowane Pacjentom z obniżonymi parametrami nasienia.</p>\r\n<p>Płodność małżeństwa zawsze musi być rozpatrywana w odniesieniu do pary. Zmniejszony potencjał rozrodczy jednego z małżonk&oacute;w może być kompensowany do pewnego stopnia zwiększeniem potencjału rozrodczego drugiego z nich. W przypadku podejrzenia, że istnieje czynnik męski (male factor infertility) należy zadbać o jak najlepsze parametry śluzu (bo w lepszym śluzie nawet mniejsza liczba plemnik&oacute;w będzie miała szansę na zapłodnienie) jak r&oacute;wnież o prawidłowy cykl owulacyjny. Poza tym wnikliwa ocena czynnik&oacute;w powodujących pogorszenie parametr&oacute;w nasienia często pozwala na zastosowanie terapii celowanej i uzyskanie nie tylko poprawy w świetle ocenianych parametr&oacute;w seminologicznych, ale co najważniejsze &ndash; ciążę, kt&oacute;ra stanowi owoc miłości małżonk&oacute;w i starań <a title="dr Piotr Broda ginekolog androlog naprotechnolog" href="http://napromed.pl/3/o-mnie.html" target="_blank">Lekarza Konsultanta NaPro</a>. Poszukiwanie istoty choroby to gł&oacute;wny cel każdego Lekarza, bo tylko takie postępowanie jest uczciwe i daje szansę na zastosowanie skutecznego leczenia.</p>\r\n<p>Trzeba też stale pamiętać, że obecnie u ok. 40 &ndash; 50 % par borykających się z niepłodnością istnieje łącznie czynnik męski i żeński niepłodności, zatem po rozpoznaniu problemu u męża nie należy zaniedbywać diagnostyki i leczenia żony, gdyż i z jej strony może istnieć dodatkowa przeszkoda, kt&oacute;ra do tej pory nie została odkryta a diagnozowanie i leczenie wyłącznie mężczyzny może nie dać spodziewanych efekt&oacute;w.</p>\r\n<p><a title="dr Piotr Broda ginekolog androlog naprotechnolog" href="http://napromed.pl/3/o-mnie.html" target="_blank">Lekarz &ndash; Konsultant NaPro</a> pomoże ustalić plan diagnostyki i zaproponuje leczenie niepłodności męskiej. Konsultacja andrologiczna jest proponowana wszystkim mężczyznom zainteresowanym własną płodnością, nawet gdy Małżonka nie leczy się u Ginekologa lub gdy Mężczyzna nie jest żonaty a interesuje się własnym zdrowiem prokreacyjnym.</p>', 'pl', 'czy-napro-moze-pomoc-gdy-istnieje-nieplodnosc-meska');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gallery_1`
--

CREATE TABLE IF NOT EXISTS `gallery_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `flag` text COLLATE utf8_polish_ci,
  `slug` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_position_sortable_idx` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `lang`
--

INSERT INTO `lang` (`id`, `name`, `flag`, `slug`, `hidden`, `position`) VALUES
(1, 'Polski', '/useruploads/images/flagi/flaga_pl.gif', 'pl', 0, 1),
(2, 'Niemiecki', '/useruploads/images/flagi/flaga_de.gif', 'de', 1, 2),
(3, 'Angielski', '/useruploads/images/flagi/flaga_en.gif', 'en', 1, 3),
(4, 'Rosyjski', '/useruploads/images/flagi/flaga_ru.jpg', 'ru', 1, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mail_data`
--

CREATE TABLE IF NOT EXISTS `mail_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `email_from` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `name_from` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `mail_data`
--

INSERT INTO `mail_data` (`id`, `type`, `email_from`, `name_from`, `phone`) VALUES
(1, 'kontakt', 'piotr_broda@napromed.pl', 'Napromed - Naprotechnologia', '+48 5359 - 62776');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mail_data_translation`
--

CREATE TABLE IF NOT EXISTS `mail_data_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `mail_data_translation`
--

INSERT INTO `mail_data_translation` (`id`, `subject`, `body`, `lang`) VALUES
(1, 'Podziękowanie za przesłanie formularza', '<table border="0">\r\n<tbody>\r\n<tr style="background-color: #000000;">\r\n<td style="color: #fff;">\r\n<h2 align="center">NAPROMED</h2>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Dziękujemy za zainteresowanie się naszą ofertą oraz wysłaniem formularza kontaktowego.</p>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Wkr&oacute;tce się z z Tobą skontaktujemy.</p>\r\n<p style="color: #000000; font-size: 12px; font-family: tahoma,arial,sans-serif; padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right;margin-top: 20px; margin-bottom: 20px; margin-left: 0; margin-right: 0;">Zesp&oacute;ł Napromed - Naprotechnologia</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `media`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=109 ;

--
-- Zrzut danych tabeli `media`
--

INSERT INTO `media` (`id`, `module`, `parent_id`, `main`, `file`, `file_min1`, `file_min2`, `file_min3`, `position`) VALUES
(104, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 17),
(105, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 18),
(106, 'article', 1, 0, '/useruploads/images/galeria/empty.jpg', '/useruploads/images/galeria/thumbs/min1_empty.jpg', '', '', 19),
(107, 'carousel_home', 1, 1, '/useruploads/images/karuzela/slide_1.jpg', '', '', '', 20),
(108, 'carousel_home', 1, 0, '/useruploads/images/karuzela/slide_2.jpg', '', '', '', 21);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `media_size`
--

CREATE TABLE IF NOT EXISTS `media_size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_cms_id` bigint(20) NOT NULL,
  `min1` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `min2` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `min3` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_cms_id_idx` (`module_cms_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `media_size`
--

INSERT INTO `media_size` (`id`, `module_cms_id`, `min1`, `min2`, `min3`) VALUES
(1, 7, '450x346', '127x101', '98x78'),
(2, 12, '', '', ''),
(3, 13, '150x80', '', ''),
(4, 18, '', '', ''),
(5, 10, '269x249', '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `media_translation`
--

CREATE TABLE IF NOT EXISTS `media_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_polish_ci DEFAULT NULL,
  `alternative` text COLLATE utf8_polish_ci,
  `link` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `media_translation`
--

INSERT INTO `media_translation` (`id`, `title`, `alternative`, `link`, `lang`) VALUES
(73, '', '', '', 'pl'),
(104, '', '', '', 'pl'),
(105, '', '', '', 'pl'),
(106, '', '', '', 'pl'),
(107, 'Naprotechnologia', '<p><span>NaProTechnologia</span> jest dziedziną medycyny prokreacyjnej człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą intergralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego.</p>', '5/naprotechnologia-podstawy-teoretyczne.html', 'pl'),
(108, 'Skuteczność <br>naprotechnologii', '<p><span>NaProTECHNOLOGY</span> okazuje się 2,67 razy bardziej skuteczna niż in vitro dla endometriozy, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w.</p>', '10/naprotechnologia-skutecznosc-metody.html', 'pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `meta_tag`
--

CREATE TABLE IF NOT EXISTS `meta_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_polish_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `meta_tag_translation`
--

CREATE TABLE IF NOT EXISTS `meta_tag_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_polish_ci NOT NULL,
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `key_words` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `module_cms`
--

CREATE TABLE IF NOT EXISTS `module_cms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `route_name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `module_group_id` bigint(20) NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_cms_position_sortable_idx` (`position`),
  KEY `module_group_id_idx` (`module_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=22 ;

--
-- Zrzut danych tabeli `module_cms`
--

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
(14, 'Ustawienia wiadomości', 'mail_data', 7, 0, NULL),
(15, 'Formularz kontaktowy', 'contact_form_1', 7, 1, NULL),
(16, 'Kontakt - Obiekty komercyjne', 'contact_form_2', 7, 1, NULL),
(17, 'Kontakt - Kontakt', 'contact_form_3', 7, 1, NULL),
(18, 'Biura', 'product_card', 1, 1, NULL),
(19, 'FAQ', 'faq', 1, 0, 14),
(20, 'Słownik', 'dictionary', 1, 0, 15),
(21, 'Do pobrania', 'download', 1, 0, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `module_group`
--

CREATE TABLE IF NOT EXISTS `module_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_group_position_sortable_idx` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=8 ;

--
-- Zrzut danych tabeli `module_group`
--

INSERT INTO `module_group` (`id`, `name`, `hidden`, `position`) VALUES
(1, 'Strony', 0, 1),
(2, 'Ustawienia', 0, 2),
(3, 'Oferta', 1, NULL),
(4, 'Użytkownicy', 0, NULL),
(5, 'Strefa wiedzy', 1, NULL),
(6, 'Media', 0, 6),
(7, 'Wiadomości', 0, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `module_group_permission`
--

CREATE TABLE IF NOT EXISTS `module_group_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_group_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_group_id_idx` (`module_group_id`),
  KEY `permission_id_idx` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=14 ;

--
-- Zrzut danych tabeli `module_group_permission`
--

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `module_permission`
--

CREATE TABLE IF NOT EXISTS `module_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_id_idx` (`permission_id`),
  KEY `module_id_idx` (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=39 ;

--
-- Zrzut danych tabeli `module_permission`
--

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
(37, 21, 2),
(38, 14, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_from` date NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `news_translation`
--

CREATE TABLE IF NOT EXISTS `news_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `sneak_peak` text COLLATE utf8_polish_ci,
  `body` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `news_translation_sluggable_idx` (`slug`,`lang`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `newsletter_address`
--

CREATE TABLE IF NOT EXISTS `newsletter_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` text COLLATE utf8_polish_ci NOT NULL,
  `hash` varchar(40) COLLATE utf8_polish_ci DEFAULT NULL,
  `confirm` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `page`
--

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
  KEY `parent_id_idx` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=34 ;

--
-- Zrzut danych tabeli `page`
--

INSERT INTO `page` (`id`, `layout`, `route_name`, `route_hash`, `parent_id`, `hidden`, `not_in_menu`, `absolute_link`, `position`) VALUES
(1, 'layoutHP', 'root', 'homepage', NULL, 0, 0, NULL, 1),
(2, 'layoutHP', 'homepage', 'home', 1, 0, 1, '', 1),
(3, 'layout', 'staticPage', 'about', 1, 0, 0, '', 2),
(4, 'layout', 'napotechnologia', 'napotech', 1, 0, 0, '', 3),
(5, 'layout', 'staticPage', 'naprotech_base', 4, 0, 0, '', 5),
(7, 'layout', 'staticPage', 'naprotech_cure', 4, 0, 0, '', 6),
(10, 'layout', 'staticPage', 'naprotech_efficacy', 4, 0, 0, '', 7),
(13, 'layout', 'staticPage', 'naprotech_couple', 4, 0, 0, '', 8),
(14, 'layout', 'naprotech_doctor', 'naprotech_doctor', 1, 0, 0, '', 9),
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
(28, 'layout', 'download', 'download', 4, 0, 0, '', 11),
(29, 'layout', 'staticPage', 'doctor_ginekolog', 14, 0, 0, '', 5),
(30, 'layout', 'staticPage', 'doctor_androlog', 14, 0, 0, '', 1),
(31, 'layout', 'staticPage', 'doctor_neonatolog', 14, 0, 0, '', 2),
(32, 'layout', 'staticPage', 'doctor_genetyk', 14, 0, 0, '', 3),
(33, 'layout', 'staticPage', 'doctor_bioetyk', 14, 0, 0, '', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `page_translation`
--

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
  UNIQUE KEY `page_translation_sluggable_idx` (`slug`,`lang`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `page_translation`
--

INSERT INTO `page_translation` (`id`, `title`, `subtitle`, `meta_title`, `meta_keywords`, `meta_description`, `template`, `lang`, `slug`) VALUES
(1, 'Home', '', 'Naprotechnologia', '', '', 'home', 'pl', 'napro'),
(2, 'Home', '', 'Naprotechnologia – skuteczność naprotechnologii – portal o leczeniu niepłodności - napromed', 'Naprotechnologia, NaPro Technologia, NaProTECHNOLOGY, medycyna prokreacyjna, napromed, wielkopolska, Poznań, leczenie niepłodności, Piotr Broda, in vitro, endometrioza, PCOS, niedrożność jajowodów', 'Naprotechnologia, portal o leczeniu niepłodności małżeńskiej, skuteczność naprotechnologii. Alternatywa dla in vitro szanująca godność osobową Pacjenta, napromed, wielkopolska, Poznań, konsultant Piotr Broda NFP MC', 'home', 'pl', 'home'),
(3, 'O mnie', '', 'Naprotechnologia Poznań – Piotr Broda - leczenie niepłodności – wielkopolska – Poznań\r\n', 'Piotr Broda, leczenie niepłodności - naprotechnologia Poznań, wielkopolska, niepłodność małżeńska, niepłodność męska, alternatywa dla in vitro, ginekologia, andrologia endokrynologia ginekologiczna', 'Piotr Broda NFP MC, lekarz specjalista ginekolog-położnik, androlog, naprotechnolog – leczenie niepłodności małżeńskiej - naprotechnologia Poznań, wielkopolska', 'about', 'pl', 'o-mnie'),
(4, 'Naprotechnologia', '', 'Naprotechnologia - Naprotechnologia - Napromed', 'naprotechnologia, leczenie niepłodności', 'NaProTechnologia jest dziedziną medycyny prokreacyjnej człowieka wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą intergralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego.', 'index', 'pl', 'naprotechnologia'),
(5, 'Podstawy teoretyczne', '', 'Naprotechnologia – leczenie niepłodności - biomarkery – NaPro track - podstawy teoretyczne\r\n', 'Naprotechnologia, podstawy teoretyczne, The Creighton Model FertilityCare System, biomarkery, NaPro TRACK, brązowe plamienia, problemy zdrowotne, leczenie czynnika męskiego, niepłodność męska, obniżenie płodności, fizjologia cyklu płciowego', 'Naprotechnologia to metoda diagnostyczo-terapeutyczna leczenia niepłodności. Alternatywa dla in vitro, szanująca godność człowieka.', 'staticPage', 'pl', 'naprotechnologia-podstawy-teoretyczne'),
(7, 'Wykorzystanie w leczeniu', '', 'Naprotechnologia - Wykorzystanie w leczeniu - potencjał rozrodczy pary', 'Naprotechnologia, niepłodność małżeńska, niepłodność męska, wykorzystanie w leczeniu, endometrioza, PCOS, nawracające poronienia, poród przedwczesny, eugeniczna diagnostyka prenatalna, in vitro, leczenie niszczące płodność, donacja gamet', 'Wykorzystanie naprotechnologii w leczeniu zaburzeń hormonalnych, niepłodności małżeńskiej, czynnika męskiego niepłodności. Co różni NaProTECHNOLOGY od in vitro, ICSI, eugenicznej diagnostyki prenatalnej, leczenia niszczącego płodność, donacji gamet', 'staticPage', 'pl', 'naprotechnologia-wykorzystanie-w-leczeniu'),
(10, 'Skuteczność metody', '', 'Naprotechnologia – leczenie niepłodności – skuteczność – ilość ciąż – wskaźnik', 'Naprotechnologia, leczenie niepłodności, skuteczność naprotechnologii, skumulowane wyniki, wskaźniki ciąż po leczeniu, ciąże po nieudanym in vitro, szansa na dziecko po nieudanym in vitro, nieskuteczne in vitro, niepowodzenia in vitro', 'NaProTECHNOLOGIA daje szanse parom po niepowodzeniu in vitro. NaPro jest bardziej skuteczna niż in vitro w przypadkach endometriozy i PCOS. Wskaźnik ciąż NaProTECHNOLOGY to 52%. Skumulowane wyniki w przedziałach czasowych w zależności od schorzenia', 'staticPage', 'pl', 'naprotechnologia-skutecznosc-metody'),
(13, 'Schemat postępowania z niepłodną parą', '', 'Naprotechnologia – postępowanie z parą - etapy leczenia – efektywne cykle – w ciąży', 'NaProTechnology, plan leczenia, etapy leczenia, efektywne cykle, Peak+7, ocena owulacji, ultrasonografia,  współżycie małżeńskie, test ciążowy, USG, nasz gabinet, wielkopolska, Poznań, ustalenie dawki progesteronu w ciąży, niski progesteron', 'Plan leczenia w NaProTECHNOLOGY, etapy i czas trwania leczenia, postępowanie w P+7, program leczenia, efektywne cykle, naprotechnologia - postępowanie w ciąży - ustalenie dawki progesteronu', 'staticPage', 'pl', 'naprotechnologia-schemat-postepowania-z-nieplodna-para'),
(14, 'Profesorowie o niepłodności', '', 'Naprotechnologia - profesorowie o naprotechnologii - Napromed', 'androlog, ginekolog, neonatolog, bioetyk, naprotechnologia, naprotechnology, leczenie niepłodności', 'Opinie naukowców o leczeniu niepłodności. zasadach postępowania z parą z użyciem naprotechnologii', 'staticPage', 'pl', 'naprotechnologia-naukowcy-o-naprotechnologi'),
(15, 'Niepłodność', '', 'Naprotechnologia - Niepłodność - Napromed', '', '', 'index', 'pl', 'nieplodnosc'),
(16, 'Męska', '', 'Diagnostyka niepłodności męskiej – czynniki – wpływ na parametry nasienia – płodność mężczyzny', 'niepłodność męska, czynnik męski, impotentia coeundi, generandi, badanie andrologiczne, genetyczne, CFTR, CBAVD, żylaki powrózka, wnętrostwo, infekcje, stan zapalny, chlamydie, bakterie w nasieniu, nikotynizm, palenie tytoniu, alkohol, narkotyki', 'Wykaz schorzeń mających wpływ na płodność męską, czynniki genetyczne, CFTR, wady wrodzone, wnętrostwo,  CBAVD, żylaki powrózka nasiennego, operacje, urazy, infekcje (bakteryjne i wirusowe), szkodliwości (leki i w środowisku pracy), wpływ używek', 'staticPage', 'pl', 'nieplodnosc-meska'),
(17, 'Żeńska', '', 'Niepłodność żeńska – wady dróg rodnych – zaburzenia owulacji – implantacja- endometrioza', 'owulacja, zapłodnienie, transport zygoty, zagnieżdżenie, implantacja, poronienie, poród przedwczesny, poronienie zatrzymane, zgon płodu, wady dróg rodnych, PCO, zaburzenia hormonalne, tarczycy, hiperprolaktynemia, immunologiczne, endometrioza', 'Kompletny podział czynników w niepłodności żeńskiej. Statystyki mówią o 40% udziale czynnika żeńskiego w niepłodności małżeńskiej, dodatkowo u 20% par występuje łącznie żeński i męski czynnik niepłodności. Rola endometriozy w niepłodności', 'staticPage', 'pl', 'nieplodnosc-zenska'),
(18, 'Przeliczniki', '', 'Naprotechnologia - Przeliczniki - Napromed', '', '', 'index', 'pl', 'naprotechnologia-przeliczniki'),
(19, 'Hormony', '', 'Naprotechnologia - Przeliczniki hormony - Napromed', '', '', 'hormon', 'pl', 'naprotechnologia-przeliczniki-hormony'),
(20, 'Indeksy hormonalne', '', 'Naprotechnologia - Przeliczniki indeksy hormonalne - Napromed', '', '', 'hormonComplex', 'pl', 'naprotechnologia-przeliczniki-indeksy-hormonalne'),
(21, 'Antropometria', '', 'Naprotechnologia - Przeliczniki antropometria - Napromed', '', '', 'antropometria', 'pl', 'naprotechnologia-przeliczniki-antropometria'),
(22, 'FAQ', '', 'Naprotechnologia - FAQ - Napromed', 'Naprotechnologia - FAQ - Napromed', 'Naprotechnologia - FAQ - Napromed', 'index', 'pl', 'naprotechnologia-faq'),
(23, 'Kontakt', '', 'Naprotechnologia - Kontakt - Napromed - Piotr Broda', '', '', 'index', 'pl', 'naprotechnologia-kontakt'),
(24, 'Niepłodność', 'Niepłodność', 'Niepłodność całkowita - Niepłodność idiopatyczna - Niepłodność małżeńska', 'niepłodność całkowita, względna, szansa na wyleczenie, niepłodność pierwotna, wtórna, czynnik jajowodowy, stany zapalne, zaburzenia czynnościowe, idiopatyczna, alloimmunologiczna, przeciwciała przeciwplemnikowe, autoimmunologiczna', 'Podział niepłodności z uwagi na zakres (całkowita, względna), czas wystąpienia (pierwotna, wtórna), czynnik sprawczy (autoimmunologiczna, alloimmunologiczna, jatrogenna), zakończenie diagnostyki (idiopatyczna). Epidemiologia niepłodności w Polsce', 'staticPage', 'pl', 'nieplodnosc-1'),
(27, 'Słownik', '', 'Naprotechnologia - Słownik - wyjaśnienie pojęć - Napromed', 'Słownik', 'Słownik', 'index', 'pl', 'slownik'),
(28, 'Do pobrania', '', 'Naprotechnologia - Do pobrania - Napromed', 'download, downloads, do pobrania, materiały prasowe', 'Naprotechnologia - Do pobrania - Napromed', 'index', 'pl', 'do-pobrania'),
(29, 'Ginekolog', '', 'Ginekolog - Profesorowie o naprotechnologi - Napromed', '', '', 'staticPage', 'pl', 'ginekolog'),
(30, 'Androlog', 'prof. Jolanta Słowikowska - Hilczer, androlog, endokrynolog, pediatra', 'Androlog - Lekarze o naprotechnologi - Napromed', 'andrologia - niepłodność - leczenie czynnika męskiego - prof. Jolanta Słowikowska - Hilczer', 'Przyczyny ograniczenia płodności mężczyzny i możliwości leczenia', 'staticPage', 'pl', 'androlog'),
(31, 'Neonatolog', 'prof. Janusz Gadzinowski neonatolog, ginekolog', 'Neonatolog - Lekarze o naprotechnologi - Napromed', 'zagrożenia związane z procedurą in vitro - wady u dzieci poczętych przez ART', 'następstwa stosowania procedur ART (in vitro) dla matki ale przede wszystkim dla poczętego dziecka. Koszty i konsekwencje społeczne chorobowości dzieci po ART', 'staticPage', 'pl', 'neonatolog'),
(32, 'Genetyk', 'prof. Stanisław Cebrat, genetyk', 'Genetyk - Lekarze o naprotechnologi - Napromed', 'wady genetyczne u potomstwa poczętego przez ART (in vitro)', 'Prawdziwe zagrożenie genetyczne dol dzieci poczętych metodami ART (in vitro). Ryzyko wad i chorób genetycznych.', 'staticPage', 'pl', 'genetyk'),
(33, 'Bioetyk', '', 'x. Piotr Kieniewicz MIC bioetyk o leczeniu niepłodności NaProTECHNOLOGIA Licheń Poznań', '', '', 'staticPage', 'pl', 'bioetyk');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_position_sortable_idx` (`position`,`category_id`),
  KEY `category_id_idx` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_card`
--

CREATE TABLE IF NOT EXISTS `product_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_card_position_sortable_idx` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_card_translation`
--

CREATE TABLE IF NOT EXISTS `product_card_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `opis_2` text COLLATE utf8_polish_ci,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `product_card_translation_sluggable_idx` (`slug`,`lang`,`nazwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_categories`
--

CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_categories_position_sortable_idx` (`position`,`parent_id`),
  KEY `parent_id_idx` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_categories_translation`
--

CREATE TABLE IF NOT EXISTS `product_categories_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `product_categories_translation_sluggable_idx` (`slug`,`lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_translation`
--

CREATE TABLE IF NOT EXISTS `product_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `info` text COLLATE utf8_polish_ci,
  `price` float(18,2) DEFAULT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `slug` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`lang`),
  UNIQUE KEY `product_translation_sluggable_idx` (`slug`,`lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sf_guard_forgot_password`
--

CREATE TABLE IF NOT EXISTS `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sf_guard_group`
--

CREATE TABLE IF NOT EXISTS `sf_guard_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `sf_guard_group`
--

INSERT INTO `sf_guard_group` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator group', '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
(2, 'user', 'User group', '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
(3, 'author', 'Grupa autorów publikacji', '2013-02-27 12:57:50', '2013-02-27 12:57:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sf_guard_group_permission`
--

CREATE TABLE IF NOT EXISTS `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `sf_guard_group_permission`
--

INSERT INTO `sf_guard_group_permission` (`group_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
(2, 2, '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
(3, 3, '2013-02-27 12:57:50', '2013-02-27 12:57:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sf_guard_permission`
--

CREATE TABLE IF NOT EXISTS `sf_guard_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `description` text COLLATE utf8_polish_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=4 ;

--
-- Zrzut danych tabeli `sf_guard_permission`
--

INSERT INTO `sf_guard_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator permission', '2012-11-14 20:33:25', '2012-11-14 20:33:25'),
(2, 'user', 'User permission', '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
(3, 'author', 'Uprawnienia autora publikacji', '2013-02-27 12:53:25', '2013-02-27 12:57:19');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sf_guard_remember_key`
--

CREATE TABLE IF NOT EXISTS `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) COLLATE utf8_polish_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `sf_guard_remember_key`
--

INSERT INTO `sf_guard_remember_key` (`id`, `user_id`, `remember_key`, `ip_address`, `created_at`, `updated_at`) VALUES
(2, 1, 'jf85rz7e0eo8848ogcgw0w8o0wkg8g4', '127.0.0.1', '2014-02-11 22:31:24', '2014-02-11 22:31:24');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sf_guard_user`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=8 ;

--
-- Zrzut danych tabeli `sf_guard_user`
--

INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'Tomasz', 'Rogalski', 'rogalski.tomaszek@gmail.com', 'admin', 'sha1', '1d494bdbba5a19a90d24ff50abb520ce', '9adad637317cc4ba87601de12b209d121be58a70', 1, 1, '2015-07-29 12:23:08', '2012-11-14 20:33:26', '2015-07-29 12:23:08'),
(3, 'Joanna', 'Rogalska', 'rogalska.joasia@gmail.com', 'asia', 'sha1', '4963b9ec301b197d994a5acbd350a844', '93ebd8811fb1b117fd228d42d497a98554e80e5a', 1, 0, '2013-05-06 12:38:36', '2013-02-27 13:34:12', '2013-05-06 12:38:36'),
(6, 'Piotr', 'Broda', 'piotr_broda@poczta.onet.pl', 'piotr', 'sha1', '7868c81f9d4f66c38bbf318da5c3b3d0', 'ab77afff5fdd72214f38fd57ec83949b2ae96fae', 1, 0, '2015-12-10 13:23:52', '2014-12-07 19:42:52', '2015-12-10 13:23:52'),
(7, 'Piotr', 'Broda (Admin)', 'piotr_broda1@poczta.onet.pl', 'piotr_admin', 'sha1', 'bfc60e2919abc301c955c89a8adfc0ab', '7c10b752b7352ca85fd45ab59b575837229165fb', 1, 1, NULL, '2015-07-29 12:26:56', '2015-07-29 12:26:56');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sf_guard_user_group`
--

CREATE TABLE IF NOT EXISTS `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `sf_guard_user_group`
--

INSERT INTO `sf_guard_user_group` (`user_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2012-11-14 20:33:26', '2012-11-14 20:33:26'),
(3, 3, '2013-02-27 13:34:12', '2013-02-27 13:34:12'),
(6, 2, '2014-12-07 19:42:52', '2014-12-07 19:42:52'),
(7, 1, '2015-07-29 12:26:56', '2015-07-29 12:26:56'),
(7, 2, '2015-07-29 12:26:56', '2015-07-29 12:26:56'),
(7, 3, '2015-07-29 12:26:56', '2015-07-29 12:26:56');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sf_guard_user_permission`
--

CREATE TABLE IF NOT EXISTS `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `sf_guard_user_permission`
--

INSERT INTO `sf_guard_user_permission` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(3, 3, '2013-02-27 13:34:12', '2013-02-27 13:34:12'),
(6, 2, '2014-12-07 19:42:52', '2014-12-07 19:42:52'),
(7, 1, '2015-07-29 12:26:56', '2015-07-29 12:26:56'),
(7, 2, '2015-07-29 12:26:56', '2015-07-29 12:26:56'),
(7, 3, '2015-07-29 12:26:56', '2015-07-29 12:26:56');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `text`
--

CREATE TABLE IF NOT EXISTS `text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(128) COLLATE utf8_polish_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=114 ;

--
-- Zrzut danych tabeli `text`
--

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
(95, 'page', 28, 0),
(96, 'page', 29, 0),
(97, 'page', 29, 0),
(98, 'page', 29, 0),
(99, 'page', 30, 0),
(100, 'page', 30, 0),
(101, 'page', 30, 0),
(102, 'page', 31, 0),
(103, 'page', 31, 0),
(104, 'page', 31, 0),
(105, 'page', 32, 0),
(106, 'page', 32, 0),
(107, 'page', 32, 0),
(108, 'page', 33, 0),
(109, 'page', 33, 0),
(110, 'page', 33, 0),
(111, 'page', 19, 0),
(112, 'page', 20, 0),
(113, 'page', 21, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `text_translation`
--

CREATE TABLE IF NOT EXISTS `text_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `context` text COLLATE utf8_polish_ci NOT NULL,
  `lang` char(2) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `text_translation`
--

INSERT INTO `text_translation` (`id`, `title`, `context`, `lang`) VALUES
(33, 'Home', '<p>Home</p>', 'pl'),
(41, 'O mnie', '<h2>dr Piotr Broda</h2>\r\n<p>Urodzony i wychowany w Poznaniu, studia medyczne ukończył z wyr&oacute;żnieniem, z drugą lokatą w Wojskowej Akademii Medycznej w Łodzi w 1999 r. lekarz specjalista w położnictwie i ginekologii.</p>', 'pl'),
(53, 'STREFA WIEDZY', '<p>Artykuły i porady</p>', 'pl'),
(54, 'Kontakt', '<p>Zapraszamy do kontaktu</p>', 'pl'),
(55, 'Jolmar Nieruchomości Sp. z o.o.', '<p>Wybierz jedną z najwygodnieszych form kontaktu dla Ciebie. Postaramy się jak najszybciej odpowiedzieć.</p>', 'pl'),
(56, 'Adres', '<p>Kamionki, ul. Waniliowa 44, 62-023 Gądki<br /> <span> NIP: 777-322-76-95, REGON: 302215422<br /> KRS: 0000432803, Nr licencji zawodowej: 17070 </span></p>', 'pl'),
(57, 'Telefon', '<p>+48 604 13 47 16</p>', 'pl'),
(58, 'Email', '<p><a title="Napisz do nas" href="mailto:jolantadecnieruchomosci@gmail.com">jolantadecnieruchomosci@gmail.com</a></p>', 'pl'),
(62, 'Podstawy teoretyczne', '<p><a href="/naprotechnologia-slownik.html#napro-technology-napro-technologia-naprotechnologia-napro-napro"><strong>NaProTechnologia</strong></a> (natural procreative technology) jest dziedziną medycyny prokreacyjnej człowieka, kt&oacute;rą opracował Thomas W. Hilgers z USA, wykorzystującą najnowsze osiągnięcia naukowe, uwzględniającą integralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego. Z uwagi na stosowane podejście filozoficzne, umocowania kulturowe, zasady postępowania, podejście badawcze i implikacje społeczne stanowiące o zaistnieniu paradygmatu naukowego można nazywać ją nauką, stąd rozwinięcie &ndash; logia (greckie <em>logos</em> &ndash; <em>słowo</em>).</p>', 'pl'),
(63, 'Druga sekcja', '<p>Pojęcie NaPro Technology zostało utworzone jako opozycja do Artificial Reproductive Technology (ART), kt&oacute;re tłumaczy się jako technologia sztucznej reprodukcji. Widoczne tutaj podejście T.W. Hilgersa w odr&oacute;żnianiu angielskich sł&oacute;w: Reproductive i Procreative ma znaczenie ontologiczne i uwydatnia rolę i godność człowieka w tw&oacute;rczej wsp&oacute;łpracy z Bogiem i nie degraduje jego roli do reproduktora. Z kolei zamiana sł&oacute;w Artificial na Natural określa drogę i kierunek działań lekarza uwzględniającego w swym postępowaniu godność osobistą każdego człowieka (tutaj jako Pacjenta).</p>', 'pl'),
(64, 'Trzecia sekcja', '<p class="Standard">Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Pawła VI w Omaha, Nebrasca (USA) nazywaną <a href="/naprotechnologia-slownik.html#model-creighton">The Creighton Model Fertility Care System (CrMS)</a>, stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>\r\n<p>Punktem wyjścia do opracowania modelu Creighton była metoda owulacyjna Billings&oacute;w, kt&oacute;ra polegała na&nbsp; obserwacjach wydzieliny śluzowej szyjki macicy oraz odczuć w&nbsp;okolicach przedsionka pochwy. Zesp&oacute;ł badaczy z Omaha pod kierownictwem T. Hilgersa przeprowadził standaryzację co do jakości jak i ilości cech płodnych śluzu oraz obserwacji i odczuć kobiety. Wieloletnie obserwacje wybranych parametr&oacute;w cyklu płciowego umożliwiły wyr&oacute;żnienie kobiet z typowymi problemami zdrowotnymi układu rozrodczego o określonych cechach zapis&oacute;w. Stało się to przyczynkiem do wyr&oacute;żnienia tzw. <a href="/naprotechnologia-slownik.html#biomarker-napro-track">biomarker&oacute;w</a> cyklu (typu i&nbsp;ilości obserwowanego śluzu, dynamiki jego zmian, długości i&nbsp;przebiegu fazy przedowulacyjnej, długości i&nbsp;stabilności fazy poowulacyjnej, długości cykli, występowania plamienia przedmenstruacyjnego, brązowe plamienie po miesiączce&nbsp;itp.).</p>\r\n<p class="Standard">Przez poznanie <a href="/naprotechnologia-slownik.html#biomarker-napro-track">biomarker&oacute;w płodności (NaPro TRACK)</a> łatwiejszym staje się diagnostyka jak r&oacute;wnież terapia schorzeń ginekologicznych:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych krwawień z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li><a href="/naprotechnologia-slownik.html#endometrioza">endometriozy</a></li>\r\n<li>zespołu policystycznych jajnik&oacute;w (<a href="/naprotechnologia-slownik.html#pco">PCOS</a>)</li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n<li>wpływu stresu na płodność.</li>\r\n</ul>\r\n<p class="Standard"><a title="dr Piotr Broda ginekolog androlog naprotechnolog" href="http://napromed.pl/3/o-mnie.html" target="_blank">Lekarz Konsultant</a>prowadzi r&oacute;wnież diagnostykę i leczenie czynnika męskiego niepłodności.</p>\r\n<p>CrMS jest naukowo przebadany, precyzyjny i skuteczny, wsp&oacute;łpracuje z płodnością, szanuje godność kobiety i integralność małżeństwa oraz jest całkowicie pozbawiony efekt&oacute;w ubocznych dla każdego z małżonk&oacute;w.</p>\r\n<p>Leczenie NaPro polega na kompleksowym wykorzystaniu najnowocześniejszych osiągnięć medycyny oraz chirurgii we wsp&oacute;łpracy z naturalnym cyklem płciowym kobiety, tak aby osiągnąć optymalną funkcjonalność bez tłumienia bądź niszczenia płodności. To także propozycja leczenia dla <a title="niepłodność męska, czynnik męski" href="/naprotechnologia-slownik.html#nieplodnosc-meska-czynnik-meski" target="_blank">mężczyzn</a>. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>W dostępnej literaturze skumulowane wskaźniki ciąż po leczeniu NaProTECHNOLOGY z powodu niepłodności uzyskano w</p>\r\n<p>do 12 miesięcy - uzyskano 44% ciąż,<br />do 24 miesięcy uzyskano 62% ciąż,<br />w 48 miesięcy od rozpoczęcia leczenia 71%.</p>\r\n<p>Naprotechnologia bazuje na perfekcyjnym poznaniu fizjologii cyklu płciowego kobiety i ocenia występujące zaburzenia korzystając z <a href="/naprotechnologia-slownik.html#biomarker-napro-track">biomarker&oacute;w </a>określanych jako <a href="/naprotechnologia-slownik.html#biomarker-napro-track">NaProTRACK</a>. Takie podejście umożliwia eliminację czynnika sprawczego powodującego obniżenie płodności (zwane także jako <a href="/naprotechnologia-slownik.html#nieplodnosc">niepłodność</a>)</p>', 'pl'),
(65, 'Wykorzystanie w leczeniu', '<p>NaProTechnologia jest dziedziną medycyny prokreacyjnej człowieka wykorzystującą w leczeniu niepłodności małżeńskiej najnowsze osiągnięcia naukowe, uwzględniającą intergralność osobową Pacjenta i nauczanie społeczne Kościoła Katolickiego.</p>', 'pl'),
(66, 'Druga sekcja', '<p>Naprotechnologia jest użyteczna w leczeniu:</p>\r\n<ul>\r\n<li>zaburzeń hormonalnych</li>\r\n<li>wpływu stresu na przebieg cyklu.</li>\r\n<li>zespołu napięcia przedmiesiączkowego</li>\r\n<li>nieprawidłowych i/lub nieregularnych krwawień z dr&oacute;g rodnych</li>\r\n<li>stałej wydzieliny śluzowej z dr&oacute;g rodnych</li>\r\n<li>nawracających torbieli jajnika</li>\r\n<li>b&oacute;lu w miednicy mniejszej</li>\r\n<li>bolesnego miesiączkowania</li>\r\n<li><a href="/naprotechnologia-slownik.html#endometrioza">endometriozy</a></li>\r\n<li><a href="/naprotechnologia-slownik.html#pco">zespołu policystycznych jajnik&oacute;w (PCOS)</a></li>\r\n<li>niepłodności małżeńskiej</li>\r\n<li>nawracających poronień (w tym poronień nawykowych)</li>\r\n<li>zapobieganiu porodom przedwczesnym</li>\r\n<li>depresji poporodowej</li>\r\n</ul>\r\n<p>Lekarz Konsultant prowadzi r&oacute;wnież diagnostykę i leczenie <a href="/naprotechnologia-slownik.html#nieplodnosc-meska-czynnik-meski">czynnika męskiego</a> niepłodności.</p>', 'pl'),
(67, 'Trzecia sekcja', '<p>Leczenie NaPro jest wielokierunkowe i wielopłaszczyznowe zorientowane na optymalizację potencjału rozrodczego pary małżeńskiej (zar&oacute;wno kobiety jak i mężczyzny). <a title="dr Piotr Broda ginekolog androlog naprotechnolog, Poznań wielkopolskie" href="/naprotechnologia-slownik.html#lekarz-konsultant-napro" target="_blank">Konsultant </a>stara się wdrożyć leczenie każdego istotnego schorzenia wykorzystując wszystkie dostępne środki medyczne uwzględniając stan kliniczny Pacjenta takie jak: suplementację niedobor&oacute;w mikroelement&oacute;w i witamin, farmakoterapię, leczenie hormonalne, poradnictwo dietetyczne jak r&oacute;wnież leczenie zabiegowe zar&oacute;wno w technikach chirurgii otwartej (klasycznej) jak i technikami endoskopowymi (hysteroskopia, laparoskopia). Każda decyzja terapeutyczna jest poprzedzona wnikliwą diagnostyką: badaniem podmiotowym i przedmiotowym, kt&oacute;re są weryfikowane zapisami na karcie obserwacji cyklu w <a title="model Creighton podstawa naprotechnologii" href="/naprotechnologia-slownik.html#model-creighton" target="_blank">modelu Creighton</a>, diagnostyką obrazową (HSG, USG), badaniami laboratoryjnymi, testami dynamicznymi i konsultacjami specjalistycznymi poza ośrodkiem. Leczenie jest zindywidualizowane i przebiega etapami usuwającymi kolejne wykryte schorzenia aż do stanu odzyskania pełnego potencjału płodności możliwego do uzyskania dla danej Pary. O kolejności diagnostyki decyduje lekarz konsultant NaPro uwzględniając sytuację każdej Pary. Poczęcie dziecka w ramach NaPro występuje w trakcie pożycia małżeńskiego. Trzeba podkreślić, że <a title="dr Piotr Broda ginekolog androlog naprotechnolog" href="http://napromed.pl/3/o-mnie.html" target="_blank">lekarz konsultant Na Pro</a> nie zaproponuje Parze metody, kt&oacute;ra jest niegodziwa etycznie czy wręcz szkodliwa dla zdrowia, choćby opracowania Towarzystw Naukowych zalecały takie postępowanie w danym przypadku. Dotyczy to w szczeg&oacute;lności:</p>\r\n<ul>\r\n<li>antykoncepcji</li>\r\n<li>aborcji</li>\r\n<li>prenatalnej diagnostyki eugenicznej</li>\r\n<li>zapłodnienia pozaustrojowego (in vitro)</li>\r\n<li>mikromanipulacji na gametach (ICSI, korekta chor&oacute;b mitochondrialnych z tworzeniem hybrydowego oocytu)</li>\r\n<li>transferu oocytu własnego &ndash; zamrożonego (frozen embryo transfer - FET)</li>\r\n<li>rodzicielstwa zastępczego</li>\r\n<li>donacji gamet</li>\r\n<li>inseminacji domacicznych (intra uterine insemination - IUI)</li>\r\n<li>leczenia genetycznego w stadium przedimplantacyjnym</li>\r\n<li>krioprezerwacji zarodk&oacute;w, bioptat&oacute;w gonad czy gamet zar&oacute;wno podczas procedur ART jak i przed leczeniem niszczącym płodność (chemio - i radioterapia) zwanym oncofertility.</li>\r\n</ul>', 'pl'),
(68, 'Skuteczność metody', '<p>Wyniki leczenia niepłodności metodą NaProTECHNOLOGY opublikowane zostały w 2004 roku przez prof. Thomasa Hilgersa w The Medical and Surgical Practice of NaProTECHNOLOGY oraz w 2008 roku w publikacji Josepha B. Stanforda, MD,MSPH, Tracey A.Parnella, MD and Phila C. Boyle, MB w czasopiśmie medycznym "Journal of the American Board of Family Medicine: Outcomes From Treatment of Infertility With Natural Procreative Technology in an Irish General Practice".</p>', 'pl'),
(69, 'Druga sekcja', '<p>Najpierw skumulowane wyniki, wskaźnik ciąż po leczeniu <b>NaProTECHNOLOGY</b> z powodu niepłodności, w przedziałach czasowych:</p>\r\n<ul>\r\n<li>do 12 miesięcy - uzyskano 44% ciąż,</li>\r\n<li>do 24 miesięcy uzyskano 62% ciąż,</li>\r\n<li>w 48 miesięcy od rozpoczęcia leczenia 71%.</li>\r\n</ul>\r\n<p>Wyniki leczenia kiedy rozpoznaną przyczyną niepłodności była endometrioza:</p>\r\n<ul>\r\n<li>45% do 12 miesięcy,</li>\r\n<li>65% do 24 miesięcy,</li>\r\n<li>78% do 36 miesięcy.</li>\r\n</ul>\r\n<p>Skumulowany wskaźnik ciąż dla pacjentek z zespołem policystycznych jajnik&oacute;w:</p>\r\n<ul>\r\n<li>40% po 12 miesiącach</li>\r\n<li>65% po 24 miesiącach</li>\r\n<li>do 90% po 48 miesiącach</li>\r\n</ul>', 'pl'),
(70, 'Trzecia sekcja', '<p>Wreszcie skuteczność leczenia metodą <strong>NaProTECHNOLOGY</strong> w por&oacute;wnaniu do postępowania in vitro. Kiedy przyczyną niepłodności był brak owulacji to uzyskano 81,8% poczęć, jeżeli policystyczne jajniki to 62,5% przy endometriozie 56,7%, przy niedrożności jajowod&oacute;w 38,4%. Dla in vitro analogicznie wyniki z lat 1986 &ndash; 2001 od 21 do 27% ciąż na kobietę.</p>\r\n<p><strong>NaProTECHNOLOGY</strong> okazuje się 2,67 razy bardziej skuteczna niż in vitro dla endometriozy, 2,36 razy dla PCOS i 1,41 razy dla niedrożności jajowod&oacute;w. W badaniu z Irlandii, w latach 1998-2002 zgłosiło się 1239 par małżeńskich z powodu niepłodności. Średni wiek kobiet to 35,8 lat, średnia długość trwania niepłodności 5,6 roku. 33% par wcześniej było leczonych ART. Wskaźnik ciąż <strong>NaProTECHNOLOGY</strong> wyni&oacute;sł 52%. Udało się pom&oacute;c około 30% par po niepowodzeniach ART, czyli technik wspomaganego rozrodu &bdquo;in vitro&rdquo; ( J Am Board Fam Med 2008;21:375&ndash;384.).</p>\r\n<p>Szczeg&oacute;łowe badania nad skutecznością metody w przypadkach problem&oacute;w z płodnością dostępne są na stronie: <a href="http://naprotechnology.com/infertility.htm" target="_blank">http://naprotechnology.com/infertility.htm</a></p>', 'pl'),
(71, 'Schemat postępowania z niepłodną parą', '<p>Diagnostyka i leczenie niepłodności małżeńskiej opiera się na wykorzystaniu obserwacji cyklu płciowego kobiety metodą opracowaną w Instytucie Papieża Pawła VI w Omaha, Nebrasca (USA) nazywaną Creighton Model Fertility Care System (CrMS), stąd pierwszym krokiem jest opanowanie umiejętności prowadzenia samodzielnie prawidłowych obserwacji przez Kobietę.</p>', 'pl'),
(72, 'Druga sekcja', '<p><strong>Plan lecczenia</strong></p>\r\n<ul>\r\n<li>Etap I Zidentyfikowanie problemu (2-5 m-cy)</li>\r\n<li>Etap II Naprawienie problemu (1-6 m-cy)</li>\r\n<li>Etap III Utrzymanie &bdquo;dobrych cykli" (1-18 m-cy)</li>\r\n</ul>\r\n<p><strong><u>Pamiętaj!</u></strong></p>\r\n<ul>\r\n<li>Kontrola poziomu hormon&oacute;w każdego miesiąca w dniu <strong>Peak +7</strong> (jeśli nie można określić dnia Peak, to w 21 dniu cyklu).</li>\r\n<li>Przynoś swoja kartę obserwacji na każdą wizytę.</li>\r\n</ul>\r\n<p><strong><u>Dobre Cykle</u></strong></p>\r\n<ul>\r\n<li>Program leczenia trwa około 12 efektywnych cykli leczenia.</li>\r\n<li>Przynoś wszystkie karty obserwacji i kompletną dokumentacje na każdą wizytę do <a title="naprotechnologia Poznań, wielkopolskie, ginekologia i andrologia" href="http://napromed.pl/kontakt.html" target="_blank">gabinetu</a>.</li>\r\n</ul>\r\n<p><strong><u>O efektywnych cyklach m&oacute;wimy gdy stwierdzamy:</u></strong></p>\r\n<p><strong>A.</strong></p>\r\n<ol>\r\n<li>Poziom hormon&oacute;w w dniu Peak+7 (lub P+6,+8,+9) jest optymalny czyli\r\n<ul>\r\n<li>Progesteron 19-32 ng/ml (60-100 nmol/l)</li>\r\n<li>Estradiol 109-218 pg/ml (400-800 pmol/1)</li>\r\n</ul>\r\n</li>\r\n<li>Zadowalający obraz śluzu szyjkowego</li>\r\n<li>Prawidłowy przebieg krwawienia miesięcznego</li>\r\n<li>Dobrą kontrolę zespołu napięcia przed miesiączkowego</li>\r\n<li>Normalny poziom &bdquo;energii"</li>\r\n<li>Prawidłowe badanie nasienia</li>\r\n</ol>\r\n<p><strong>B.</strong></p>\r\n<ol>\r\n<li>Ultrasonograficznie potwierdzenie pękania pęcherzyka Graafa (ocena owulacji)</li>\r\n<li>Potwierdzenie prawidłowej budowy anatomicznej (laparoskopia i/lub hysteroskopia)</li>\r\n</ol>\r\n<p><strong>C.</strong></p>\r\n<ol>\r\n<li>Podczas okresu płodnego częste, niewymuszone wsp&oacute;łżycie małżeńskie&nbsp; (optymalnie od początku śluzu typu P do dnia P+2)</li>\r\n<li>Świadomość podlegania stresowi i umiejętność radzenia sobie z nim (ekstremalna dieta lub wysiłek fizyczny, zaburzenia snu, b&oacute;l, choroba, praca, egzaminy, wakacje, żałoba, problemy emocjonalne).</li>\r\n</ol>', 'pl'),
(73, 'Trzecia sekcja', '<p><strong><u>Postępowanie w ciąży - dzień P + 17</u></strong></p>\r\n<p>Jeśli miesiączka nie pojawi się w dniu P+17 zr&oacute;b rano test ciążowy. (jeśli przyjmujesz zastrzyki z hCG to może skutkować fałszywie pozytywnym testem ciążowym przed dniem P+17)</p>\r\n<p>Jeśli test ciążowy jest negatywny to miesiączka pojawi się w ciągu kilku najbliższych dni.</p>\r\n<p>To może się zdarzyć na skutek:</p>\r\n<ol>\r\n<li>Źle zidentyfikowanego dnia Peak</li>\r\n<li>Podw&oacute;jnego dnia Peak</li>\r\n<li>Poziom hormon&oacute;w w dniu P+7 jest za wysoki lub za niski (na skutek leczenia).</li>\r\n</ol>\r\n<p><br /> <strong><u>JEŚLI test ciążowy jest dodatni wykonaj:</u></strong></p>\r\n<ol>\r\n<li>oznaczenie poziomu HCG, progesteronu i estradiolu we krwi - powtarzane co<br /> tydzień lub co 2 tygodnie (krew do badania powinna być pobrana przed<br /> przyjęciem leku zawierającego progesteron)</li>\r\n<li>Podawanie progesteronu w czasie ciąży może być konieczne, ustal to z<br /> lekarzem w czasie najbliższej konsultacji</li>\r\n<li>skontaktuj się z <a title="naprotechnologia Poznań, wielkopolskie, ginekologia i andrologia" href="http://napromed.pl/kontakt.html">rejestracją</a> aby ustalić termin badania USG: 3tyg po<br /> pozytywnym teście ciążowym.</li>\r\n</ol>\r\n<p>Jeśli twoja ciąża rozwija się prawidłowo to bicie serca dziecka będzie już wtedy widoczne.</p>\r\n<p>Po poczęciu potrzebna będzie zasadniczo jedna konsultacja w naszym <a title="naprotechnologia Poznań, wielkopolskie, ginekologia i andrologia" href="http://napromed.pl/kontakt.html">gabinecie</a>, następnie dawkowanie progesteronu może być ustalane z lekarzem telefonicznie/mailowo przez cały okres ciąży. Tw&oacute;j ginekolog może prowadzić ciążę, my będziemy odpowiedzialni za monitorowanie i ustalanie dawki progesteronu.</p>\r\n<p>Podawanie progesteronu zazwyczaj trwa 12-14 tygodni. Jeśli poziom progesteronu będzie niski to leczenie może trwać dłużej</p>', 'pl'),
(74, 'Lekarze o naprotechnologi', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'pl'),
(75, 'Druga sekcja', '<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>', 'pl'),
(76, 'Trzecia sekcja', '<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>\r\n<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?</p>', 'pl'),
(77, 'Niepłodność', '<p><strong>Niepłodność</strong> (Sterilitas, infertilitas, infecundity) jest objawem wielu schorzeń i ich wymienienie przekracza ramy tego opracowania. Reasumując; każde ciężkie schorzenie, zwłaszcza przewlekłe obniża płodność. Istotą leczenia niepłodności jest rozpoznanie występujących schorzeń i właściwe ich leczenie by odtworzyć utraconą płodność. Klasycznie o niepłodności m&oacute;wi się, gdy do poczęcia nie dochodzi pomimo rodbywania regularnych stosunk&oacute;w płciowych (2-3 razy w tygodniu) przez ponad 12 miesięcy bez stosowania antykoncepcji.&nbsp;<span>W ok. 80% związk&oacute;w po roku regularnego wsp&oacute;łżycia kobieta poniżej 40 lat zachodzi w ciążę.</span></p>', 'pl'),
(78, 'Druga sekcja', '<h3 align="center"><u>Ze względu na zakres niepłodności</u></h3>\r\n<p><strong>Niepłodność całkowita</strong> (<em>sterilitas absoluta</em>), czyli stan w kt&oacute;rym nie ma fizycznej możliwości do zajścia czy utrzymania ciąży. Obejmuje to u kobiety stany takie jak: brak jajnik&oacute;w, jajowod&oacute;w, macicy czy pochwy, a także poważne wady tych narząd&oacute;w zar&oacute;wno o podłożu wrodzonym czy nabytym. U mężczyzny o niepłodności całkowitej m&oacute;wimy w sytuacji braku jąder (wada wrodzona bądź nabyta czyli kastracja)</p>\r\n<p><strong>Niepłodność względna </strong>(<em>sterilitas relativa </em>lub <em>sterilitas temporaria</em>) czyli <b>niepłodność czasowa</b> określana także jako <b>subpłodność</b> to stan w kt&oacute;rym istnieje pierwotna przyczyna dająca szansę na wyleczenie.</p>\r\n<h3 align="center"><u>Ze względu na czas wystąpienia</u></h3>\r\n<p><strong>Niepłodność pierwotna</strong> <em>(sterilitas primaria) </em>to niemożność zajścia w ciążę u kobiety, lub niemożność zapłodnienia u mężczyzny, w sytuacji braku wcześniejszego potomstwa z poprzednich związk&oacute;w.</p>\r\n<p><strong>Niepłodność wt&oacute;rna</strong> <em>(sterilitas secundaria)</em> to stan w kt&oacute;rym istniała potwierdzona wcześniej płodność, lecz została zahamowana. Może ona mieć podłoże chorobowe (czynnik jajowodowy, przebyte stany zapalne, zaburzenia czynnościowe i inne) lub jatrogenne, tzn. jako skutek działalności lekarskiej (obustronna kastracja, obliteracja jajowod&oacute;w, niepłodność po stosowaniu antykoncepcji i inne).</p>', 'pl'),
(79, 'Trzecia sekcja', '<h3 align="center"><u>Ze względu na zakończenie diagnostyki</u></h3>\r\n<p><strong>Niepłodność idiopatyczna</strong> to sytuacja w kt&oacute;rej dostępnymi metodami nie jesteśmy w stanie czy to postawić rozpoznania czy zastosować skutecznej terapii. Statystyki podają od 14 do 30% niepłodności w kt&oacute;rych medycyna nie jest w stanie pom&oacute;c żadnymi dostępnymi sposobami. W grupie niepłodności idiopatycznej z powodu braku powszechnych metod analitycznych wyr&oacute;żnia się zaburzenia układu odpornościowego: <strong>alloimmunologiczne </strong>&nbsp;kiedy kobieta wytwarza przeciwciała przeciwko plemnikom partnera, albo jest uczulona na pewne antygeny trofoblastu i reaguje zamknięciem naczyń odżywiających go, co z&nbsp;kolei powoduje obumarcie odżywianego za pomocą trofoblastu zarodka. Występują też zaburzenia <strong>autoimmunologiczne</strong>, kiedy reakcja immunologiczna skierowana jest przeciwko własnym kom&oacute;rkom własnych narząd&oacute;w co może prowadzić np. do wytworzenia przeciwciał przeciwjajnikowych i do przedwczesnej niewydolności&nbsp;jajnik&oacute;w.</p>\r\n<p><strong>Niepłodność małżeńska</strong> w klasycznej definicji&nbsp; to niemożność uzyskania ciąży po rocznym wsp&oacute;łżyciu w celu koncepcyjnym. Obecnie dotyka ona 18-20% małżeństw w Polsce.</p>', 'pl'),
(80, 'Niepłodność męska', '<p><strong>Niepłodność męska</strong> (męski czynnik niepłodności, <em>male infertility factor</em>, MIF) brak zdolności do produkcji pełnowartościowych plemnik&oacute;w (impotentia generandi) lub niemożność odbycia stosunku płciowego (impotentia coeundi). Przyjmuje się, że męski czynnik występuje u 40 % przypadk&oacute;w niepłodności małżeńskiej.&nbsp; Dodatkowo u 20 % par występuje łącznie czynnik męski i żeński. Należy podkreślić, że tylko całkowity i stały brak plemnik&oacute;w w nasieniu całkowicie przekreśla szanse mężczyzny na bycie ojcem. Do chwili obecnej nie ustalono dolnej granicy koncentracji plemnik&oacute;w w nasieniu, kt&oacute;ra wykluczyłaby mężczyznę z rozrodu. <a href="/naprotechnologia-slownik.html#badanie-andrologiczne">Badanie andrologiczne</a> jest podstawą diagnostyki niepłodności męskiej.</p>', 'pl'),
(81, 'Druga sekcja', '<p>Na <a href="/naprotechnologia-slownik.html#parametry-nasienia">parametry nasienia</a> wpływa bardzo wiele czynnik&oacute;w; dla potrzeb akademickich wymienić można:</p>\r\n<ul>\r\n<li>Zaburzenia genetyczne stanowiące ok. 15% przyczyn niepłodności męskiej. Najczęściej stwierdza się dodatkowy chromosom X, translokacje chromosomalne, mutację w genie CFTR czy mikrodelecje w chromosomie Y</li>\r\n<li>Wady wrodzone, często niezstąpione jądra (wnętrostwo), niedrożność przewod&oacute;w wyprowadzających CBAVD</li>\r\n<li>Żylaki powr&oacute;zka nasiennego powodują miejscowe podwyższenie temperatury w&nbsp;miejscu wydostawania się plemnik&oacute;w z&nbsp;jądra, co sprawia, że obniża się ich ruchliwość lub nawet&nbsp;giną.</li>\r\n<li>Każda choroba og&oacute;lnoustrojowa (nawet kr&oacute;tkotrwałe banalne infekcje) mają wpływ na parametry nasienia; zwykle jednak zmiany w spermiogramie obserwujemy z op&oacute;źnieniem 2 &ndash; 3 miesięcznym</li>\r\n<li>Przyczyny infekcyjne męskich narząd&oacute;w płciowych: przebyte w dzieciństwie (świnkowe wirusowe zapalenie jąder &ndash; zniszczenie jąder 25% przypadk&oacute;w) czy nabyte po rozpoczęciu życia seksualnego (zapalenie najądrzy powodowane np. przez chlamydie). Każdy stan zapalny męskich narząd&oacute;w rozrodczych może skutkować uszkodzeniem budowy i/lub funkcji plemnik&oacute;w lub spowodować zniszczenie najądrzy</li>\r\n<li>Urazy jąder, zar&oacute;wno związane z wypadkami jak i po operacjach, np. leczenia przepukliny pachwinowej, skręt jądra</li>\r\n<li>Ciężkie choroby og&oacute;lnoustrojowe: niewydolność wątroby, trzustki, nerek, układu krążenia, cukrzyca, niedokrwistość, nowotwory (zar&oacute;wno sam fakt choroby jak i następstwa leczenia przeciwnowotworowego: radio -&nbsp; i chemioterapia)</li>\r\n<li>Przyjmowane leki</li>\r\n<li>Wsteczna ejakulacja, kt&oacute;rej przyczyną są zaburzenia kurczliwości mięśni cewki moczowej, powodujące przesuwanie plemnik&oacute;w do pęcherza moczowego zamiast ujściem cewki moczowej na zewnątrz. Zaburzenia te mogą mieć charakter przejściowy lub&nbsp;trwały.</li>\r\n<li>Styl życia: nikotynizm, alkoholizm, narkomania</li>\r\n<li>Szkodliwe czynniki środowiskowe i zawodowe (przegrzanie okolic narząd&oacute;w płciowych, środki ochronny roślin, barwniki anilinowe, metale, narażenie na promieniowanie elektromagnetyczne, plastyfikatory używane w tworzywach sztucznych)</li>\r\n</ul>\r\n<p>Warto podkreślić fakt, że także w grupie zdrowych mężczyzn podczas oceny materiału genetycznego plemnik&oacute;w stwierdzono występowanie aberracji chromosomowych na poziomie 10 - 14 %, z czego 1 - 4 % stanowiły aneuploidie.</p>\r\n<p>Pomimo długiej listy nadal w 25 &ndash; 30% przypadk&oacute;w niepłodności męskiej nie udaje się ustalić przyczyny &ndash; rozpoznaje się wtedy niepłodność idiopatyczną.</p>', 'pl'),
(82, 'Niepłodność żeńska', '<p><strong>Niepłodność żeńska</strong> tym mianem określamy zaburzenia zar&oacute;wno drożności dr&oacute;g rodnych (wady), możliwość odbywania stosunku płciowego, procesu powstawania oocytu (owulacji), stworzenia warunk&oacute;w do kontaktu plemnik&oacute;w z oocytem, aktywnego transportu zygoty do jamy macicy jak r&oacute;wnież implantacji &ndash; zagnieżdżenia nowego życia i utrzymania go w organizmie matki aż do czasu uzyskania zdolności do przeżycia po narodzinach.</p>', 'pl'),
(83, 'Druga sekcja', '<p>Zdolność do utrzymania nowego życia <em>(fecundity)</em> może być wikłana przez czynniki prowadzące do <strong>poronienia</strong> <em>(abortus)</em> czy wystąpienia <strong>porodu przedwczesnego</strong> <em>(partus praematurus, Preterm Labour, PTL)</em> skutkującego nawet urodzeniem niezdolnego do przeżycia dziecka. Gdy do zgonu dziecka dochodzi wewnątrzmacicznie m&oacute;wi się o <strong>wewnątrzmacicznym obumarciu</strong> odpowiednio: zarodka <em>(poronienie zatrzymane, missed abortion)</em> lub płodu <em>(mors foetus intrauterina)</em>.&nbsp; Statystyki m&oacute;wią o 40% udziale czynnika żeńskiego w niepłodności małżeńskiej, dodatkowo u 20% par występuje łącznie żeński i męski czynnik odpowiedzialny za niepłodność.</p>', 'pl'),
(84, 'Trzecia sekcja', '<p><strong>Najczęstsze przyczyny&nbsp;niepłodności&nbsp;kobiet:</strong></p>\r\n<ul>\r\n<li>Zmiany anatomiczne dr&oacute;g rodnych (wrodzone i nabyte)</li>\r\n<li>Zaburzenia jajeczkowania (najczęściej zesp&oacute;ł PCO)</li>\r\n<li>Zaburzenia hormonalne (hiperprolaktynemia, zaburzenia fazy lutealnej, choroby tarczycy, nadnerczy)</li>\r\n<li>Zaburzenia immunologiczne (autoi i alloimmunologiczne)</li>\r\n<li>Endometrioza (czynnik anatomiczny, zaburzenia jajeczkowania i czynnik immunologiczny: uszkadzający wpływ na gamety i embrion)</li>\r\n<li>Zaburzenia genetyczne</li>\r\n</ul>\r\n<p>Czynnik genetyczny może mieć wpływ zar&oacute;wno bezpośredni (sprawczy) na wystąpienie obserwowanych zaburzeń z innych grup, jak r&oacute;wnież może przyczyniać się do obniżenia potencjału płodności kobiety. Warto tu jednak dodać, że w populacji kobiet podczas oceny materiału genetycznego pobranego z oocyt&oacute;w uzyskanych przy stosowaniu protokołu przed technikami wspomaganego rozrodu (ART) stwierdzono występowanie nieprawidłowej ilości materiału z chromosom&oacute;w (aneuploidii) na poziomie aż 20%. Otwartym pozostaje pyytanie czy na ten wynik nie mają wpływu same procedury stosowane podczas hiperstymulacji jajnik&oacute;w. Wydaje się być udowodniony <a title="prof Stanisław Cebrat genetyk" href="http://napromed.pl/32/genetyk.html" target="_blank">szkodliwy wpływ procedur ART na występowanie zmian genetycznych u dzieci</a> poczętych po tych zabiegach. </p>', 'pl'),
(85, 'FAQ', '<p>FAQ</p>', 'pl'),
(86, 'Druga sekcja', '<p><img style="margin: 0 20px 20px 0;" title="Piotr Broda" src="/useruploads/images/o_mnie/tn_img_3093_k.jpg" alt="dr Piotr Broda" width="330" height="462" align="left" />W trakcie studi&oacute;w pod inspiracją swoich nauczycieli (p<strong>rof. H. H&uuml;bner &ndash; </strong>biolog i genetyk, <strong>prof. H. Bartel</strong> &ndash; embriolog<strong>, prof. S. Orkisz</strong> &ndash; histolog, wsp&oacute;łodkrywca translacji DNA-RNA nagrodzonej <strong>nagrodą Nobla</strong>,&nbsp; <strong>dr. D. Tosik</strong> &ndash; embriolog, histolog, <strong>prof. H. Tch&oacute;rzewski</strong> &ndash; patofizjolog i immunolog, <strong>prof. K. Zeman</strong> &ndash; immunolog, <strong>prof. Z. Baj</strong> &ndash; patofizjolog, <strong>prof. K. Zieliński</strong> &ndash; patomorfolog, <strong>prof. A. Malinowski</strong> &ndash; ginekolog, immunolog, <strong>dr W. Budźko</strong> &ndash; ginekolog, położnik) rozpoczął pracę w Studenckich kołach naukowych. W tym okresie zainteresowania ogniskowały się na indukowanych wadach wrodzonych u myszy (ocena makroskopowa i w mikroskopie świetlnym oraz elektronowym) gł&oacute;wnie rozszczepach podniebienia indukowanych bromodeoksyurydyną, zagadnieniach związanych z generowaniem reaktywnych form tlenu u ludzi, procesami genetycznym prowadzącymi do apoptozy w procesach rozwoju prenatalnego u myszy poddawanych wpływowi teratogen&oacute;w, immunologicznymi przyczynami niepłodności, gł&oacute;wnie obecnością przeciwciał blokujących we krwi kobiet z par niepłodnych, możliwościami terapeutycznymi leczenia niepłodności o podłożu immunologicznym, gł&oacute;wnie szczepieniem limfocytami partnera w reakcji MLR, przyczynami psychologicznymi w niepłodności małżeńskiej (wsp&oacute;łpraca z <strong>prof. Bielawską &ndash; Batorowicz</strong>), możliwością zastosowaniu <strong>OXYDAN-u</strong> w terapii ran poporodowych (badania kliniczne III fazy), wpływem nadwagi i otyłości na wybrane parametry ciąży, porodu i połogu i czynnikami środowiskowymi mogącymi prowadzić do uszkodzenia funkcji generatywnej jajnika u myszy &ndash; ocena wybranych parametr&oacute;w morfologicznych&nbsp; jajnik&oacute;w myszy poddawanych działaniu kofeiny; ocena w mikroskopie świetlnym i elektronowym, badania immunoenzymatyczne i metodami genetyki molekularnej. <strong>Za swoje prace nagradzany i wyr&oacute;żniany</strong> na konferencjach studenckich, zar&oacute;wno og&oacute;lnopolskich jak i międzynarodowych.</p>\r\n<p><strong>Specjalizację z położnictwa i ginekologii</strong> rozpoczął&nbsp; 2001 r. pod okiem <strong>prof. J.R. Wilczyńskiego</strong> w Instytucie Centrum Zdrowia Matki Polki w Łodzi. Z powod&oacute;w rodzinnych kontynuował specjalizację w Ginekologiczno &ndash; Położniczym Szpitalu Klinicznym w Poznaniu na ul Polnej 33, r&oacute;wnolegle zdobywając doświadczenie zawodowe w Szpitalu Powiatowym w Wałczu. W trakcie specjalizacji nawiązał wsp&oacute;łpracę naukową z <strong>prof. W. Baranowskim</strong> z CSK WIM w Warszawie, gdzie r&oacute;wnież szkolił się w technikach endoskopowych w ginekologii i w procedurach diagnostycznych i leczeniu operacyjnym w uroginekologii. Od 2006 r. zainteresowany naturalnymi metodami planowania rodziny, a w 2009 r. zetknął się z <strong>naprotechnologią</strong> jako alternatywą leczenia niepłodności wobec<strong> ART</strong> (techniki rozrodu wspomaganego).&nbsp;&nbsp; W latach 2012 &ndash; 2013 brał udział w kursie dla konsultant&oacute;w medycznych metod naturalnego planowania rodziny i szkoleniu z systemu obserwacji cyklu płciowemu kobiety <strong>modelem Creighton</strong> (the Creighton Model Fertility Care System, CrMS) oraz szkoleniu z <strong>NaPro TECHNOLOGY <sup>&trade;</sup></strong>. Prowadził wykłady na temat działania antykoncepcji dla słuchaczy Studium Rodziny przy Wydziale Teologicznym Uniwersytetu im Adama Mickiewicza w Poznaniu i dla student&oacute;w Warszawskiego Uniwersytetu Medycznego w ramach konferencji &bdquo;Ginekologia in vivo&rdquo; a także dla lekarzy podczas IX Gdańskich spotkań z etyką lekarską i spotkaniach ginekolog&oacute;w katolickich i środowisk NaPro. W swoich opracowaniach ogniskował się na wpływie antykoncepcji na parametry zdrowotne i epidemiologiczne. Zainteresowany czynnikiem męskim w niepłodności małżeńskiej.</p>\r\n<p>Członek zwykły <a title="Andrologia" href="http://www.andrologia-pta.com.pl/" target="_blank"><strong>Polskiego Towarzystwa Andrologicznego</strong></a>, <a title="Ginekologia" href="http://polskietowarzystwoginekologiczne.com.pl/" target="_blank"><strong>Polskiego Towarzystwa Ginekologicznego</strong></a>, <a title="Ginekologia Endokrynologiczna" href="http://www.pteg.pl/"><strong>Polskiego Towarzystwa Endokrynologii Ginekologicznej</strong></a>.</p>\r\n<p>Organizuje porady i leczenie z zakresu naprotechnologii, ginekologii, andrologii i endokrynologii ginekologicznej w leczeniu niepłodności małżeńskiej dla Par zainteresowanych alternatywą dla in vitro.</p>\r\n<p>Przyjmuje niepłodne pary małżeńskie w <b><a title="Gabinety naprotechnologia Poznań, wielkopolska" href="http://napromed.pl/kontakt.html" target="_parent">poradniach leczenia niepłodności małżeńskiej</a>&nbsp;</b><strong>NaProTECHNOLOGY&nbsp;<sup>&trade; </sup></strong>w zakresie ginekologii i andrologii&nbsp;w wielkopolsce (Licheń Stary) i w Poznaniu.</p>', 'pl'),
(88, 'Słownik', '<p>Słownik</p>', 'pl'),
(89, 'Dane kontaktowe', '<h2>dr Piotr Broda NFP MC</h2>\r\n<p>Informacja i rejestracja</p>', 'pl'),
(90, 'Pierwszy gabinet', '<h2>Gabinet przyjęć</h2>\r\n<p>Alvamed<br />ul. Podg&oacute;rna 9<br />61-828 Poznań</p>\r\n<p>podw&oacute;rze dawnego Szpitala im. J. Strusia, wejście "I"</p>\r\n<p><a href="http://www.naprotechnologia-poznan.pl/" target="_blank">http://www.naprotechnologia-poznan.pl/</a><a href="http://alvamed.pl/index.php/naprotechnologia"><br /></a><a href="http://alvamed.pl/index.php/naprotechnologia" target="_blank">http://alvamed.pl/index.php/naprotechnologia</a></p>\r\n<p>&nbsp;</p>\r\n<p><a title="cennik ALVAMED" href="/useruploads/files/cennik_-_alvamed_2015_12_10.pdf" target="_blank">CENNIK</a></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'pl'),
(91, 'Drugi gabinet', '<h2>Gabinet przyjęć</h2>\r\n<p>Gabinet ginekologiczny w Ośrodku Wsparcia Płodności &bdquo;NaProTechnologia&rdquo;<br />ul. Klasztorna 4<br />62-563 Licheń Stary</p>\r\n<p>Godziny przyjęć, cennik, dojazd:</p>\r\n<p><a href="http://www.lichen.pl/pl/472/godziny_przyjec" target="_blank">http://www.lichen.pl/pl/472/godziny_przyjec</a></p>\r\n<p>&nbsp;</p>\r\n<p><a title="cennik Licheń" href="/useruploads/files/cennik_-_licheń.pdf" target="_blank">CENNIK</a></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'pl'),
(92, 'Hormony', '<p>Wiele laboratori&oacute;w stosuje nie tylko inne metody analityczne podczas praparatyki materiału, ale r&oacute;wnież przedstawia wynik w innych jednostkach miary. Nieuwzględnienie tego faktu może skutkować błędami diagnostycznymi i w konsekwencji niewłaściwą terapią.</p>\r\n<p>Tutaj możesz zweryfikować swoje wyniki w r&oacute;żnych jednostkach.</p>', 'pl'),
(93, 'Indeksy hormonalne', '<p>Wsp&oacute;łczesna medycyna w diagnostyce stosuje r&oacute;żne skale i wsp&oacute;łczynniki.</p>\r\n<p>HOMA, insulinooporność, testosteron biodostępny i in.</p>\r\n<p>Twoje badanie jest wyrażone w innych jednostkach?</p>\r\n<p>Tutaj wszystko przeliczysz i uzyskasz wynik jaki możesz przekazać Pacjentowi.</p>', 'pl'),
(94, 'Antropometria', '<p>BMI, WHR, WHtR, powierzchnia oraz waga ciała: należna, beztłuszczowa i idealna, podstawowa przemiana materii, klirens kreatyniny...</p>\r\n<p>Podstaw dane a otrzymasz wynik!</p>', 'pl'),
(95, 'Do pobrania', '<p>Do pobrania</p>', 'pl'),
(96, 'Ginekolodzy', '<p>strona w budowie</p>', 'pl'),
(97, 'Druga sekcja', '<p>strona w budowie</p>', 'pl'),
(98, 'Trzecia sekcja', '<p>strona w budowie</p>', 'pl'),
(99, 'Androlodzy', '<p><img style="margin-right: 10px;" title="prof Słowikowska - Hilczer Jolanta" src="/useruploads/images/profesorowie/prof_jolanta_słowikowska_-_hilczer.png" alt="prof Jolanta Słowikowska - Hilczer androlog, endokrynolog" width="162" height="154" align="left" /></p>\r\n<p><br /><br />Prof. Jolanta Słowikowska-Hilczer</p>\r\n<p><strong><br /><br />PRZYCZYNY NIEPŁODNOŚCI U MĘŻCZYZN</strong></p>\r\n<p>Przyczyny męskiej niepłodności dzieli się na:</p>\r\n<ul>\r\n<li>Przedjądrowe</li>\r\n<li>Jądrowe</li>\r\n<li>Pozajądrowe</li>\r\n</ul>\r\n<p>Przyczyny przedjądrowe spowodowane są gł&oacute;wnie zaburzeniami regulacji hormonalnej czynności jąder. Przyczyny jądrowe to uszkodzenia struktury i czynności kanalik&oacute;w plemnikotw&oacute;rczych, a pozajądrowe wiążą się z zaburzeniami transmisji plemnik&oacute;w przez drogi wyprowadzające oraz z ich zdolnością do zapłodnienia kom&oacute;rki jajowej.</p>', 'pl');
INSERT INTO `text_translation` (`id`, `title`, `context`, `lang`) VALUES
(100, 'Druga sekcja', '<p>&nbsp;Jedna z częstszych przyczyn niepłodności jest hipogonadyzm. Jest to zaburzenie czynności hormonalnej i gameto tw&oacute;rczej gonad. Męski hipogonadyzm to zesp&oacute;ł objaw&oacute;w klinicznych spowodowanych zmniejszonym wydzielaniem lub działaniem androgen&oacute;w. Przyczyną mogą być zaburzenia czynności podwzg&oacute;rza, przysadki m&oacute;zgowej i jąder, ale coraz częściej zalicza się także niewrażliwość tkanek docelowych na androgeny. Klasycznie dzieli się hipogonadyzm na:</p>\r\n<ol>\r\n<li>Pierwotny (gonadalny, hipergonadotropowy)</li>\r\n<li>Wt&oacute;rny (podwzg&oacute;rzowo-przysadkowy, hipogonadotropowy)</li>\r\n</ol>\r\n<p>W hipogonadyzmie pierwotnym uszkodzone są gonady, a w hipogonadyzmie wt&oacute;rnym &ndash; wyższe piętro osi regulacyjnej podwzg&oacute;rze i/lub przysadka m&oacute;zgowa. W każdym przypadku stężenie testosteronu jest znacznie zmniejszone w por&oacute;wnaniu z dolną granica normy, za kt&oacute;rą zwykle przyjmuje się 12 nmol/L. Natomiast stężenia gonadotropin (folikulotropina &ndash; FSH oraz lutropina &ndash; LH) są duże w hipogonadyzmie pierwotnym (&gt; 10 mIU/mL) lub małe w hipogonadyzmie wt&oacute;rnym (&lt; 1 mIU/mL). Charakterystycznym objawem nieprawidłowego funkcjonowania kom&oacute;rek Sertoliego w kanalikach plemnikotw&oacute;rczych jest zmniejszenie stężenia inhibiny B. Brak działania testosteronu i uszkodzenie kom&oacute;rek Sertoliego zawsze prowadzi do zaburzenia spermatogenezy i braku (azoospermia) lub zmniejszonej liczby (oligozoospermia) plemnik&oacute;w w nasieniu.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Objawy hipogonadyzmu może r&oacute;wnież wywoływać zwiększone stężenie prolaktyny. Hiperprolaktynemia upośledza pulsacyjne wydzielanie gonadoliberyny (GnRH) przez podwzg&oacute;rze, a przez to wydzielanie gonadotropin przez przysadkę oraz hamuje receptory gonado tropinowe w gonadach. Przyczyną hiperprolaktynemii może być gruczolak przysadki ale u mężczyzn znacznie częściej obserwuje się tzw. hiperprolaktynemię czynnościową spowodowaną np. przewlekłym stresem.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Coraz większą uwagę zwraca się na zanieczyszczenie naturalnego środowiska substancjami chemicznymi o działaniu estrogenopodobnym, a jednocześnie &ndash; antyandrogennym. Wywołują one zaburzenie czynności hormonalnej jąder (zmniejszenie biosyntezy i działania testosteronu), a przez to &ndash; zahamowanie rozwoju męskich narząd&oacute;w płciowych, zmiany nowotworowe wywodzące się z kom&oacute;rek płciowych oraz uszkodzenie kanalik&oacute;w plemnikotw&oacute;rczych jąder, co z kolei prowadzi do obniżenia potencjału płodności.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Przyczyną zaburzenia rozwoju jąder mogą być r&oacute;wnież zaburzenia genetyczne. Najczęstszą wrodzoną przyczyną niepłodności u mężczyzn (0,2 % męskiej populacji, 3 % mężczyzn niepłodnych, 1 % mężczyzn z azoospermią), uwarunkowaną genetycznie jest zesp&oacute;ł Klinefeltera. Charakteryzuje go, opr&oacute;cz niepłodności obecnośc dodatkowego chromosomu X, hipogonadyzm hipergonadotropowy, jądra o zmniejszonej objętości (1 &ndash; 7 mL), często trudności w nauce i zaburzenia emocjonalne.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Niemały udział w zaburzeniu męskiej płodności przypisuje się czynnikom środowiskowym takim jak:</p>\r\n<ul>\r\n<li>podwyższona temperatura</li>\r\n<li>promieniowanie elektromagnetyczne</li>\r\n<li>palenie tytoniu</li>\r\n<li>nadużywanie alkoholu</li>\r\n<li>przewlekły stres</li>\r\n<li>otyłość</li>\r\n<li>siedzący tryb życia</li>\r\n</ul>\r\n<p>Konsekwencją działania większości wymienionych czynnik&oacute;w jest stres oksydacyjny, kt&oacute;ry jest spowodowany zachwianiem r&oacute;wnowagi między wytwarzaniem tzw. reaktywnych form tlenu (RFT) a działaniem ochronnego systemu antyoksydacyjnego odpowiedzialnego za ich neutralizację i usuwanie. Powoduje to zmniejszoną liczebność plemnik&oacute;w oraz zaburzenie ich czynności, zmniejszenie ruchliwości i nieprawidłową morfologię. Ocenia się, że u ok. 25 % niepłodnych mężczyzn występuje w nasieniu zwiększone stężenie RFT i często obniżenie zdolności antyoksydacyjnych nasienia.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Stany zapalne w męskim układzie moczowo &ndash; płciowym są częstą przyczyną zaburzeń płodności &ndash; nie tylko z powodu stresu oksydacyjnego uszkadzającego plemniki, ale także ze względu na powstanie niedrożności dr&oacute;g wyprowadzających wydzieliny prostaty i pęcherzyk&oacute;w nasiennych tworzących plazmę nasienia. Prawidłowy skład plazmy nasienia ma wpływ na ruchliwość i żywotność plemnik&oacute;w, ale także na ich zdolność do połączenia się z kom&oacute;rką jajową. Dodatkowo podczas infekcji bakteryjnych lub wirusowych może dojść do powstania przeciwciał przeciwplemnikowych unieruchamiających plemniki i utrudniających zapłodnienie. Najczęstszymi patogenami są drobnoustroje przenoszone drogą płciową takie jak: Escherichia coli, Enterococcus faecalis, Klebsiella spp, Proteus spp, Staphylococcus ureus, Ureaplasma spp, Chlamydia spp, Mycoplasma spp, wirusy Herpes i grzyby Candida.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jedną z bardziej kontrowersyjnych przyczyn męskiej niepłodności są żylaki powr&oacute;zk&oacute;w nasiennych. Powstają na skutek rozszerzenia żył splotu wiciowatego powr&oacute;zka. SA stwierdzane u ok. 25 % mężczyzn z zaburzonymi parametrami nasienia i u ok. 11 % mężczyzn, u kt&oacute;rych są one prawidłowe. Mogą powodować zaburzenia krążenia w obrębie jąder i lokalne podwyższenie temperatury, a przez to &ndash; zahamowanie spermatogenezy. Jednak doniesienia odnośnie do poprawy parametr&oacute;w nasienia po leczeniu żylak&oacute;w powr&oacute;zk&oacute;w nasiennych są sprzeczne.</p>\r\n<p><strong>DIAGNOSTYKA MĘSKIEJ NIEPŁODNOŚCI</strong></p>\r\n<p>Diagnostyka przyczyn niepłodności pary powinna być przeprowadzona r&oacute;wnocześnie u kobiety i mężczyzny. Rozpoczyna się ją zwykle po 12 miesiącach bezskutecznego wsp&oacute;łżycia płciowego bez stosowania metod antykoncepcyjnych. Jednakże jeśli występują dodatkowe zaburzenia obniżające płodność&nbsp; lub partnerzy mają więcej niż 30 lat, procedury diagnostyczne powinno się rozpocząć wcześniej.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dokładny wywiad i badanie przedmiotowe obowiązują w każdym przypadku podejrzenia niepłodności oraz poprzedzają podstawowe badanie nasienia, kt&oacute;re jest pierwszym badaniem laboratoryjnym u mężczyzny z niepłodnej pary. Badanie nasienia &ndash; metodą manualną lub za pomocą analizy komputerowej (CASA) &ndash; powinno być wykonane tylko w laboratorium stosującym się do zasad zalecanych przez Światową Organizację Zdrowia (WHO) w 2010 r. Należy jednak pamiętać, że pojedyncze badanie nasienia ma znaczenie przesiewowe i nie może być podstawą rozpoznania niepłodności. Trzeba je powt&oacute;rzyć co najmniej dwukrotnie w odstępie 1 &ndash; 3 miesięcy w stanie pełnego zdrowia. Z kolei prawidłowy wynik podstawowego badania nasienia nie potwierdza niezaburzonej płodności mężczyzny. Punktem odniesienia dla poszczeg&oacute;lnych parametr&oacute;w seminologicznych są <a title="parametry nasienia" href="/naprotechnologia-slownik.html#parametry-nasienia" target="_parent">wartości referencyjne WHO z 2010 r.</a></p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opr&oacute;cz podstawowego badania nasienia stosowane są także techniki badań biochemicznych i immunocytochemicznych plemnik&oacute;w oraz plazmy nasieia. Pozwalają na wykrycie przyczyn m.in. zaburzeń:</p>\r\n<ul>\r\n<li>Ruchu plemnik&oacute;w (np. test formezanowy &ndash; NADH &ndash; NBT)</li>\r\n<li>Połączenia plemnika z kom&oacute;rką jajową (np. test z kwasem hialuronowym HBA)</li>\r\n<li>Rozwoju zarodka (np. chromatyna plemnikowa &ndash; test Halosperm)</li>\r\n<li>Drożności przewod&oacute;w najądrza (stężenie &alpha;-glukozydazy obojętnej)</li>\r\n<li>Drożności przewod&oacute;w wyprowadzających pęcherzyk&oacute;w nasiennych (stężenie fruktozy)</li>\r\n<li>Drożności przewod&oacute;w wyprowadzających prostaty (stężenie kwasu cytrynowego)</li>\r\n</ul>\r\n<p>Stosowane są także nowoczesne metody wykrywania infekcji bakteryjnych, wirusowych i grzybiczych oraz stan&oacute;w zapalnych.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Badania hormonalne obejmują wykonanie w godzinach porannych (8<sup>00</sup> &ndash; 11<sup>00</sup>) oznaczeń stężenia we krwi FSH, LH, testosteronu całkowitego, inhibiny B, prolaktyny i SHBG. Prawidłowe stężenia powyższych hormon&oacute;w przy azoospermii lub dużego stopnia oligozoospermii mogą wskazywać na niedrożność dr&oacute;g wyprowadzających nasienie. Konieczna jest w&oacute;wczas dalsza diagnostyka w tym kierunku (badania biochemiczne i mikrobiologiczne nasienia, badania obrazowe układu płciowego). Obecnie uważa się, że najlepszym parametrem diagnostycznym uszkodzenia kanalik&oacute;w plemnikotw&oacute;rczych jest stwierdzenie małego stężenia inhibiny B i dużego FSH.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Wskazaniem do badań genetycznych jest azoospermia, oligozoospermia z koncentracją plemnik&oacute;w , 5mln/mL i hipogonadyzmem hiper- lub hipogonadotropowym. Genetyka molekularna umożliwia znalezienie m.in. strukturalnych zaburzeń w chromosomie Y odpowiadających za prawidłowy przebieg spermatogenezy (mutacje/delecje w regionie AZF na ramieniu długim chromosomu Y), mutacji w genie CFTR, kt&oacute;re mogą prowadzić do agenezji i niedrożności nasieniowod&oacute;w i przewod&oacute;w najądrzy, mutacji w genach receptor&oacute;w androgenowych, estrogenowych, FSH, LH i gen&oacute;w kontrolujących biosyntezę enzym&oacute;w steroidogenezy, kt&oacute;re mogą być przyczyną zaburzeń czynności dokrewnej jądra lub spermatogenezy.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Badania obrazowe męskiego układu płciowego obejmują badanie USG jąder, najądrzy, powr&oacute;zk&oacute;w nasiennych, ocenę przepływ&oacute;w w naczyniach splotu żylnego powr&oacute;zka nasiennego za pomocą ultrasonografii dopplerowskiej, przez odbytnicze badanie USG (TRUS) prostaty i pęcherzyk&oacute;w nasiennych oraz badanie radiologiczne drożności nasieniowod&oacute;w i przewod&oacute;w wytryskowych z kontrastem.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Biopsja jądra i badanie histopatologiczne wycinka jądra jest najlepszą, ale ostateczną metodą oceny struktury jądra i stanu nabłonka plemnikotw&oacute;rczego. Umożliwia r&oacute;wnież diagnostykę stanu przednowotworowego jądra. Wskazaniem do biopsji jądra jest występowanie zaburzeń takich jak:</p>\r\n<ul>\r\n<li>Azoospermia lub oligozoospermia z koncentracją plemnik&oacute;w , 5 mln/mL</li>\r\n<li>Zwiększone stężenie FSH i zmniejszone stężenie inhibiny B we krwi</li>\r\n<li>Objętość jądra &lt; 12 mL</li>\r\n<li>Mikrozwapnienia widoczne w badaniu USG jąder</li>\r\n</ul>\r\n<p>Wszystkie te działania pozwalają na eliminację kolejnych przyczyn zaburzeń płodności u mężczyzn i w wielu przypadkach umożliwiają skuteczne leczenie.</p>', 'pl'),
(101, 'Trzecia sekcja', '<p><strong>TERAPIA ZABURZEŃ PŁODNOŚCI U MĘŻCZYZN</strong></p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Leczenie nie jest możliwe w przypadku braku obu jąder lub braku kom&oacute;rek plemnikotw&oacute;rczych w tzw. zespole samych kom&oacute;rek Sertoliego. W pozostałych przypadkach istnieją możliwości poprawy albo przywr&oacute;cenia płodności metodami zachowawczymi lub chirurgicznymi oraz zapłodnienia drogą naturalną lub z wykorzystaniem ART. Terapię rozpoczyna się od zalecenia zmiany stylu życia, eliminacji szkodliwych czynnik&oacute;w środowiskowych oraz stosowania antyoksydant&oacute;w, kt&oacute;re często są wystarczające do poprawy parametr&oacute;w nasienia i uzyskania ciąży. Są też stosowane jako terapia wspomagająca i uzupełniająca leczenie przyczynowe zaburzeń płodności u mężczyzn.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jeśli stwierdzi się przyczynę zaburzeń płodności w większości przypadk&oacute;w możliwe jest jej leczenie zachowawcze, np. zaburzeń hormonalnych, lub chirurgiczne, np. żylak&oacute;w powr&oacute;zk&oacute;w nasiennych, przywracanie drożności nasieniowod&oacute;w. W przypadku niepłodności idiopatycznej podejmuje się pr&oacute;by leczenia tzw. metodami empirycznymi. Jest to stymulacja czynności hormonalnej i plemnikotw&oacute;rczej jąder cytrynianem klomifenu, preparatami gonadotropin, antyestrogenami ze słabo działającymi androgenami (tamoksifen i undecylan testosteronu). Efekt terapeutyczny jest widoczny najwcześniej po ok. 3 miesiącach leczenia zachowawczego czy chirurgicznego. Czas trwania cyklu spermatogenezy (wytwarzania plemnika od spermatogonii do form dojrzałych spermatyd) wynosi bowiem ok. 74 dni.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Czas trwania diagnostyki i leczenia zachowawczego nie powinien być dłuższy niż 12 miesięcy jeśli para decyduje się na stosowanie procedur ART. Po tym czasie należy też rozważyć inne metody budowania rodziny (np. adopcja).</p>\r\n<p align="justify">Diagnostyka i leczenie męskiej niepłodności znajdują się w kręgu zainteresowań andrologii &ndash; dziedziny nauk medycznych, kt&oacute;ra powstała na pograniczu urologii, endokrynologii i seksuologii i zajmuje się męskim układem płciowym. Dynamiczny rozw&oacute;j andrologii w ostatnich latach jest spowodowany odkryciami z zakresu patofizjologii zaburzeń płodności, opracowaniem nowatorskich metod diagnostycznych oraz skutecznych pr&oacute;b nowych terapii.</p>\r\n<p align="justify">&nbsp;</p>\r\n<p align="justify">przygotowane na podstawie:</p>\r\n<p align="justify">Forum Położnictwa i Ginekologii 2013; 13:6-11 oraz Diagnostyka niepłodności u mężczyzn Stanowisko Komitetu ds. Praktyki Klinicznej American Society for Reproductive Medicine. Medycyna Praktyczna &ndash; Ginekologia i Położnictwo 2013; 5:40-42</p>\r\n<p align="justify">&nbsp;</p>\r\n<p align="justify">Katedra Andrologii i Endokrynologii Płodności Uniwersytetu Medycznego w Łodzi <a title="Katedra Andrologii i Endokrynologii Płodności UM w Łodzi" href="http://www.andrologia-eaa.umed.lodz.pl/" target="_blank">www.andrologia-eaa.umed.lodz.pl</a></p>\r\n<p align="justify">Polskie Towarzystwo Andrologiczne <a title="Polskie Towarzystwo Andrologiczne" href="http://www.andrologia-pta.com.pl" target="_blank">www.andrologia-pta.com.pl</a></p>\r\n<p align="justify">&nbsp;</p>', 'pl'),
(102, 'Neonatolodzy', '<p><img title="prof. Janusz Gadzinowski neonatolog" src="/useruploads/images/profesorowie/prof_janusz_gadzinowski.jpg" alt="prof. Janusz Gadzinowski" width="155" height="204" />prof. dr hab. n. med. Janusz Gadzinowski</p>\r\n<p>Katedra Neonatologii Uniwersytetu Medycznego im. Karola Marcinkowskiego w Poznaniu</p>\r\n<p align="justify">Dzieci poczęte z wykorzystaniem technik rozrodu wspomaganego (assisted reproductive technologies - ART) zalicza się do grupy zwiększonego ryzyka powikłań, bo choć wiele z&nbsp;nich rodzi się zdrowych, to u części występują problemy medyczne stwierdzone w badaniach naukowych o r&oacute;żnej sile dowod&oacute;w, takie jak: zaburzenia widzenia, siatk&oacute;wczak, dychawica oskrzelowa, zesp&oacute;ł nadpobudliwości psychoruchowej z deficytem uwagi, i następstwa w wieku dorosłym w&nbsp;postaci wyższego ciśnienia tętniczego krwi, większego stężenia glukozy, zwiększonego wieku kostnego, większego stężenia lutropiny i siarczanu dehydroepiandrosteronu u&nbsp;dziewcząt. Zastosowanie ART pociąga za sobą także zwiększone ryzyko dla matki, dotyczące między innymi zespołu hiperstymulacji jajnik&oacute;w oraz powikłań ciąży, w tym szczeg&oacute;lnie ciąży wielopłodowej, kt&oacute;ra może się r&oacute;wnież wiązać z moralnym dylematem dotyczącym ewentualnej redukcji płod&oacute;w.</p>', 'pl'),
(103, 'Druga sekcja', '<p align="justify">Rzeczywista liczba wad wrodzonych u dzieci poczętych w wyniku zapłodnienia pozaustrojowego jest prawdopodobnie niedoszacowana, ponieważ nie przeprowadzono odpowiedniej analizy wad występujących u płod&oacute;w z ciąż zakończonych poronieniem i z ciąż przerwanych. Prawdziwą skalę problemu odsłoniłaby dopiero łączna ocena wad rozpoznawanych nie tylko u narodzonych dzieci, ale także w przypadkach poronień, przerwań ciąży z powodu wykrycia wad oraz redukcji płod&oacute;w. Prawidłowemu przekazywaniu danych na ten temat sprzyjałoby udzielanie ich przez niezależną instytucję publiczną, obecnie natomiast stanowi to domenę poszczeg&oacute;lnych ośrodk&oacute;w wykonujących zabiegi z&nbsp;wykorzystaniem ART. Uważam za konieczne informowanie o tych danych lekarzy, społeczeństwa, a przede wszystkim par, kt&oacute;re rozważają zastosowanie omawianych technik. Zainteresowane pary powinny wyrazić świadomą zgodę na wykonanie zabiegu. Właściwie skonstruowany formularz świadomej zgody powinien zawierać informacje o wyczerpaniu się możliwości leczenia niepłodności oraz wyszczeg&oacute;lniać alternatywne sposoby postępowania, do kt&oacute;rych należy wspomaganie prokreacji poprzez ściśle określoną sekwencję działań diagnostycznych i leczniczych. Ponieważ zabiegi z wykorzystaniem ART są finansowane przez podatnik&oacute;w, społeczeństwo powinno otrzymywać dokładne informacje pochodzące z&nbsp;polskich ośrodk&oacute;w stosujących te metody, dotyczące ich skuteczności mierzonej liczbą urodzonych o czasie zdrowych noworodk&oacute;w, a nie ciąż uzyskanych w przeliczeniu na stymulowane cykle, a także dane odnoszące się do częstości powikłań zar&oacute;wno u matki, jak i&nbsp;u dziecka. Działania monitorujące następstwa tych technik wdrożono w kilku krajach: w&nbsp;Wielkiej Brytanii, Szwecji, a także w niekt&oacute;rych stanach USA. W USA i Kanadzie dzieci poczęte w wyniku zastosowania ART stanowią 10-20% pacjent&oacute;w oddział&oacute;w intensywnej terapii noworodka z podobnymi wskaźnikami należy się zatem liczyć także w Polsce. W&nbsp;odniesieniu do odległych skutk&oacute;w zastosowania ART występujących w następnych pokoleniach, najważniejsza jest ocena możliwości uszkodzenia pojedynczego genu, genomu i&nbsp;epigenomu, kt&oacute;ra wymaga wykonania szeroko zakrojonych, długotrwałych badań. Przeprowadzenie zabieg&oacute;w z wykorzystaniem ART zwiększa bowiem liczbę mutacji genetycznych przez przekazanie starych i powstawanie nowych mutacji. Według jednej z belgijskich publikacji u noworodk&oacute;w poczętych w wyniku wstrzyknięcia plemnika do cytoplazmy oocytu częściej niż w populacji og&oacute;lnej stwierdza się aneuploidie (monosomie, trisomie) chromosom&oacute;w płciowych (0,6% vs 0,2%), strukturalne zaburzenia budowy chromosom&oacute;w autosomalnych (0,4% vs 0,07%), a także odziedziczone (gł&oacute;wnie po niepłodnym ojcu) aberracje chromosomowe.&nbsp;</p>', 'pl'),
(104, 'Trzecia sekcja', '<p>Najważniejszą przyczyną niepłodności w&nbsp;ostatniej dekadzie wydaje się op&oacute;źnienie wieku zajścia kobiety w pierwszą ciążę. Stąd jednym z ważnych kierunk&oacute;w w polityce demograficznej powinna być profilaktyka niepłodności. Należy zorganizować szeroko zakrojoną kampanię medialną informującą młode kobiety w wieku rozrodczym o szybkim zmniejszaniu się płodności między 20. a 34. rokiem życia (o 63%). Decyzja o posiadaniu dzieci należy do rodzic&oacute;w, ale powinni być oni poinformowani o tym, że odkładanie w czasie plan&oacute;w prokreacyjnych wiąże się ze wzrastającym ryzykiem niepłodności.</p>', 'pl'),
(105, 'Genetycy', '<p align="center"><strong><a href="http://oplodnosci.pl/index.php/nieplodnosc/in-vitro/176-genetyczny-poczatek-i-genetyczny-porzadek-zycia-ludzkiego">Genetyczny początek i genetyczny porządek życia ludzkiego</a></strong></p>\r\n<p><strong><img style="margin: 0 20px 5px 0;" title="prof Stanisław Cebrat dwie ryby" src="/useruploads/images/profesorowie/prof_stanisław_cebrat_genetyk.jpg" alt="prof Stanisław Cebrat genetyk" width="351" height="197" align="left" /></strong>Dyskusja na temat biologii początku życia ludzkiego ma sens, natomiast dyskusja o tym, kt&oacute;ry moment należy uznać za początek życia ludzkiego jest trywialna i najczęściej bezprzedmiotowa. Wystarczy z pytania o początek życia usunąć słowo &bdquo;ludzkiego&rdquo;, aby wszyscy się zgodzili, że początek życia ryby, kt&oacute;rej jajo jest zapładniane w wodzie a zarodek jest wolnopływającym składnikiem planktonu zaczyna się właśnie od zapłodnienia kom&oacute;rki jajowej, a nie od momentu, w kt&oacute;rym rozwijają się jej płetwy albo skrzela. Dlaczego zapłodnione jajo ludzkie i powstający z niego zarodek, szczeg&oacute;lnie chroniony i wspomagany przez matkę w pierwszym okresie swojego rozwoju, należałoby uznać za nieżywe? Wszelkie argumentacje, że o żywym człowieku możemy m&oacute;wić dopiero od zagnieżdżenia się zarodka, albo od momentu wyr&oacute;żnienia początk&oacute;w rozwoju układu nerwowego, albo od dwunastego tygodnia ciąży, albo od trzeciego trymestru, albo od urodzenia albo od momentu, kiedy rozw&oacute;j dziecka osiąga poziom intelektualny nieosiągalny przez jakiekolwiek inne stworzenie, albo, albo .... są absurdalne. Proszę zwr&oacute;cić uwagę, że ostatnia wspomniana granica m&oacute;wi, że dziecko staje się człowiekiem w wieku około czterech lat, kiedy osiąga poziom intelektualny dorosłego szympansa. Jeżeli zwierzęta uznawane za najbardziej inteligentne &ndash; szympansy i goryle &ndash; wyginą (zresztą za sprawą człowieka), to dziecko będzie się stawało człowiekiem znacznie wcześniej?</p>', 'pl'),
(106, 'Druga sekcja', '<p>Za początek życia ludzkiego należy uznać moment zapłodnienia kom&oacute;rki jajowej przez plemnik. W warunkach naturalnych, zjawisko zapłodnienia jest procesem nieodwracalnym. Tylko w warunkach sztucznego eksperymentu można jeszcze usunąć z zapłodnionej kom&oacute;rki jądro plemnika i zastąpić go innym jądrem. W tych rozważaniach lepiej będzie jednak nie dyskutować nad takimi możliwościami technologicznymi zezwalającymi na zaburzenia, a nawet odwr&oacute;cenie naturalnego porządku proces&oacute;w biologicznych.</p>\r\n<p>Uznając, że zapłodnienie ludzkiej kom&oacute;rki jajowej jest procesem nieodwracalnym, przyjmujemy, że dalszy rozw&oacute;j powstającej diploidalnej zygoty jest zdeterminowany &ndash; z tej zygoty może się rozwinąć tylko człowiek. Rozw&oacute;j jest jednak procesem chaotycznym. Chaosu nie należy tutaj rozumieć w sensie potocznym, jako procesu niepoddającego się żadnym regułom. Chaos jest procesem, w kt&oacute;rym rządzą ścisłe reguły, tyle, że stochastyczne [1]. W procesach stochastycznych czasem niezwykle trudno jest przewidzieć dalszy przebieg wypadk&oacute;w, podobnie jak w przewidywaniu pogody. Drobne, często niekontrolowane, albo wydające się nieistotnymi, zmiany w warunkach rozwoju, mogą zmienić losy rozwijającej się istoty. Jeżeli chcemy m&oacute;wić o porządku życia u jego początku, to powinniśmy pom&oacute;wić właśnie o tych problemach.</p>\r\n<p>Od ponad pięćdziesięciu lat człowiek potrafi przeprowadzić zapłodnienie kom&oacute;rki jajowej ssaka&nbsp;<em>in vitro</em>, doprowadzić do rozwoju zarodka i urodzenia się potomstwa z tak powstałej zygoty. Po wstępnych eksperymentach na kr&oacute;likach i myszach, technologie te zostały zaproponowane jako powszechna usługa ludziom &ndash; nie tylko parom niepłodnym, ale r&oacute;wnież innym parom, kt&oacute;re z wielu powod&oacute;w wolą skorzystać raczej z zapłodnienia pozaustrojowego niż z zapłodnienia naturalnego. Jednak dopiero najnowsze techniki genetyki molekularnej potrafią ocenić niekt&oacute;re r&oacute;żnice w rozwoju zarodk&oacute;w powstałych r&oacute;żnymi sposobami. Tak zwane chipy DNA, używane do oceny aktywności wszystkich gen&oacute;w w dowolnych tkankach, są w stanie wykryć takie r&oacute;żnice. Eksperymenty przeprowadzono na myszach [3]. Utworzono zarodki, kt&oacute;re r&oacute;żniły się tylko warunkami samego momentu zapłodnienia &ndash; jedne powstały przez zapłodnienie&nbsp;<em>in vitro</em>, drugie przez zapłodnienie naturalne, natychmiastowe wypłukanie zapłodnionych kom&oacute;rek i dalszą hodowlę w warunkach&nbsp;<em>in vitro.</em>&nbsp;Te dwie grupy zarodk&oacute;w r&oacute;żniły się aktywnością ponad tysiąca gen&oacute;w. Pomimo tak dużych r&oacute;żnic, powstający organizm jest w stanie skompensować zaburzenia i w większości przypadk&oacute;w powr&oacute;cić na szlak prawidłowego rozwoju. Nie rozumiemy jednak ani sposob&oacute;w kompensacji, ani też nie potrafimy określić, na czym polega istota r&oacute;żnic w warunkach zapłodnienia&nbsp;<em>in vivo</em>&nbsp;i&nbsp;<em>in vitro</em>.</p>\r\n<p>Zgodnie z bardzo powszechnie akceptowaną wiedzą, informacja genetyczna wnoszona do zygoty przez matkę i przez ojca są ściśle r&oacute;wnoważne &ndash; praktycznie identyczne. Tak jednak nie jest. Informacja zawarta w gametach męskich i żeńskich, nawet jeżeli jest reprezentowana przez dokładnie identyczne sekwencje DNA nie jest taka sama. Opr&oacute;cz informacji zawartej w samych sekwencjach nukleotydowych, do zygoty wnoszona jest r&oacute;wnież &bdquo;wiedza&rdquo; o tym, kt&oacute;ry z rodzic&oacute;w tę informację przekazał. Zależnie od pochodzenia gen&oacute;w, ich aktywność może być r&oacute;żna. Rodzice wnoszą więc do zygoty opr&oacute;cz zestawu gen&oacute;w, specyficzny wzorzec aktywności poszczeg&oacute;lnych gen&oacute;w. Dopiero nałożenie aktywności dw&oacute;ch tak zmodyfikowanych zestaw&oacute;w daje możliwość prawidłowego rozwoju organizmu. Modyfikacja ta, zwana piętnowaniem rodzicielskim, uniemożliwia na przykład tworzenie zarodk&oacute;w z dw&oacute;ch kom&oacute;rek jajowych albo przez zastąpienie jądra kom&oacute;rki jajowej jądrem drugiego plemnika. Piętnowanie rodzicielskie jest bardzo wrażliwe na warunki, w kt&oacute;rych dochodzi do rozwoju i podział&oacute;w kom&oacute;rek. Już samo hormonizowanie&nbsp; kobiety w celu wywołania wielojajeczkowania może spowodować błędy w piętnowaniu. Zaburzenia piętnowania obserwuje się r&oacute;wnież w hodowlach kom&oacute;rek macierzystych pochodzenia zarodkowego, a co najważniejsze, kilkakrotnie częściej u dzieci poczętych drogą zapłodnienia pozaustrojowego niż po naturalnym poczęciu [4]. Dlatego mogą budzić wątpliwości prace nad pozaustrojowym dojrzewaniem ludzkich kom&oacute;rek jajowych. Wydłuża to znacznie okres manipulowania kom&oacute;rkami rozrodczymi w fazie, w kt&oacute;rej ich rozw&oacute;j jest bardzo wrażliwy na zmiany środowiskowe, a nasza wiedza na temat warunk&oacute;w krytycznych ich rozwoju jest praktycznie żadna.</p>\r\n<p>Do niezwykle istotnych zjawisk w porządku naszego świata ożywionego należą mutacje. Mutacje są zmianami naszej informacji genetycznej i najczęściej uważa się je za zło konieczne. Niekt&oacute;rzy nawet uważają (niesłusznie), że gdyby się dało uniknąć mutacji tanim kosztem, to Natura wyeliminowałaby je całkowicie. Wszystko jednak wskazuje na to, że częstość mutacji ustalana jest bardzo precyzyjnie na właściwym poziomie tak, aby nie pozbawić organizm&oacute;w jednego z podstawowych mechanizm&oacute;w zmienności, ale żeby nie zabijać ich zbyt często mutacjami, kt&oacute;rych znakomita większość jest jednak szkodliwa. Częstość mutacji jest więc skrupulatnie pilnowana przez wiele mechanizm&oacute;w biorących udział w replikacji DNA, w jego naprawach, w kontrolowaniu czasu potrzebnego na naprawę a nawet, w warunkach krytycznych mogą one prowadzić do samob&oacute;jczej śmierci kom&oacute;rki. Zmieniając warunki życia i rozwoju kom&oacute;rek z&nbsp;<em>in vivo</em>&nbsp;na&nbsp;<em>ex vivo</em>&nbsp;wprowadzamy wiele zaburzeń, kt&oacute;rych nie kontrolujemy, a kt&oacute;re w spos&oacute;b istotny mogą wpływać na częstość mutacji. Zapłodnienie pozaustrojowe jest procesem, w kt&oacute;rym ani my sami nie potrafimy kontrolować mutagenezy, ani nie potrafią tego robić w spos&oacute;b właściwy kom&oacute;rki zarodkowe, w związku z czym dochodzi do istotnego zwiększenia częstości mutacji. Część z nich jest natychmiast eliminowana przez śmierć zygotyczną, ale część pojawia się w strukturze genetycznej narodzonych dzieci i jest widoczna w ich fenotypie w formie wad wrodzonych [5,6,7,8], albo &ndash; znacznie większa ich liczba &ndash; determinując defekty recesywne zostanie usunięta przez selekcję dopiero w następnych pokoleniach.</p>\r\n<p>Nasza obecna wiedza i technologie pozwalają nam na zainicjowanie życia &ndash; wywołanie jego początku, ale nie pozwalają na zachowanie jego naturalnego porządku, a przynajmniej na skuteczne unikanie zaburzania tego porządku.</p>', 'pl'),
(107, 'Trzecia sekcja', '<p><strong>Literatura</strong></p>\r\n<ol start="1">\r\n<li>J. Gleick. Chaos: Making a New Science. Pinguin 1988.</li>\r\n<li>C. Thibault, L. Dauzier, S. Winterberger, &nbsp;Cytological study of fecundation in vitro of rabbit ovum. C R Seances Soc Biol Fil. 1954. 148, 789.</li>\r\n<li>G. Giritharan, S. Talbi, A. Donjacour, F. Di Sebastiano, A. T. Dobson, P. F. Rinaudo Effect of in vitro fertilization on gene expression and development of mouse preimplantation embryos. Reproduction. 2007, 134, 63.</li>\r\n<li>A.G. Sutcliffe, C.J. Peters, S. Bowdin, K. Temple, W. Reardon, L. Wilson, J. Clayton-Smith, L.A. Brueton, W. Bannister, E.R. Maher, Assisted reproductive therapies and imprinting disorders &ndash; a preliminary British survey. Human Reproduction. 2006, 21, 1009.</li>\r\n<li>A.C. Moll, S.M. Imhof, J.R. Cruysberg, A.Y. Schouten-van Meeteren, M. Boers, F.E. van Leeuwen, Incidence of retinoblastoma in children born after in-vitro fertilisation. Lancet, 2003, 361, 309.</li>\r\n<li>G. Viot, S., Epelboin, F. Olivennes, Is there an increased risk of congenital malformations after ART? Results from a prospective French long-term survey of a cohort of 15 162 children.&nbsp; Human Reproduction. 2010, 25 (suppl 1): i53-i55.</li>\r\n<li>T. Marees, C.J. Dommering, S.M. Imhof, W.A. Kors, P.J. Ringens, F.E. van Leeuwen, A.C. Moll, Incidence of retinoblastoma in Dutch children conceived by IVF: an expanded study. Human Reproduction, 2009, 24, 3220.</li>\r\n<li>R.H. Barbosa, F.R Vargas, E. Lucena, C.R. Bonvicino, H.N. Seu&aacute;nez, Constitutive RB1 mutation in a child conceived by in vitro fertilization: implications for genetic counseling. BMC Medical Genetics, 2009, 10:75.</li>\r\n</ol>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Linki do innych wypowiedzi Autora</strong></p>\r\n<p><a title="prof Stanisław Cebrat dwie ryby" href="http://2ryby.pl/autor/prof-stanislaw-cebrat/" target="_blank">http://2ryby.pl/autor/prof-stanislaw-cebrat/</a></p>\r\n<p><a title="prof Cebrat strona o in vitro" href="http://www.stronaoinvitro.pl/co-na-to-genetycy-" target="_blank">http://www.stronaoinvitro.pl/co-na-to-genetycy-</a></p>\r\n<p>&nbsp;</p>', 'pl'),
(108, 'Bioetycy', '<p align="center"><strong>Na</strong><strong>P</strong><strong>ro</strong><strong>TECHNOLOGY<sup>&reg;</sup> </strong><strong>jako</strong><strong> dobra medycyna</strong></p>\r\n<p class="normal"><img style="margin-top: 0px; margin-right: 20px; margin-bottom: 5px; margin-left: 0px;" title="x. dr hab. Piotr Kieniewicz MIC" src="/useruploads/images/profesorowie/x_piotr_kieniewicz_mic_bazylika.jpg" alt="x. dr hab. Piotr Kieniewicz MIC" width="281" height="374" align="left" />Dr hab. Piotr Kieniewicz MIC</p>\r\n<p class="normal">Katedra Teologii Życia KUL</p>\r\n<p align="center"><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>Wstęp </strong></p>\r\n<p>Zazwyczaj, gdy wiedziony potrzebą dokonania rutynowej kontroli stanu zdrowia lub podejrzeniem choroby człowiek przychodzi do lekarza, oczekuje solidnej diagnozy i &ndash; jeśli zajdzie taka potrzeba &ndash; adekwatnej terapii. Ponadto oczekuje, że będzie potraktowany z szacunkiem.</p>\r\n<p>Wśr&oacute;d rozlicznych dziedzin medycyny jest jedna wyjątkowo specyficzna. Jest nią ginekologia. W swoim obecnym kształcie nazbyt często zdarza się, że praktykujący ją specjaliści jedynie pobieżnie badają &ndash; jeżeli w og&oacute;le &ndash; swoje pacjentki, a powszechnie ignorując wewnętrzną celowość badanych przez siebie organ&oacute;w, przepisują na niemal wszystkie stany fizjologiczne i schorzenia ten sam środek farmakologiczny: pigułkę antykoncepcyjną.</p>', 'pl'),
(109, 'Druga sekcja', '<p><strong>Współczesny kontekst</strong></p>\r\n<p>Dzisiejsza ginekologia znajduje się w głębokim kryzysie zar&oacute;wno w odniesieniu do praktyki diagnostycznej, jak i oferty terapeutycznej. W odniesieniu do zauważonych nieprawidłowości proponuje się działania maskujące niepokojące objawy. Samą płodność, będącą sensem istnienia układu rozrodczego poddaje się czasowej lub trwałej supresji, bez oglądania się na &ndash; niekiedy bardzo poważne &ndash; możliwe skutki uboczne. Te zresztą często się ukrywa lub marginalizuje się ich znaczenie.</p>\r\n<p>Od czasu wprowadzenia&nbsp;<em>Pigułki</em>&nbsp;i&nbsp;<em>in vitro&nbsp;</em>na rynek usług medycznych, ginekologia zatraciła wiele obecnych dotąd umiejętności. Wielu lekarzy nie zna i nie rozumie fizjologii płodności. Wielu w ogóle nie postrzega płodności jako dobra i objawu zdrowia, przynajmniej dopokąd pacjentka nie zacznie skarżyć się na niemożność poczęcia potomstwa. Zapomniane zostały znane dotąd i rozwijane techniki mikrochirurgiczne, kt&oacute;re mogłyby pozwolić na wykonywanie operacji praktycznie nie pozostawiających zrost&oacute;w. Zdając sobie sprawę z powagi oskarżenia należy powiedzieć wprost: dla wsp&oacute;łczesnej ginekologii odpowiedzią na płodność (i znaczną część innych problem&oacute;w zdrowotnych kobiet) jest&nbsp;<em>Pigułka</em>&nbsp;antykoncepcyjna. Odpowiedzią zaś na niepłodność &ndash; jest zapłodnienie pozaustrojowe.</p>\r\n<p>Pojawienie się&nbsp;<em>in vitro</em>&nbsp;spowodowało koncentrację wysiłk&oacute;w na udoskonaleniu technik sztucznej reprodukcji, kosztem rozwoju metod diagnozujących przyczyny bezpłodności i podejmujących leczenie przyczynowe. Lekarze przestali szukać przyczyn niepłodności i dr&oacute;g jej przezwyciężenia. Na boku pozostawiono wiedzę o fizjologii ludzkiej prokreacji, oraz dostępne i systematycznie dotąd rozwijane techniki mikrochirurgiczne. Fascynacja technicznymi możliwościami ingerencji w ludzką płodność doprowadziła do zastąpienia służby zdrowiu prokreacyjnemu władzą nad ludzką reprodukcją.</p>\r\n<p align="left"><strong>NaProTECHNOLOGY<sup>&reg;</sup> jako dobra medycyna </strong></p>\r\n<p><em>&bdquo;Humanae vitae&rdquo;</em> było dokumentem absolutnie kluczowym dla powstania NaProTECHNOLOGY<sup>&reg;</sup>. Z&nbsp;refleksji nad nim zrodziło się dzieło, jakim było powołanie Instytutu Papieża Pawła VI do Studi&oacute;w nad Ludzką Reprodukcją. W ramach prowadzonych przez lata prac stworzony został Creighton Model FertilityCare System<sup>TM</sup> (CrMS) oraz NaProTECHNOLOGY<sup>&reg;</sup> jako medyczna i chirurgiczna specjalizacja ginekologiczna, pozwalając na efektywne rozpoznanie i skuteczne leczenie wykrytych nieprawidłowości. Model Creighton jest podstawowym narzędziem diagnostycznym w naprotechnologii, ale służy nade wszystko jako element systemu opieki nad płodnością, a nie tylko jako metoda wykrywania anomalii.</p>\r\n<p>Wsp&oacute;łczesna nauka pozwala dostrzec, jak skomplikowanym mechanizmem jest ludzkie ciało, a w nim przede wszystkim &ndash; układ rozrodczy. Poziom złożoności z jednej strony i precyzji &ndash; z drugiej, musi budzić zdumienie i podziw. Wsp&oacute;łzależność poszczeg&oacute;lnych elementów względem siebie jest przez ciało odsłaniana w poszczeg&oacute;lnych biomarkerach, pozwalając na precyzyjne rozpoznanie zachodzących zjawisk, a w przypadku zaburzeń i nieprawidłowości &ndash; także ich wykrycie.</p>\r\n<p>Wiele z przekazywanych przez biomarkery informacji się pokrywa, wzajemnie się potwierdzając. Hilgers, opracowując Model Creighton zauważył, że wykorzystywanie wielu biomarker&oacute;w nie przekłada się na zwiększenie ilości dostępnych informacji, a niekiedy &ndash; paradoksalnie &ndash; może nawet wprowadzać zamęt. W odniesieniu do zdrowia prokreacyjnego najpewniejszym ze źr&oacute;deł informacji okazał się objaw śluzowy, ściśle powiązany z bieżącym poziomem hormon&oacute;w płciowych.</p>\r\n<p>Ponieważ sztuka lekarska domaga się, by na miarę możliwości podejmować pr&oacute;by leczenia przyczynowego (a nie tylko objawowego), usuwając źr&oacute;dło choroby, a nie tylko jej dokuczliwe symptomy, wywiad stanowi jedną z kluczowych form uzyskiwania informacji od pacjenta. Informacje zawarte w kartach są zatem weryfikowane podczas rozmowy i uzupełniane o subiektywne odczucia kobiety. Zebrane informacje są podstawą do podjęcia dalszych działań diagnostycznych, począwszy od dokładnego badania ginekologicznego, po zaawansowane badania z wykorzystaniem nowoczesnej aparatury technicznej.</p>\r\n<p>NaProTECHNOLOGY<sup>&reg;</sup> wykorzystuje w diagnozie praktycznie wszystkie dostępne techniki i aparaty diagnostyczne, niekiedy wszakże nieco odmiennie je stosując. Badanie ultrasonograficzne i laparoskopowe, badanie drożności jajowod&oacute;w i nasieniowod&oacute;w, badania hormonalne &ndash; wszystkie te działania są znane i stosowane w medycynie. R&oacute;żnice zachodzą nade wszystko w sposobie ich przeprowadzenia oraz &ndash; co ma niekiedy bardzo poważny wpływ na efektywność &ndash; w ukierunkowanej na płodność motywacji. Profil hormonalny wykonywany jest w odniesieniu do całego cyklu, tak aby uzyskać informację o poziomie poszczeg&oacute;lnych hormon&oacute;w w przeciągu całego cyklu, a nie tylko określonego dnia. Także zmiana techniki wykonywania badania laparoskopowego na tzw. laparoskopię bliskiego kontaktu (gdzie ogląd tkanek wykonywany jest z odległości kilku milimetrów) pozwala na znacznie skuteczniejsze wykrycie zmian patologicznych, choć oczywiście dokonuje się to kosztem znacznego wydłużenia czasu badania.</p>\r\n<p>Warto zauważyć, że w naprotechnologii kolejne, bardziej inwazyjne i uciążliwe badania wykonywane są dopiero wtedy, gdy jest to konieczne &ndash; na podstawie wskaz&oacute;wek dostarczonych przez analizę zaobserwowanych biomarker&oacute;w. Takie &bdquo;celowane&rdquo; diagnozowanie znacznie zmniejsza koszty i uciążliwość procesu diagnostycznego. Terapia jest naturalną konsekwencją postawionej diagnozy. W zależności od wykrytej nieprawidłowości może polegać na podawaniu farmaceutyk&oacute;w (antybiotyk&oacute;w, hormon&oacute;w), albo na działaniach chirurgicznych. Kuracje antybiotykowe stosowane są przy bakteryjnych infekcjach pochwy oraz niekiedy pooperacyjnie w przypadku konieczności. Postępowanie w tym względzie nie odbiega zbytnio od rutynowych działań. Natomiast w odniesieniu do terapii hormonalnej i chirurgicznej, naprotechnologia oferuje zupełnie nowe podejście.</p>\r\n<p>Pierwszą zasadniczą r&oacute;żnicą jest rozr&oacute;żnienie pomiędzy hormonami (czyli hormonami naturalnymi), a artymonami (czyli hormonami sztucznymi) i wykorzystywanie w terapii wyłącznie tych pierwszych. Hilgers zauważył, że jakkolwiek artymony mają budowę molekularną i działanie podobne do hormon&oacute;w, jednakże występujące r&oacute;żnice w praktyce uniemożliwiają skuteczne leczenie. Ich działanie może wystarczać do eliminacji niekt&oacute;rych objaw&oacute;w chorobowych, oraz do uzyskiwania efektu antykoncepcyjnego lub abortywnego, jednakże nie nadają się do suplementacji niedobor&oacute;w hormon&oacute;w produkowanych przez organizm kobiety. Jeżeli zatem celem terapii ma być przywr&oacute;cenie prawidłowych mechanizm&oacute;w w układzie hormonalnym, konieczne jest wykorzystanie substancji naturalnych. Oczywiście, nie muszą one być wytworzone w spos&oacute;b naturalny, ale ich budowa molekularna musi się pokrywać z budową molekularną hormon&oacute;w wytworzonych naturalnie.</p>\r\n<p>Nowatorski wkład Hilgersa w chirurgię ginekologiczną polega nade wszystko na przywr&oacute;ceniu zapoznanych technik i umiejętności w korelacji z uzyskaną w procesie diagnostycznym wiedzą na temat natury poszczeg&oacute;lnych schorzeń. Tak więc na nowo przywr&oacute;cona została ginekologii stosowana w mikrochirurgii naczyniowej i neurologii technika szw&oacute;w nie powodujących zrost&oacute;w i minimalizujących blizny, technika porzucona po wprowadzeniu na rynek medyczny procedur zapłodnienia pozaustrojowego. Pozwala ona na skuteczne przywr&oacute;cenie drożności jajowod&oacute;w i nasieniowod&oacute;w, bezpieczne operacje na macicy czy usunięcie cyst z jajnik&oacute;w bez naruszenia ich funkcjonalności. Hilgers z powodzeniem wykorzystuje laser podczas usuwania mniejszych ognisk endometriozy; większe ogniska są usuwane w tradycyjny spos&oacute;b. Jednocześnie, nie waha się sięgnąć po techniki starsze, jak szew zamykający szyjkę macicy, mający zapobiegać przedwczesnemu porodowi.</p>', 'pl'),
(110, 'Trzecia sekcja', '<p align="left"><strong>Rola etyki w NaProTECHNOLOGY<sup>&reg;</sup></strong></p>\r\n<p>Nie spos&oacute;b nie zauważyć, że naprotechnologia stanowi pr&oacute;bę powrotu z ginekologią do praktyk dobrej medycyny. Jest rzeczą znamienną, że punktem wyjścia dla Hilgersa była refleksja etyczna, zrodzona na kanwie lektury encykliki <em>&bdquo;Humanae vitae&rdquo;</em>. Odczytana w jej kluczu antropologia pozwoliła na wypracowanie relacji lekarz- pacjent, szanującej godność i podmiotowość obojga.</p>\r\n<p>Fundament etyczny NaProTECHNOLOGY<sup>&reg;</sup> oparty jest o chrześcijańską antropologię, ukazującą człowieka jako wolny i świadomy byt cielesno-duchowy, kt&oacute;rego pierwszym powołaniem jest ofiarna miłość. Jedną z dr&oacute;g realizacji tego powołania jest małżeństwo, w którym mężczyzna i kobieta zaproszeni są, by poprzez dar z siebie stworzyć środowisko otwarte na potomstwo. W tym kontekście zadaniem lekarza jest wesprzeć wysiłki małżonk&oacute;w zmierzające do odpowiedzialnego poczęcia dziecka, bez naruszania jednak ich podmiotowości w tym względzie i zastępowania ich w dziele prokreacji.</p>\r\n<p>Hilgers nie waha się iść pod prąd wsp&oacute;łczesnym tendencjom. Kieruje się nade wszystko dobrem pacjenta &ndash; kobiety, niekiedy już matki: wówczas opieką otacza oboje pacjent&oacute;w. Ukierunkowanie na płodność i życie jest niezwykle znamiennym wyznacznikiem stworzonej przez niego gałęzi specjalności ginekologicznej. Stosowana terminologia, spos&oacute;b prowadzenia spotkań przez instruktor&oacute;w, zalecenia dla lekarzy odnośnie do diagnozy i terapii &ndash; wszystkie te elementy łączy klucz prokreacyjny.</p>\r\n<p>NaProTECHNOLOGY<sup>&reg;</sup> wyrosła z etycznego wyzwania postawionego przez Ojca św. Pawła VI w <em>&bdquo;Humanae vitae&rdquo;</em>, wyzwania do ochrony ludzkiej miłości realizowanej w przymierzu małżeńskim. Chociaż w 1968 roku realizacja postawionych przez Papieża zaleceń odnośnie do wykorzystania metod rozpoznania płodności była trudna, gdyż metody te były dalece niedoskonałe i mało znane, Hilgers uwierzył, że to moralne prawo musi być możliwe do zrealizowania. Z tego aktu wiary zrodził się zapał, który zaowocował opracowaniem CrMS, NaProTECHNOLOGY<sup>&reg;</sup>, a obecnie &ndash; ruchem odnowy profesjonalnej i moralnej wśr&oacute;d coraz liczniejszej rzeszy lekarzy r&oacute;żnych specjalności, także ginekolog&oacute;w.</p>\r\n<p>Wysokie standardy etyczne w żaden spos&oacute;b nie naruszają wymog&oacute;w profesjonalnej jakości. Jakkolwiek wielu lekarzy jest przekonanych, że ginekologii nie można praktykować bez przepisywania antykoncepcji, bez sterylizacji, aborcji i in vitro, doświadczenie Hilgersa i wciąż rosnącej rzeszy jego uczni&oacute;w dowodzi, że jest to nieprawda. Co więcej, oferta NaProTECHNOLOGY<sup>&reg;</sup> pozwala na skuteczną diagnozę i terapię przyczynową schorzeń, wobec których inni lekarze pozostają bezradni, zadowalając się maskowaniem niepokojących objaw&oacute;w przy pomocy tabletek antykoncepcyjnych. Dobra etyka prowadzi do dobrej medycyny &ndash; profesjonalnej, kompetentnej i ukierunkowanej na prawdziwe dobro pacjenta.</p>', 'pl'),
(111, 'Oświadczenie', '<p>Tw&oacute;rca witryny nie ponosi odpowiedzialności za otrzymane obliczenia. Pomimo dołożenia należytej staranności otrzymane wyniki nie powinny stanowić samodzielnych przesłanek w decyzjach terapeutycznych a mogą jedynie służyć pomocą przed konsultacją specjalistyczną.</p>', 'pl'),
(112, 'Oświadczenie', '<p>Tw&oacute;rca witryny nie ponosi odpowiedzialności za otrzymane obliczenia. Pomimo dołożenia należytej staranności otrzymane wyniki nie powinny stanowić samodzielnych przesłanek w decyzjach terapeutycznych a mogą jedynie służyć pomocą przed konsultacją specjalistyczną.</p>', 'pl'),
(113, 'Oświadczenie', '<p>Tw&oacute;rca witryny nie ponosi odpowiedzialności za otrzymane obliczenia. Pomimo dołożenia należytej staranności otrzymane wyniki nie powinny stanowić samodzielnych przesłanek w decyzjach terapeutycznych a mogą jedynie służyć pomocą przed konsultacją specjalistyczną.</p>', 'pl');

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_article_category_id_article_category_id` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`id`) ON DELETE SET NULL;

--
-- Ograniczenia dla tabeli `article_category_translation`
--
ALTER TABLE `article_category_translation`
  ADD CONSTRAINT `article_category_translation_id_article_category_id` FOREIGN KEY (`id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `article_translation`
--
ALTER TABLE `article_translation`
  ADD CONSTRAINT `article_translation_id_article_id` FOREIGN KEY (`id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `attachment_translation`
--
ALTER TABLE `attachment_translation`
  ADD CONSTRAINT `attachment_translation_id_attachment_id` FOREIGN KEY (`id`) REFERENCES `attachment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `attribute_def`
--
ALTER TABLE `attribute_def`
  ADD CONSTRAINT `attribute_def_type_id_attribute_type_id` FOREIGN KEY (`type_id`) REFERENCES `attribute_type` (`id`);

--
-- Ograniczenia dla tabeli `attribute_def_translation`
--
ALTER TABLE `attribute_def_translation`
  ADD CONSTRAINT `attribute_def_translation_id_attribute_def_id` FOREIGN KEY (`id`) REFERENCES `attribute_def` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `attribute_def_value`
--
ALTER TABLE `attribute_def_value`
  ADD CONSTRAINT `attribute_def_value_attribute_def_id_attribute_def_id` FOREIGN KEY (`attribute_def_id`) REFERENCES `attribute_def` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `attribute_def_value_translation`
--
ALTER TABLE `attribute_def_value_translation`
  ADD CONSTRAINT `attribute_def_value_translation_id_attribute_def_value_id` FOREIGN KEY (`id`) REFERENCES `attribute_def_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD CONSTRAINT `attribute_value_attribute_def_id_attribute_def_id` FOREIGN KEY (`attribute_def_id`) REFERENCES `attribute_def` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_value_attribute_def_value_id_attribute_def_value_id` FOREIGN KEY (`attribute_def_value_id`) REFERENCES `attribute_def_value` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_value_attribute_type_id_attribute_type_id` FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attribute_value_product_id_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `attribute_value_translation`
--
ALTER TABLE `attribute_value_translation`
  ADD CONSTRAINT `attribute_value_translation_id_attribute_value_id` FOREIGN KEY (`id`) REFERENCES `attribute_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `dictionary_translation`
--
ALTER TABLE `dictionary_translation`
  ADD CONSTRAINT `dictionary_translation_id_dictionary_id` FOREIGN KEY (`id`) REFERENCES `dictionary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `download_translation`
--
ALTER TABLE `download_translation`
  ADD CONSTRAINT `download_translation_id_download_id` FOREIGN KEY (`id`) REFERENCES `download` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `faq_translation`
--
ALTER TABLE `faq_translation`
  ADD CONSTRAINT `faq_translation_id_faq_id` FOREIGN KEY (`id`) REFERENCES `faq` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `mail_data_translation`
--
ALTER TABLE `mail_data_translation`
  ADD CONSTRAINT `mail_data_translation_id_mail_data_id` FOREIGN KEY (`id`) REFERENCES `mail_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `media_size`
--
ALTER TABLE `media_size`
  ADD CONSTRAINT `media_size_module_cms_id_module_cms_id` FOREIGN KEY (`module_cms_id`) REFERENCES `module_cms` (`id`);

--
-- Ograniczenia dla tabeli `media_translation`
--
ALTER TABLE `media_translation`
  ADD CONSTRAINT `media_translation_id_media_id` FOREIGN KEY (`id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `meta_tag_translation`
--
ALTER TABLE `meta_tag_translation`
  ADD CONSTRAINT `meta_tag_translation_id_meta_tag_id` FOREIGN KEY (`id`) REFERENCES `meta_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `module_cms`
--
ALTER TABLE `module_cms`
  ADD CONSTRAINT `module_cms_module_group_id_module_group_id` FOREIGN KEY (`module_group_id`) REFERENCES `module_group` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `module_group_permission`
--
ALTER TABLE `module_group_permission`
  ADD CONSTRAINT `module_group_permission_module_group_id_module_group_id` FOREIGN KEY (`module_group_id`) REFERENCES `module_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `module_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `module_permission`
--
ALTER TABLE `module_permission`
  ADD CONSTRAINT `module_permission_module_id_module_cms_id` FOREIGN KEY (`module_id`) REFERENCES `module_cms` (`id`),
  ADD CONSTRAINT `module_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `news_translation`
--
ALTER TABLE `news_translation`
  ADD CONSTRAINT `news_translation_id_news_id` FOREIGN KEY (`id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `page_parent_id_page_id` FOREIGN KEY (`parent_id`) REFERENCES `page` (`id`);

--
-- Ograniczenia dla tabeli `page_translation`
--
ALTER TABLE `page_translation`
  ADD CONSTRAINT `page_translation_id_page_id` FOREIGN KEY (`id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id_product_categories_id` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `product_card_translation`
--
ALTER TABLE `product_card_translation`
  ADD CONSTRAINT `product_card_translation_id_product_card_id` FOREIGN KEY (`id`) REFERENCES `product_card` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_parent_id_product_categories_id` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `product_categories_translation`
--
ALTER TABLE `product_categories_translation`
  ADD CONSTRAINT `product_categories_translation_id_product_categories_id` FOREIGN KEY (`id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `product_translation`
--
ALTER TABLE `product_translation`
  ADD CONSTRAINT `product_translation_id_product_id` FOREIGN KEY (`id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `sf_guard_forgot_password`
--
ALTER TABLE `sf_guard_forgot_password`
  ADD CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `sf_guard_group_permission`
--
ALTER TABLE `sf_guard_group_permission`
  ADD CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `sf_guard_remember_key`
--
ALTER TABLE `sf_guard_remember_key`
  ADD CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `sf_guard_user_group`
--
ALTER TABLE `sf_guard_user_group`
  ADD CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `sf_guard_user_permission`
--
ALTER TABLE `sf_guard_user_permission`
  ADD CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `text_translation`
--
ALTER TABLE `text_translation`
  ADD CONSTRAINT `text_translation_id_text_id` FOREIGN KEY (`id`) REFERENCES `text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
