-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2021 at 04:24 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digikala1400_vehicle`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_vehicle_amazing`
--

CREATE TABLE `category_vehicle_amazing` (
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

-- --------------------------------------------------------

--
-- Table structure for table `category_vehicle_banner`
--

CREATE TABLE `category_vehicle_banner` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_vehicle_product_swiper`
--

CREATE TABLE `category_vehicle_product_swiper` (
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

-- --------------------------------------------------------

--
-- Table structure for table `category_vehicle_slider`
--

CREATE TABLE `category_vehicle_slider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_vehicle_title_swiper`
--

CREATE TABLE `category_vehicle_title_swiper` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(43, '2014_10_12_000000_create_users_table', 1),
(44, '2014_10_12_100000_create_password_resets_table', 1),
(45, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(46, '2019_08_19_000000_create_failed_jobs_table', 1),
(47, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(48, '2020_05_21_100000_create_teams_table', 1),
(49, '2020_05_21_200000_create_team_user_table', 1),
(50, '2020_05_21_300000_create_team_invitations_table', 1),
(51, '2021_10_02_120003_create_categories_table', 1),
(52, '2021_10_03_233031_create_sub_categories_table', 1),
(53, '2021_10_04_120551_create_sessions_table', 1),
(54, '2021_10_04_133832_create_child_categories_table', 1),
(55, '2021_10_05_101657_create_logs_table', 1),
(56, '2021_10_06_085201_create_products_table', 1),
(57, '2021_10_07_193553_create_brands_table', 1),
(58, '2021_10_07_222949_create_colors_table', 1),
(59, '2021_10_08_174928_create_galleries_table', 1),
(60, '2021_10_08_222001_create_warranties_table', 1),
(61, '2021_10_09_000345_create_product_sellers_table', 1),
(62, '2021_10_09_102021_create_attributes_table', 1),
(63, '2021_10_09_114709_create_attribute_values_table', 1),
(64, '2021_10_13_110842_create_setting_footers_table', 1),
(65, '2021_10_13_170152_create_pages_table', 1),
(66, '2021_10_13_172045_create_footer_inner_boxes_table', 1),
(67, '2021_10_13_175254_create_footer_link_ones_table', 1),
(68, '2021_10_13_175306_create_footer_link_twos_table', 1),
(69, '2021_10_13_175320_create_footer_link_threes_table', 1),
(70, '2021_10_14_124837_create_news_letters_table', 1),
(71, '2021_10_14_132013_create_socials_table', 1),
(72, '2021_10_14_170033_create_footer_titles_table', 1),
(73, '2021_10_14_175209_create_footer_partners_table', 1),
(74, '2021_10_14_203741_create_site_headers_table', 1),
(75, '2021_10_14_221809_create_footer_link_titles_table', 1),
(76, '2021_10_17_164635_create_menus_table', 1),
(77, '2021_10_17_184446_create_ads_categories_table', 1),
(78, '2021_10_18_122422_create_banners_table', 1),
(79, '2021_10_18_130251_create_sliders_table', 1),
(80, '2021_10_18_201044_create_special_products_table', 1),
(81, '2021_10_20_000046_create_title_category_indices_table', 1),
(82, '2021_10_20_003828_create_category_indices_table', 1),
(83, '2021_10_20_185538_create_product_new_selecteds_table', 1),
(84, '2021_10_20_193227_create_product_selecteds_table', 1),
(85, '2021_11_06_141915_create_category_electronic_slider_table', 1),
(86, '2021_11_06_153643_create_category_electronic_amazing_table', 2),
(87, '2021_11_06_170039_create_category_electronic_banner_table', 3),
(88, '2021_11_07_085234_create_category_electronic_title_swiper_table', 4),
(89, '2021_11_07_085434_create_category_electronic_product_swiper_table', 4),
(90, '2021_11_07_093406_create_category_vehicle_slider_table', 5),
(91, '2021_11_07_093509_create_category_vehicle_amazing_table', 5),
(92, '2021_11_07_093613_create_category_vehicle_banner_table', 5),
(93, '2021_11_07_093643_create_category_vehicle_title_swiper_table', 5),
(94, '2021_11_07_093700_create_category_vehicle_product_swiper_table', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_vehicle_amazing`
--
ALTER TABLE `category_vehicle_amazing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_vehicle_banner`
--
ALTER TABLE `category_vehicle_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_vehicle_product_swiper`
--
ALTER TABLE `category_vehicle_product_swiper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_vehicle_slider`
--
ALTER TABLE `category_vehicle_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_vehicle_title_swiper`
--
ALTER TABLE `category_vehicle_title_swiper`
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
-- AUTO_INCREMENT for table `category_vehicle_amazing`
--
ALTER TABLE `category_vehicle_amazing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_vehicle_banner`
--
ALTER TABLE `category_vehicle_banner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_vehicle_product_swiper`
--
ALTER TABLE `category_vehicle_product_swiper`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_vehicle_slider`
--
ALTER TABLE `category_vehicle_slider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_vehicle_title_swiper`
--
ALTER TABLE `category_vehicle_title_swiper`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
