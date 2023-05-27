-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 22, 2023 at 12:54 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbt_goldenspoon_sambhal`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hot N Sour Soup', 'lorem-ipsum-is', '/storage/photos/34/Soup/Hot N Sour Soup.png', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Up to 10%</span></h2>', 'active', '2020-08-14 01:47:38', '2022-12-29 14:18:06'),
(2, 'Singapori Noodles', 'lorem-ipsum', '/storage/photos/34/Rice and Noodles/Singapori Noodles.png', '<p>Up to 10%</p>', 'active', '2020-08-14 01:50:23', '2022-12-29 14:22:07'),
(4, 'Magarita Pizza[8 Inches]', 'banner', '/storage/photos/34/Pizza & Pasta/Magarita Pizza[8 Inches].png', '<h2><span style=\"color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;\">Up to 40%</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2020-08-17 20:46:59', '2022-12-29 14:29:18');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Adidas', 'adidas', 'active', '2022-12-15 11:20:42', '2022-12-15 11:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(45, 25, 100, 34, 105.00, 'new', 1, 105.00, '2023-01-05 12:10:29', '2023-01-05 12:11:32'),
(46, 28, 101, 34, 105.00, 'new', 1, 105.00, '2023-01-05 12:14:01', '2023-01-05 12:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(16, 'Recommended', 'recommended', NULL, '/storage/photos/34/Recommended/Paneer Onion Dosa.png', 1, NULL, NULL, 'active', '2022-12-29 02:07:11', '2022-12-29 14:48:44'),
(17, 'Soup', 'soup', NULL, '/storage/photos/34/Soup/catsoup.jpg', 1, NULL, NULL, 'active', '2022-12-29 02:07:36', '2022-12-29 09:26:22'),
(18, 'Starters', 'starters', NULL, '/storage/photos/34/vegstarter/start_veg.jpg', 1, NULL, NULL, 'active', '2022-12-29 02:07:55', '2022-12-29 09:42:06'),
(19, 'Main Course', 'main-course', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:08:14', '2022-12-29 02:08:14'),
(20, 'Breads', 'breads', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:08:34', '2022-12-29 02:08:34'),
(21, 'Rice', 'rice', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:08:47', '2022-12-29 02:08:47'),
(22, 'Rice & Noodles', 'rice-noodles', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:09:12', '2022-12-29 02:09:12'),
(23, 'Pizza & Pasta', 'pizza-pasta', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:09:37', '2022-12-29 02:09:37'),
(24, 'South Indian', 'south-indian', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:09:53', '2022-12-29 02:09:53'),
(25, 'Burger', 'burger', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:10:11', '2022-12-29 02:10:11'),
(26, 'Wraps', 'wraps', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:10:26', '2022-12-29 02:10:26'),
(27, 'Crystal Dim Sum', 'crystal-dim-sum', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:10:49', '2022-12-29 02:10:49'),
(28, 'Fries', 'fries', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:11:01', '2022-12-29 02:11:01'),
(29, 'Dim Sum', 'dim-sum', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:11:17', '2022-12-29 02:11:17'),
(30, 'Raita', 'raita', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:11:29', '2022-12-29 02:11:29'),
(31, 'Salad', 'salad', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:11:44', '2022-12-29 02:11:44'),
(32, 'Dessert', 'dessert', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:11:58', '2022-12-29 02:11:58'),
(33, 'Thali', 'thali', NULL, NULL, 1, NULL, NULL, 'active', '2022-12-29 02:12:09', '2022-12-29 02:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL),
(5, 'abcd', 'fixed', '250.00', 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2020-08-14 08:25:46', '2020-08-14 08:00:01', '2020-08-14 08:25:46'),
(2, 'Prajwal Rai', 'About Price', 'prajwal.iar@gmail.com', NULL, '9800099000', 'Hello i am Prajwal Rai', '2020-08-18 03:04:15', '2020-08-15 07:52:39', '2020-08-18 03:04:16'),
(3, 'Prajwal Rai', 'lorem ipsum', 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', NULL, '2020-08-17 21:15:12', '2020-08-17 21:15:12'),
(4, 'Henryorefe', 'Quaestus potest esse perquam facile uti, si hoc Robot.', 'RookTessa9292@o2.pl', NULL, '89036458043', 'Iustus click potest convertere tu pupa in $1000. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-03 18:07:30', '2022-06-03 18:07:30'),
(5, 'Henryorefe', 'Online reditus est facillimus mores ut vos somnium adveho verus.', 'RookTessa9292@o2.pl', NULL, '89039199668', 'Operam! Hic vos can mereo pecuniam online! https://orefe.bode-roesch.de/orefe', NULL, '2022-06-05 01:08:50', '2022-06-05 01:08:50'),
(6, 'Henryorefe', 'Obsidendam $1 hodie ad $1000 cras.', 'RookTessa9292@o2.pl', NULL, '89032048991', 'Online reditus est facillimus mores ut vos somnium adveho verus. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-06 04:17:32', '2022-06-06 04:17:32'),
(7, 'Henryorefe', 'Invenire de ieiunas via a financial libertatem.', 'ogden-gevorgyan@mailme.dk', NULL, '89035114497', 'Adipiscing robot et eam adducam te pecuniam. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-06 07:09:37', '2022-06-06 07:09:37'),
(8, 'Henryorefe', 'Maxime prospere populo iam uti Robot. Facere vobis?', 'istanemmit@rambler.ru', NULL, '89033111026', 'Invenimus in ieiunas modo sit dives. Inveniet eam hic. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-06 09:50:06', '2022-06-06 09:50:06'),
(9, 'Henryorefe', 'Quisque mereretur, quantum vult, nunc.', 'julmik@forum.dk', NULL, '89035428769', 'Augmentum est nunc, sit amet quis ligula. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-06 12:29:06', '2022-06-06 12:29:06'),
(10, 'Henryorefe', 'Reprehendo ex novissima modo, ut a fantastic utilitatem.', 'jep.kofoed@forum.dk', NULL, '89036732705', 'Omnis qui necessitatibus pecuniam, ut hanc Robot ex. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-06 15:09:55', '2022-06-06 15:09:55'),
(11, 'Henryorefe', 'Obsidendam $1 hodie ad $1000 cras.', 'fynsstolthed@forum.dk', NULL, '89030472734', 'Operam! Hic vos can mereo pecuniam online! https://orefe.bode-roesch.de/orefe', NULL, '2022-06-06 17:53:22', '2022-06-06 17:53:22'),
(12, 'Henryorefe', 'Nulla diam consequat? Sit Robot pecuniam pro te.', 'fischer85@forum.dk', NULL, '89036254526', 'At $1000 die facile est, si uti hoc financial Robot. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-06 20:32:47', '2022-06-06 20:32:47'),
(13, 'Henryorefe', 'Aliquam robot est optimum satus enim financial libertatem.', 'courtami@mailme.dk', NULL, '89033303027', 'Scimus quomodo fieri dives, et tu? https://orefe.bode-roesch.de/orefe', NULL, '2022-06-06 23:07:21', '2022-06-06 23:07:21'),
(14, 'Henryorefe', 'Financial Robot est maxime financial tool in rete!', 'mjohansen@forum.dk', NULL, '89032002205', 'Online financial Robot est clavem ad successus. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 01:48:28', '2022-06-07 01:48:28'),
(15, 'Henryorefe', 'Nec opus est quaerere job amplius. Opus online.', 'glodeva77@mailme.dk', NULL, '89032191790', 'Pecuniam, pecuniam,! Plus facere financial robot! https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 04:30:58', '2022-06-07 04:30:58'),
(16, 'Henryorefe', 'Usura hoc Robot est optimus via ut vos divites essetis.', 'ancebak@mailme.dk', NULL, '89034831870', 'Financial Robot est futura opes et libertatem. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 07:25:23', '2022-06-07 07:25:23'),
(17, 'Henryorefe', 'In ieiunas modo, ut vos peram crassus est hic.', 'morgolt08.11@mailme.dk', NULL, '89038207372', 'Financial robot tenet, deferentes ad vos pecunias, dum somnum. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 10:05:10', '2022-06-07 10:05:10'),
(18, 'Henryorefe', 'Financial libertatem, quid est hoc robot praestat.', 'skouh@forum.dk', NULL, '89030052448', 'Non opus anymore. Iustus launch robot. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 12:38:23', '2022-06-07 12:38:23'),
(19, 'Henryorefe', 'Sentio solvo ut emerent omne quod vis, cum augmentum.', 'sylvesterhh123@forum.dk', NULL, '89034321215', 'Unum click in robot et adducam vos milia illos leones,. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 15:12:54', '2022-06-07 15:12:54'),
(20, 'Henryorefe', 'Pecunia opus? Ut hic facile! Iustus premere hoc deducere in robot.', 'tomasz.lange@mailme.dk', NULL, '89037782807', 'Fides financial Bot fieri dives. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 17:43:22', '2022-06-07 17:43:22'),
(21, 'Henryorefe', 'Sit diam Robot esse comes in financial forum.', 'haster99@forum.dk', NULL, '89038402532', 'Obsidendam $1 hodie ad $1000 cras. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 20:25:11', '2022-06-07 20:25:11'),
(22, 'Henryorefe', 'Ingens reditus sine re, quod est available.', 'holgerdanske@forum.dk', NULL, '89032987816', 'Hoc robot et adducam vos pecuniam 24/7. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-07 23:02:20', '2022-06-07 23:02:20'),
(23, 'Henryorefe', 'Quomodo Robot facit $1000 de $1 dignissim.', 'anders_ando@forum.dk', NULL, '89031516108', 'Vigilate pecuniam tuam crescere, dum te, placerat cum Robot. https://orefe.bode-roesch.de/orefe', NULL, '2022-06-08 01:41:27', '2022-06-08 01:41:27'),
(24, 'Henryorefe', 'Sentio solvo ut emerent omne quod vis, cum augmentum.', 'driveline@forum.dk', NULL, '89030221311', 'Maxime prospere populo iam uti Robot. Facere vobis? https://orefe.bode-roesch.de/orefe', NULL, '2022-06-08 04:21:50', '2022-06-08 04:21:50'),
(25, 'Henryorefe', 'Capto ex ipso robot servare victum tota die.', 'a.korsagerhausted@forum.dk', NULL, '89036629167', 'Robot est optimus via pro omnibus, qui spectat ad financial libertatem. https://orefe.blueliners07.de/orefe', NULL, '2022-06-08 06:57:45', '2022-06-08 06:57:45'),
(26, 'Henryorefe', 'Pecunia opus? Financial robot est tua solutio.', 'gwsamuelsen@forum.dk', NULL, '89039064057', 'Pretium non habetis? Quisque online. https://orefe.blueliners07.de/orefe', NULL, '2022-06-08 09:37:41', '2022-06-08 09:37:41'),
(27, 'Henryorefe', 'In ieiunas modo, ut vos peram crassus est hic.', 'yura.geimer@mailme.dk', NULL, '89035016599', 'Planto vestri laptop a financial instrumentum, cum hoc progressio. https://orefe.blueliners07.de/orefe', NULL, '2022-06-08 12:16:29', '2022-06-08 12:16:29'),
(28, 'Henryorefe', 'Online reditus est facillimus mores ut vos somnium adveho verus.', 't-walker@forum.dk', NULL, '89035370354', 'Nulla diam consequat? Sit Robot pecuniam pro te. https://orefe.blueliners07.de/orefe', NULL, '2022-06-08 14:56:03', '2022-06-08 14:56:03'),
(29, 'Henryorefe', 'Online referte sunt facillimus via financial libertatem.', 'qkimonsta@forum.dk', NULL, '89031336661', 'Obsidendam $1 hodie ad $1000 cras. https://orefe.blueliners07.de/orefe', NULL, '2022-06-08 17:36:06', '2022-06-08 17:36:06'),
(30, 'Henryorefe', 'Financial robot praestat omnibus stabilitatem et reditus.', 'duck@mikrotec.com', NULL, '89037915485', 'Non opus anymore dum Robot launched! https://orefe.blueliners07.de/orefe', NULL, '2022-06-08 20:08:03', '2022-06-08 20:08:03'),
(31, 'Henryorefe', 'Operam! Financial robot perducat vos milia!', 'shrf@mail-online.dk', NULL, '89038339940', 'Etiam sciat puer ad pecuniam. Facere vobis? https://orefe.blueliners07.de/orefe', NULL, '2022-06-08 23:05:27', '2022-06-08 23:05:27'),
(32, 'Henryorefe', 'Faciens pecuniam in rete facilius est nunc.', 'mchonda@forum.dk', NULL, '89035493876', 'Financial robot est elit formula invenitur. Discere magis de eo. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 01:45:04', '2022-06-09 01:45:04'),
(33, 'Henryorefe', 'Operam! Financial robot perducat vos milia!', 'idalinde@forum.dk', NULL, '89032027303', 'Planto vestri pecunia opus est tibi tota die. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 04:25:19', '2022-06-09 04:25:19'),
(34, 'Henryorefe', 'Online officium potest esse vere efficax, si vos utor is Robot.', 'frankras@forum.dk', NULL, '89034969249', 'Reprehendo ex novissima modo, ut a fantastic utilitatem. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 07:09:07', '2022-06-09 07:09:07'),
(35, 'Henryorefe', 'Milia illos leones,. Financial robot mos succurro vos facere!', 'myrna.noergaard@mail-online.dk', NULL, '89034090981', 'Capto ex ipso robot servare victum tota die. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 09:48:03', '2022-06-09 09:48:03'),
(36, 'Henryorefe', 'Financial Robot operatur in vobis, etiam cum tu somnum.', 'action_johnny@mail-online.dk', NULL, '89035353523', 'Addito reditus praesto est omnibus hac robot. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 12:28:21', '2022-06-09 12:28:21'),
(37, 'Henryorefe', 'Wow! Hoc Robot est, a tincidunt magna enim consectetur volutpat.', 'roberteggers2@mailme.dk', NULL, '89032704022', 'Turn $1 in $100 statim. Uti oeconomus Robot. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 15:08:38', '2022-06-09 15:08:38'),
(38, 'Henryorefe', 'Financial Robot est # 1 peritus quaestus.', 'blackspot@forum.dk', NULL, '89034594668', 'Financial Robot est futura opes et libertatem. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 17:45:29', '2022-06-09 17:45:29'),
(39, 'Henryorefe', 'Pecunia opus est, etiam cum somno.', 'hugtand@mail-online.dk', NULL, '89033203609', 'Invenire de facillimum pecuniam victum. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 20:26:52', '2022-06-09 20:26:52'),
(40, 'Henryorefe', 'Etiam sciat puer ad pecuniam. Hoc robot quod opus est!', 'marorinol@mailme.dk', NULL, '89034207100', 'Online officium et adducam vos a fantastic utilitatem. https://orefe.blueliners07.de/orefe', NULL, '2022-06-09 23:09:48', '2022-06-09 23:09:48'),
(41, 'Henryorefe', 'Addito reditus praesto est omnibus hac robot.', 'princejohn@forum.dk', NULL, '89036463568', 'Financial libertatem, quid est hoc robot praestat. https://orefe.blueliners07.de/orefe', NULL, '2022-06-10 01:50:28', '2022-06-10 01:50:28'),
(42, 'Henryorefe', 'Your computer can bring you additional income if you use this Robot.', 'mikkelmamd@forum.dk', NULL, '89034906290', 'Making money is very easy if you use the financial Robot. https://orefe.blueliners07.de/orefe', NULL, '2022-06-10 06:54:15', '2022-06-10 06:54:15'),
(43, 'Henryorefe', 'Earning money in the Internet is easy if you use Robot.', 'ditte.90@forum.dk', NULL, '89033605204', 'The fastest way to make your wallet thick is found. https://orefe.blueliners07.de/orefe', NULL, '2022-06-10 09:17:40', '2022-06-10 09:17:40'),
(44, 'Henryorefe', 'In ieiunas modo, ut vos peram crassus est hic.', 'claus.h.j@forum.dk', NULL, '89034815557', 'Buy omnia vis mereri pecuniam. https://orefe.blueliners07.de/orefe', NULL, '2022-06-10 15:19:31', '2022-06-10 15:19:31'),
(45, 'Sajao', 'awesome', 'admin@gmail.com', NULL, '123456789', 'hey this is testing so cool website i like it', NULL, '2022-12-21 12:30:58', '2022-12-21 12:30:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('034f583f-7eaa-42c2-a5e4-74d1deb7f380', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/99\",\"fas\":\"fa-file-alt\"}', NULL, '2023-01-05 12:05:31', '2023-01-05 12:05:31'),
('07a39a0a-d330-4e8b-bc1f-504efb7bb56f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/53\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 03:01:13', '2022-12-21 03:01:13'),
('093537eb-c8ad-4088-ad85-48b980ab3594', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/68\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 06:01:19', '2022-12-21 06:01:19'),
('0c52cb67-bfa7-4650-bd42-1cb7780baab4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/96\",\"fas\":\"fa-file-alt\"}', NULL, '2023-01-05 12:03:49', '2023-01-05 12:03:49'),
('0e1ed913-5558-44d7-929d-6b5f46f4f8d4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/85\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:05:03', '2022-12-21 11:05:03'),
('12cbf424-7302-4d0c-89e0-1bc7a5dd3843', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/93\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-30 12:52:53', '2022-12-30 12:52:53'),
('14de50ae-7f90-4373-91b6-8a6f04b48871', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/66\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 05:53:09', '2022-12-21 05:53:09'),
('1a688270-9121-4436-bc19-5b2085737803', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/71\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 08:39:19', '2022-12-21 08:39:19'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('30d4d8a0-11fe-401b-a435-86a0a5225482', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/80\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 10:43:31', '2022-12-21 10:43:31'),
('32f19161-9e2b-453d-b491-95637841ecd1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/59\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 04:51:21', '2022-12-21 04:51:21'),
('3537563c-aa8d-485f-94cd-fb05af45ab29', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/39\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:26:17', '2022-12-20 13:26:17'),
('35d515c1-11ce-4f33-a3e3-bbee00870bf5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/26\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 08:14:37', '2022-12-20 08:14:37'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('41151efd-8718-4946-bd69-151a1a996a5a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/34\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:15:40', '2022-12-20 13:15:40'),
('439ac49b-401c-4436-86b5-30134e060516', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-15 12:33:09', '2022-12-15 12:33:09'),
('44277543-3568-47d8-8662-21784877dd7d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/70\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 08:24:06', '2022-12-21 08:24:06'),
('444736fd-53fa-40df-ad02-ffba8bd2a4b0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/21\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 06:53:09', '2022-12-20 06:53:09'),
('460cc077-91a3-4ac8-838c-7cdb6138caec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/81\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 10:51:20', '2022-12-21 10:51:20'),
('46bb4f3b-d06a-48c8-bf7b-c893efd35f26', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/63\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 05:38:05', '2022-12-21 05:38:05'),
('479fa775-9668-4c2d-aa7b-67faa3a9f30b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/44\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:40:41', '2022-12-20 13:40:41'),
('47be5e2a-4444-4d08-929d-ffa6139ffff9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/51\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 03:00:38', '2022-12-21 03:00:38'),
('489d99e8-1750-45cd-88c4-12c701741010', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/24\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 07:20:21', '2022-12-20 07:20:21'),
('48d39cda-f99f-43bb-803c-c9bf8b3a6bfe', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/37\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:21:45', '2022-12-20 13:21:45'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('4ccf484f-2c62-4184-adb7-00b2f0b2ce59', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/40\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:27:24', '2022-12-20 13:27:24'),
('506f2276-d74d-4a14-b8b5-1e38fc9f1f67', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/97\",\"fas\":\"fa-file-alt\"}', NULL, '2023-01-05 12:04:19', '2023-01-05 12:04:19'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('554cd713-c802-4847-a8e5-eb7973a5f929', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-17 11:24:27', '2022-12-17 11:24:27'),
('555c51f4-db64-40b7-9b29-0c0ad7c570f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/56\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 03:16:37', '2022-12-21 03:16:37'),
('5561e424-940f-4288-98f7-82d6f1563aa9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/15\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-19 08:29:59', '2022-12-19 08:29:59'),
('57decc30-fbb0-4d2e-9383-5e08bf1a159b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/78\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 09:07:34', '2022-12-21 09:07:34'),
('5903a3ca-7caa-491b-9744-1e59930125c6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/47\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 14:01:45', '2022-12-20 14:01:45'),
('59993ee4-343e-4d58-98b2-3f635398330a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/49\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 14:29:35', '2022-12-20 14:29:35'),
('5a499946-f180-416e-a2c6-b03465a47e34', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/74\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 08:59:34', '2022-12-21 08:59:34'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('6044dc5c-0da9-4395-99d2-1ea1776c5d5f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/18\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-19 13:54:05', '2022-12-19 13:54:05'),
('61b24725-7937-4fea-9ddd-d75380588c74', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/41\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:28:43', '2022-12-20 13:28:43'),
('63443fe3-e5db-4c35-a807-86dca28b37ae', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/58\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 03:22:01', '2022-12-21 03:22:01'),
('64616a9f-d3ee-472a-8171-f78aebe5a30c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/43\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:38:52', '2022-12-20 13:38:52'),
('67a8a3c4-974a-4642-8f68-5827c046a51e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/32\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 12:47:12', '2022-12-20 12:47:12'),
('6bd2327a-5b24-418c-a3b9-a8e81490b2d9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/25\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 08:10:31', '2022-12-20 08:10:31'),
('6d3217b7-c35c-499c-a712-6e651588bf4f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/33\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:04:44', '2022-12-20 13:04:44'),
('70077d81-25cf-4c61-a97c-53bfca5efce4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/54\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 03:11:43', '2022-12-21 03:11:43'),
('701c3e67-aaae-4b58-8231-b69860ad683a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/87\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:12:01', '2022-12-21 11:12:01'),
('733dd287-db2a-4686-9cd0-10ed8b1c1da7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-16 06:17:02', '2022-12-16 06:17:02'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('760902a4-13f9-4bdf-8406-6a52a6ee082b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/42\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:33:24', '2022-12-20 13:33:24'),
('77127099-f377-4f1c-bc1b-41419357247d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/98\",\"fas\":\"fa-file-alt\"}', NULL, '2023-01-05 12:04:32', '2023-01-05 12:04:32'),
('798e4108-8e48-4d14-a5a1-8ad3ff8d77cd', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/17\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-19 13:51:31', '2022-12-19 13:51:31'),
('7a4e03aa-8652-4c33-b2c5-31eec589ba80', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/73\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 08:58:51', '2022-12-21 08:58:51'),
('7ac14219-08e1-49a5-849c-baa8e2a41679', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/48\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 14:16:52', '2022-12-20 14:16:52'),
('7fe980a9-188e-4d19-bcfa-716fde35316c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/52\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 03:00:49', '2022-12-21 03:00:49'),
('81bee8c9-5962-4f5c-96ab-2c7d969af8ec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-15 11:43:33', '2022-12-15 11:43:33'),
('82c197cc-16e8-4597-b528-aee6b9a2e8b9', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/60\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 04:52:10', '2022-12-21 04:52:10'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('891dd3ab-cc84-4a43-8046-fb361e7da526', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/72\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 08:39:59', '2022-12-21 08:39:59'),
('89983367-0744-44ce-8a8b-95717f908cce', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/38\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:26:07', '2022-12-20 13:26:07'),
('89b9fbc2-7c8c-4eb9-a560-65798cb42b49', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/69\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 08:16:15', '2022-12-21 08:16:15'),
('8a6ce928-816f-48f6-bf76-974271af2cb3', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-15 12:36:47', '2022-12-15 12:36:47'),
('8a84d0b5-188a-4fff-a6a2-62ab14475311', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/75\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 09:00:32', '2022-12-21 09:00:32'),
('8f2a6b83-9f1e-46e9-b942-27e9ed72e3fb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/29\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 12:26:45', '2022-12-20 12:26:45'),
('976450b9-8fd4-4588-b118-ab8a4f5f6236', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/35\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:15:58', '2022-12-20 13:15:58'),
('9cc4b2d2-d40e-42cd-90bd-22b7bc0a7cda', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/90\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:24:01', '2022-12-21 11:24:01'),
('9d3a9f5a-9b1b-4dbe-af24-0976c2a34796', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/64\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 05:38:24', '2022-12-21 05:38:24'),
('a1f159fd-9a8e-45fd-85ee-857a6423ae61', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/61\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 05:07:41', '2022-12-21 05:07:41'),
('a2a4670e-791e-43c7-acae-5c7303a08ac2', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/45\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:54:45', '2022-12-20 13:54:45'),
('a3e7881f-9cda-42bd-9a49-4385d90aa680', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/20\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 06:49:22', '2022-12-20 06:49:22'),
('a5083979-c9c5-43a8-86c0-cb21af37397e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 06:44:59', '2022-12-20 06:44:59'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('a9f91215-ed61-4557-a2ed-345a3a416207', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-19 08:19:23', '2022-12-19 08:19:23'),
('aac39290-2298-49f1-a4d0-224b2586c834', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/28\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 11:13:04', '2022-12-20 11:13:04'),
('ae47a041-d38f-4894-8bda-1f2b714cacc8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-15 11:40:29', '2022-12-15 11:40:29'),
('ae8d5bef-50ae-45d8-8ccb-5005e676f248', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/84\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:03:32', '2022-12-21 11:03:32'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('b38d3955-1acb-4abb-a8dd-4d7e294e69c8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/57\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 03:21:08', '2022-12-21 03:21:08'),
('b5c2d159-b922-43d9-aa81-efb4d5481f2c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/76\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 09:00:48', '2022-12-21 09:00:48'),
('b6263d0b-42bd-4dc1-8208-896be260c43f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/55\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 03:12:23', '2022-12-21 03:12:23'),
('b6c58fa2-0841-4e71-a31f-c3976bf38cf5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/100\",\"fas\":\"fa-file-alt\"}', NULL, '2023-01-05 12:11:32', '2023-01-05 12:11:32'),
('bb4bc197-8569-4ed1-ba84-ee6c1f1190db', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fas fa-comment\"}', NULL, '2022-12-16 06:27:24', '2022-12-16 06:27:24'),
('bea3d351-01b4-4603-b946-b2477d709b47', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-17 11:22:39', '2022-12-17 11:22:39'),
('c0df197a-8742-4c50-bd1a-7f82c7cb3e7f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/92\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:48:50', '2022-12-21 11:48:50'),
('c17f9eda-9c4d-4639-ab9c-f6de63ed55ac', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/83\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 10:57:53', '2022-12-21 10:57:53'),
('c1b7911f-8ca5-48a1-9009-ff79f19fcf22', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/23\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 06:56:39', '2022-12-20 06:56:39'),
('c337b449-33c1-401b-b06d-7e6218ee5deb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/82\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 10:54:15', '2022-12-21 10:54:15'),
('cc53a662-cf46-4a49-b4b0-81657e67921b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/101\",\"fas\":\"fa-file-alt\"}', NULL, '2023-01-05 12:14:36', '2023-01-05 12:14:36'),
('ce11bd3b-ffd6-4fa9-8cd7-3ea5a9c63aa4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/30\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 12:29:28', '2022-12-20 12:29:28'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('d45652ec-3138-4de1-8604-87581207f4b8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/16\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-19 08:53:47', '2022-12-19 08:53:47'),
('d60109f0-5181-4351-bfee-0a0aa8cd88bf', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/62\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 05:16:40', '2022-12-21 05:16:40'),
('d7daec55-27fe-4c32-bd5d-52c5fd9883bf', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/77\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 09:04:32', '2022-12-21 09:04:32'),
('d859892f-6ba9-4375-b478-aebdd2106dc5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/79\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 09:09:54', '2022-12-21 09:09:54'),
('d9c49f7a-05cb-483d-847e-0290e83fd02c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/86\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:08:00', '2022-12-21 11:08:00'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e009b81b-af2b-49bf-811a-13de61897479', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/95\",\"fas\":\"fa-file-alt\"}', NULL, '2023-01-05 11:25:24', '2023-01-05 11:25:24'),
('e1aa2537-470a-4740-884c-0581b86a9c23', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/31\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 12:46:35', '2022-12-20 12:46:35'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('e2ee97a7-fd26-4b7d-8512-47c737a1ecc6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/27\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 09:36:08', '2022-12-20 09:36:08'),
('e44f19ce-3e01-4640-9c43-bdffc427ddae', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-15 11:44:52', '2022-12-15 11:44:52'),
('e6424b84-a2fc-46fc-bbe9-9f6fd78fe51d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/88\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:16:36', '2022-12-21 11:16:36'),
('ebe57203-43cc-4873-823b-72d68d110305', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/50\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 02:56:38', '2022-12-21 02:56:38'),
('ec23845d-6bf4-44dd-a306-5de4cae3b58a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/46\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:57:28', '2022-12-20 13:57:28'),
('f211ff13-c2e2-4515-adba-506ca811822c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/91\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:36:57', '2022-12-21 11:36:57'),
('f3b1a1bf-7d8c-48e5-ba39-ef81d3490d85', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/67\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 05:56:48', '2022-12-21 05:56:48'),
('f4587c1a-378a-420d-bdff-f03534d29bfd', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/65\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 05:49:07', '2022-12-21 05:49:07'),
('f7fd959c-5bc5-4a6b-84c5-1d52300f78da', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/36\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 13:19:54', '2022-12-20 13:19:54'),
('fa1b97f1-fa4c-413d-9d50-2eb55e221e16', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/94\",\"fas\":\"fa-file-alt\"}', NULL, '2023-01-02 23:11:11', '2023-01-02 23:11:11'),
('fef720a9-0874-4d7e-8ef5-24530873ed98', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/22\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-20 06:55:56', '2022-12-20 06:55:56'),
('ffd24ae7-06ec-47af-a4b9-7c1a5aba6cdd', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/89\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-21 11:18:47', '2022-12-21 11:18:47'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(93, 'ORD-WMKYUZ2VLM', 34, 60.00, NULL, NULL, 60.00, 1, 'cod', 'unpaid', 'delivered', 'Subhi', 'Yadav', 'subhi@gmail.com', '123456789', 'IN', '244302', 'Durga colony', 'Astha super market', '2022-12-30 12:52:53', '2023-01-02 14:49:26'),
(94, 'ORD-GSTFAUXUZX', 34, 140.00, NULL, NULL, 140.00, 1, 'cod', 'unpaid', 'process', 'Ajay', 'Yadav', 'ajayyadav2903@gmail.com', '123456789', 'NP', '244302', 'Delhi', 'Astha super market', '2023-01-02 23:11:11', '2023-01-02 23:11:40'),
(95, 'ORD-R3EGAR4M8I', 34, 148.00, NULL, NULL, 148.00, 1, 'paypal', 'paid', 'new', 'ajay', 'yadav', 'aa@gmail.com', '1234567890', 'NP', '244302', 'aa', '222', '2023-01-05 11:25:24', '2023-01-05 11:26:27'),
(96, 'ORD-AALGDAWAQF', 34, 140.00, NULL, NULL, 140.00, 1, 'paypal', 'unpaid', 'new', 'a', 'a', 'a@gmail.com', '1211212121212121', 'NP', 's', 'a', 's', '2023-01-05 12:03:49', '2023-01-05 12:03:49'),
(97, 'ORD-8GLTUWVP01', 34, 140.00, NULL, NULL, 140.00, 1, 'paypal', 'unpaid', 'new', 'a', 'a', 'a@gmail.com', '1211212121212121', 'NP', 's', 'a', 's', '2023-01-05 12:04:19', '2023-01-05 12:04:19'),
(98, 'ORD-25MVXCCBN5', 34, 140.00, NULL, NULL, 140.00, 1, 'paypal', 'unpaid', 'new', 'a', 'a', 'a@gmail.com', '1211212121212121', 'NP', 's', 'a', 's', '2023-01-05 12:04:32', '2023-01-05 12:04:32'),
(99, 'ORD-U1OI3YZB2I', 34, 148.00, NULL, NULL, 148.00, 1, 'paypal', 'paid', 'new', 's', 's', 'd@gmail.com', '2323232332', 'NP', 'd', 's', 'd', '2023-01-05 12:05:31', '2023-01-05 12:05:53'),
(100, 'ORD-CREEGEDWIT', 34, 105.00, NULL, NULL, 105.00, 1, 'cod', 'unpaid', 'new', 'a', 'f', 'ds@gmail.com', '323222222222222', 'NP', '232333', 'sds', 'd', '2023-01-05 12:11:32', '2023-01-05 12:11:32'),
(101, 'ORD-ZQCZUSG2ZH', 34, 105.00, NULL, NULL, 105.00, 1, 'cod', 'unpaid', 'process', 's', 'd', 's@gmail.com', '21222121', 'NP', 'f333', 'd', 'd', '2023-01-05 12:14:36', '2023-01-05 12:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Where does it come from?', 'where-does-it-come-from', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text.&nbsp;</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</span><br></p>', '/storage/photos/1/Blog/blog1.jpg', '2020,Visit nepal 2020', 1, NULL, NULL, 'active', '2020-08-14 01:55:55', '2020-08-14 04:29:56'),
(2, 'Where can I get some?', 'where-can-i-get-some', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader</span><br></h2>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, '/storage/photos/1/Blog/blog2.jpg', 'Enjoy', 2, NULL, 1, 'active', '2020-08-14 01:58:52', '2020-08-14 07:08:14'),
(3, 'The standard Lorem Ipsum passage, used since the 1500s', 'the-standard-lorem-ipsum-passage-used-since-the-1500s', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', '', 3, NULL, NULL, 'active', '2020-08-14 02:59:33', '2020-08-14 04:29:44'),
(5, 'The standard Lorem Ipsum passage,', 'the-standard-lorem-ipsum-passage', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '/storage/photos/1/Blog/blog2.jpg', ',Enjoy,2020,Visit nepal 2020', 1, NULL, 1, 'active', '2020-08-15 06:58:45', '2020-08-15 06:58:45'),
(6, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', 'Enjoy,2020', 2, NULL, 1, 'active', '2020-08-17 20:54:19', '2020-08-17 20:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 'contrary', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
(2, 'Electronics', 'richard', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00'),
(3, 'Cloths', 'cloths', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(5, 'Post Category', 'post-category', 'active', '2020-08-15 06:59:04', '2020-08-15 06:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, NULL, 2, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, NULL, 2, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, 2, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, NULL, 5, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, NULL, 3, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, NULL, 3, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
(8, 1, 6, 'goooooood', 'active', NULL, NULL, '2022-12-16 06:27:24', '2022-12-16 06:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(2, '2020', '2020', 'active', '2020-08-14 01:54:09', '2020-08-14 01:54:09'),
(3, 'Visit nepal 2020', 'visit-nepal-2020', 'active', '2020-08-14 01:54:33', '2020-08-14 01:54:33'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, 'Cream Of Broccoli Soup', 'cream-of-broccoli-soup', 'Cream Of Broccoli Soup Cream Of Broccoli Soup\r\n Cream Of Broccoli Soup', 'Cream Of Broccoli Soup', '/storage/photos/34/Soup/Cream Of Broccoli Soup.png', 1, '', 'default', 'active', 170.00, 0.00, 0, 17, NULL, 9, '2022-12-29 13:03:47', '2022-12-29 13:07:45'),
(12, 'Cream Of Mushroom Soup', 'cream-of-mushroom-soup', 'Cream Of Mushroom Soup', 'Cream Of Mushroom Soup', '/storage/photos/34/Soup/Cream Of Mushroom Soup.png', 1, '', 'default', 'active', 140.00, 0.00, 0, 17, NULL, NULL, '2022-12-29 13:11:09', '2022-12-29 13:11:09'),
(13, 'Aloo Kulcha', 'aloo-kulcha', 'Aloo Kulcha', 'Aloo Kulcha', '/storage/photos/34/Breads/Breads.png', 1, '', 'default', 'active', 80.00, 0.00, 0, 20, NULL, NULL, '2022-12-29 13:16:31', '2022-12-29 13:16:31'),
(14, 'Butter Naan', 'butter-naan', 'Butter Naan', 'Butter Naan', '/storage/photos/34/Breads/Butter Naan.png', 1, '', 'default', 'active', 80.00, 0.00, 0, 20, NULL, NULL, '2022-12-29 13:27:46', '2022-12-29 13:27:46'),
(15, 'Jeera Rice', 'jeera-rice', 'Jeera Rice', 'Jeera Rice', '/storage/photos/34/Jeera Rice/Jeera Rice.png', 1, '', 'default', 'active', 155.00, 5.00, 0, 21, NULL, NULL, '2022-12-29 13:33:40', '2022-12-29 13:33:40'),
(16, 'Cheese Garlic Breads Pizza[8 Inches]', 'cheese-garlic-breads-pizza8-inches', 'Cheese Garlic Breads Pizza[8 Inches]', 'Cheese Garlic Breads Pizza[8 Inches]', '/storage/photos/34/Pizza & Pasta/Cheese Garlic Breads Pizza[8 Inches].png', 1, '', 'default', 'active', 260.00, 4.00, 0, 23, NULL, NULL, '2022-12-29 13:42:41', '2022-12-29 13:42:41'),
(17, 'Amrican Delight Dosa', 'amrican-delight-dosa', 'Amrican Delight Dosa', 'Amrican Delight Dosa', '/storage/photos/34/South Indian/American Delight Dosa.png', 1, '', 'default', 'active', 220.00, 6.00, 0, 24, NULL, NULL, '2022-12-29 13:49:10', '2022-12-29 13:49:10'),
(18, 'Aloo Bechara Burger', 'aloo-bechara-burger', 'Aloo Bechara Burger', 'Aloo Bechara Burger', '/storage/photos/34/Burger/Aloo Bechara Burger.png', 1, '', 'default', 'active', 90.00, 10.00, 0, 25, NULL, NULL, '2022-12-29 13:52:57', '2022-12-29 13:52:57'),
(19, 'Afghani Chaap Wrap', 'afghani-chaap-wrap', 'Afghani Chaap Wrap', 'Afghani Chaap Wrap', '/storage/photos/34/Wraps/Afghani Chaap Wrap.png', 1, '', 'default', 'active', 170.00, 3.00, 0, 26, NULL, NULL, '2022-12-29 13:57:10', '2022-12-29 13:57:10'),
(20, 'Pao Bhaji', 'pao-bhaji', 'Pao Bhaji', 'Pao Bhaji', '/storage/photos/34/Main Course/Pao Bhaji.png', 1, '', 'default', 'active', 120.00, 15.00, 1, 19, NULL, NULL, '2022-12-29 14:01:02', '2022-12-29 14:01:02'),
(21, 'Cryspy Momos', 'cryspy-momos', 'Cryspy Momos', 'Cryspy Momos', '/storage/photos/34/Dim Sum/Cryspy Momos.png', 1, '', 'hot', 'active', 180.00, 2.00, 1, 29, NULL, NULL, '2022-12-29 14:07:46', '2022-12-29 14:07:46'),
(22, 'Corn & Mushroom Noodles', 'corn-mushroom-noodles', 'Corn & Mushroom Noodles', 'Corn & Mushroom Noodles', '/storage/photos/34/Rice and Noodles/Corn & Mushroom Noodles.png', 1, '', 'default', 'active', 230.00, 6.00, 1, 22, NULL, NULL, '2022-12-29 14:11:53', '2022-12-29 14:11:53'),
(23, 'Regular Thali', 'regular-thali', 'Regular Thali', 'Regular Thali', '/storage/photos/34/Thali/Regular Thali.png', 1, '', 'default', 'active', 320.00, 3.00, 0, 33, NULL, NULL, '2022-12-29 14:57:34', '2022-12-29 14:57:34'),
(24, 'The Golden Special Thali', 'the-golden-special-thali', 'The Golden Special Thali', 'The Golden Special Thali', '/storage/photos/34/Thali/The Golden Special Thali.png', 1, '', 'hot', 'active', 410.00, 5.00, 0, 33, NULL, NULL, '2022-12-29 14:58:58', '2022-12-29 14:58:58'),
(25, 'Rasgulla With Rabri', 'rasgulla-with-rabri', 'Rasgulla With Rabri', 'Rasgulla With Rabri', '/storage/photos/34/Dessert/Rasgulla With Rabri.png', 1, '', 'hot', 'active', 105.00, 0.00, 0, 32, NULL, NULL, '2022-12-29 15:06:24', '2022-12-29 15:06:24'),
(26, 'Firni', 'firni', 'Firni', 'Firni', '/storage/photos/34/Dessert/Firni.png', 1, '', 'default', 'active', 148.00, 0.00, 0, 32, NULL, NULL, '2022-12-29 15:08:14', '2022-12-29 15:08:14'),
(27, 'Masala Papad', 'masala-papad', 'Masala Papad', 'Masala Papad', '/storage/photos/34/Salad/Masala Papad.png', 0, '', 'hot', 'active', 60.00, 0.00, 0, 31, NULL, NULL, '2022-12-29 15:14:17', '2023-01-02 14:49:26'),
(28, 'Green Salad', 'green-salad', 'Green Salad', 'Green Salad', '/storage/photos/34/Salad/Green Salad.png', 1, '', 'default', 'active', 105.00, 0.00, 0, 31, NULL, NULL, '2022-12-29 15:15:43', '2022-12-29 15:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
(2, NULL, NULL, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Imitation Jewellery: Prettiest Trends For All Times,\r\nFASHION JEWELLERY\r\n\r\nAt #Sajaoo you can buy Designer Artificial Costume Jewellery Online at budget Rates. \r\n\r\nWe provide Premium Quality Indian Traditional & Fusion Fashion Jewellery which are handcrafted in India and includes styles like Temple Jewellery, Kundan Jewellery, CZ Jewellery, Polki Jewellery, Antique Jewellery, Fabric Jewellery and many more variants.', 'Sajaoo is mainly focused on traditional indian jewellery which are look alike to real gold/diamond jewellery.Imitation jewellery from India is one of the most popular accessories around the world today for a reason. Indian culture celebrates color, life and extravagance and as such the jewellery worn, especially for special occasions, is supposed to be quite heavy and gorgeous.', '/storage/photos/34/logo/Asset-20@4x.png', '/storage/photos/34/logo/Asset-20@4x.png', 'Delhi', 'coming soon', 'info@thegoldenspoonsbl.com', NULL, '2022-12-30 08:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kahtmandu', '100.00', 'active', '2020-08-14 04:22:17', '2020-08-14 04:22:17'),
(2, 'Out of valley', '300.00', 'active', '2020-08-14 04:22:41', '2020-08-14 04:22:41'),
(3, 'Pokhara', '400.00', 'active', '2020-08-15 06:54:04', '2020-08-15 06:54:04'),
(4, 'Dharan', '400.00', 'active', '2020-08-17 20:50:48', '2020-08-17 20:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ajay yadav', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/Screenshot 2022-12-10 at 12.18.32 AM.png', 'admin', NULL, NULL, 'active', 'rBx84fLFNOP4e4leOeJV9YzI7VcOJCuMdjYABE76JviITHY2zHTmJjEHsoQG', NULL, '2022-12-13 08:58:34'),
(32, 'Ajay', 'ajayyadav2903@gmail.com', NULL, '$2y$10$D1fpUlfGwsozesTOqRUDTez.KuwC.FxDZGp/z57wBpTGw28b9BjPO', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-16 06:15:09', '2022-12-16 06:15:09'),
(33, 'Sajaoo', 'sajao@gmail.com', NULL, '$2y$10$WmHCET7VFBLmjsoguKhyLOFNU19ewXHnsPsVKfIunUcUpWyjKGx2m', NULL, 'admin', NULL, NULL, 'active', NULL, '2022-12-21 13:03:16', '2022-12-21 13:03:16'),
(34, 'GoldenSpoon', 'goldenspoon@gmail.com', NULL, '$2y$10$BopKkAw6AieIkWm21vzCOeVrme.4DMOs89Hh3kRyV4TBtYjA0Cg8a', NULL, 'admin', NULL, NULL, 'active', NULL, '2022-12-29 02:03:44', '2022-12-29 02:03:44'),
(35, 'Ajay', 'ajay@gmail.com', NULL, '$2y$10$/6UFxhmZV.c8Ifw1Khyu7uZDiWEYdJPfYrOENyWvms8g.rB0L4Kme', NULL, 'user', NULL, NULL, 'active', NULL, '2023-01-05 09:45:44', '2023-01-05 09:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
