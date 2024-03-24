-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2021 at 02:20 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digikala_apparel`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_apparel_amazing`
--

CREATE TABLE `category_apparel_amazing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `property1` int(11) DEFAULT NULL,
  `property2` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_apparel_amazing`
--

INSERT INTO `category_apparel_amazing` (`id`, `product_id`, `category_id`, `subCategory_id`, `childCategory_id`, `status`, `property1`, `property2`, `created_at`, `updated_at`) VALUES
(1, '3', '1', '1', '7', '1', 5, 5, NULL, NULL),
(2, '4', '1', '1', '7', '1', 7, 10, NULL, NULL),
(3, '11', '1', '18', '28', '1', NULL, 0, NULL, NULL),
(4, '4', '1', '1', '7', '1', 7, 11, NULL, NULL),
(5, '2', '1', '2', '5', '1', 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_apparel_banner`
--

CREATE TABLE `category_apparel_banner` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_apparel_banner`
--

INSERT INTO `category_apparel_banner` (`id`, `img`, `title`, `link`, `type`, `created_at`, `updated_at`) VALUES
(1, 'categorypage/apparel/2021/6/3f50a565fd2020696deb374d3e26aed37de655d0_1601820141.jpg', 'tishirt', 'tishirt', '0', NULL, NULL),
(2, 'categorypage/apparel/2021/6/58b2f8dfcad5833c2d4729c2321e03386df51b79_1601820124.jpg', '2', '2', '0', NULL, NULL),
(3, 'categorypage/apparel/2021/6/77522b95dbb511500da50a8134ca486ca18ce587_1601820104.jpg', '3', '3', '0', NULL, NULL),
(4, 'categorypage/apparel/2021/6/a1dda44d88f3a71b7b6425e15084ef357ec7c5a9_1601820164.jpg', '4', '4', '0', NULL, NULL),
(5, 'categorypage/apparel/2021/6/3.jpg', 'shoessss', 'sh', '1', NULL, NULL),
(6, 'categorypage/apparel/2021/6/8ec34057542920b2e79857e206ddade0b040e345_1623232801.jpg', 'cool', 'cool', '1', NULL, NULL),
(7, 'categorypage/apparel/2021/6/5069bfd6cd93c84d3838769d7aa32fd1c6d18581_1599283793.jpg', 'ساعت', 'ساعت', '1', NULL, NULL),
(8, 'categorypage/apparel/2021/6/f5ee844ce65bfa543d664f6c4ba3bfe7d5273e5f_1599283879.jpg', 'شال', 'شال', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_apparel_brand`
--

CREATE TABLE `category_apparel_brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_apparel_brand`
--

INSERT INTO `category_apparel_brand` (`id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, NULL),
(2, '3', NULL, NULL),
(3, '5', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_apparel_product_swiper`
--

CREATE TABLE `category_apparel_product_swiper` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_apparel_product_swiper`
--

INSERT INTO `category_apparel_product_swiper` (`id`, `title_id`, `product_id`, `category_id`, `subCategory_id`, `childCategory_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '2', '1', '2', '5', '1', NULL, NULL),
(2, '1', '3', '1', '1', '7', '1', NULL, NULL),
(3, '1', '9', '1', '1', '19', '0', NULL, NULL),
(4, '1', '10', '1', '1', '19', '1', NULL, NULL),
(5, '1', '2', '1', '2', '5', '1', NULL, NULL),
(6, '1', '3', '1', '1', '7', '1', NULL, NULL),
(7, '1', '9', '1', '1', '19', '0', NULL, NULL),
(8, '1', '10', '1', '1', '19', '1', NULL, NULL),
(9, '2', '2', '1', '2', '5', '1', NULL, NULL),
(10, '2', '3', '1', '1', '7', '1', NULL, NULL),
(11, '2', '9', '1', '1', '19', '0', NULL, NULL),
(12, '2', '10', '1', '1', '19', '1', NULL, NULL),
(13, '2', '2', '1', '2', '5', '1', NULL, NULL),
(14, '2', '3', '1', '1', '7', '1', NULL, NULL),
(15, '2', '9', '1', '1', '19', '0', NULL, NULL),
(16, '2', '10', '1', '1', '19', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_apparel_slider`
--

CREATE TABLE `category_apparel_slider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_apparel_slider`
--

INSERT INTO `category_apparel_slider` (`id`, `img`, `title`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'categorypage/apparel/2021/6/74d2cc8fecf1dc16c9aae90c160176791782275e_1599282765.jpg', 'انواع محصولات', 'product', '1', NULL, NULL),
(2, 'categorypage/apparel/2021/6/bf7a32ea7ef89b4a431797cee395ed475783c438_1623157769.jpg', 'یک اتفاق هیجان انگیز', 'اتفاق', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_apparel_title_swiper`
--

CREATE TABLE `category_apparel_title_swiper` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_apparel_title_swiper`
--

INSERT INTO `category_apparel_title_swiper` (`id`, `title`, `link`, `created_at`, `updated_at`) VALUES
(1, 'لباس های زنانه بهاری', 'lebza', NULL, NULL),
(2, 'لباس های مردانه بهاری', '/mdba', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(44, '2014_10_12_000000_create_users_table', 1),
(45, '2014_10_12_100000_create_password_resets_table', 1),
(46, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(47, '2019_08_19_000000_create_failed_jobs_table', 1),
(48, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(49, '2020_05_21_100000_create_teams_table', 1),
(50, '2020_05_21_200000_create_team_user_table', 1),
(51, '2020_05_21_300000_create_team_invitations_table', 1),
(52, '2021_03_13_133638_create_categories_table', 1),
(53, '2021_03_15_151924_create_sub_categories_table', 1),
(54, '2021_03_16_155421_create_sessions_table', 1),
(55, '2021_03_16_173110_create_child_categories_table', 1),
(56, '2021_03_17_064213_create_logs_table', 1),
(57, '2021_03_19_122945_create_products_table', 1),
(58, '2021_03_23_103459_create_brands_table', 1),
(59, '2021_03_23_132053_create_colors_table', 1),
(60, '2021_03_23_173003_create_galleries_table', 1),
(61, '2021_03_25_202358_create_warranties_table', 1),
(62, '2021_03_25_205953_create_product_sellers_table', 1),
(63, '2021_03_26_122343_create_attributes_table', 1),
(64, '2021_03_26_161433_create_attribute_values_table', 1),
(65, '2021_04_03_134833_create_setting_footers_table', 1),
(66, '2021_04_03_144527_create_pages_table', 1),
(67, '2021_04_06_132649_create_footer_inner_boxes_table', 1),
(68, '2021_04_06_140115_create_footer_link_ones_table', 1),
(69, '2021_04_06_140127_create_footer_link_twos_table', 1),
(70, '2021_04_06_140154_create_footer_link_threes_table', 1),
(71, '2021_04_06_164101_create_footer_link_titles_table', 1),
(72, '2021_04_07_091028_create_news_letters_table', 1),
(73, '2021_04_07_132154_create_socials_table', 1),
(74, '2021_04_07_165236_create_footer_titles_table', 1),
(75, '2021_04_07_182343_create_footer_partners_table', 1),
(76, '2021_04_10_054255_create_site_headers_table', 1),
(77, '2021_04_27_050723_create_menus_table', 1),
(78, '2021_04_28_133659_create_ads_categories_table', 1),
(79, '2021_05_03_195610_create_banners_table', 1),
(80, '2021_05_03_212647_create_sliders_table', 1),
(81, '2021_05_03_231048_create_special_products_table', 1),
(82, '2021_05_06_094343_create_title_category_indices_table', 1),
(83, '2021_05_07_030522_create_category_indices_table', 1),
(84, '2021_05_13_064239_create_product_new_selecteds_table', 1),
(85, '2021_05_13_070914_create_product_selecteds_table', 1),
(86, '2021_05_18_100457_create_category_electronic_slider_table', 1),
(87, '2021_05_18_120706_create_category_electronic_amazing_table', 2),
(88, '2021_05_27_160307_create_category_electronic_banner_table', 3),
(89, '2021_06_01_035418_create_category_electronic_title_swiper_table', 4),
(90, '2021_06_01_035506_create_category_electronic_product_swiper_table', 4),
(91, '2021_06_10_070803_create_category_vehicle_slider_table', 5),
(92, '2021_06_10_070831_create_category_vehicle_amazing_table', 5),
(93, '2021_06_10_070854_create_category_vehicle_banner_table', 5),
(94, '2021_06_10_070920_create_category_vehicle_title_swiper_table', 5),
(95, '2021_06_10_070935_create_category_vehicle_product_swiper_table', 5),
(96, '2021_06_13_070947_create_category_apparel_slider_table', 6),
(97, '2021_06_13_071007_create_category_apparel_amazing_table', 6),
(98, '2021_06_13_071044_create_category_apparel_banner_table', 6),
(99, '2021_06_13_071056_create_category_apparel_title_swiper_table', 6),
(100, '2021_06_13_071115_create_category_apparel_product_swiper_table', 6),
(101, '2021_06_13_071128_create_category_apparel_brand_table', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_apparel_amazing`
--
ALTER TABLE `category_apparel_amazing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_apparel_banner`
--
ALTER TABLE `category_apparel_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_apparel_brand`
--
ALTER TABLE `category_apparel_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_apparel_product_swiper`
--
ALTER TABLE `category_apparel_product_swiper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_apparel_slider`
--
ALTER TABLE `category_apparel_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_apparel_title_swiper`
--
ALTER TABLE `category_apparel_title_swiper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_apparel_amazing`
--
ALTER TABLE `category_apparel_amazing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category_apparel_banner`
--
ALTER TABLE `category_apparel_banner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category_apparel_brand`
--
ALTER TABLE `category_apparel_brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_apparel_product_swiper`
--
ALTER TABLE `category_apparel_product_swiper`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `category_apparel_slider`
--
ALTER TABLE `category_apparel_slider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_apparel_title_swiper`
--
ALTER TABLE `category_apparel_title_swiper`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
