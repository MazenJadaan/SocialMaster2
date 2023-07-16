-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2023 at 12:58 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_media`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `comment` longtext NOT NULL,
  `post_owner` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `post_owner` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2023_05_21_192249_create_reset_code_passwords_table', 1),
(11, '2023_05_29_084917_create_user_profiles_table', 1),
(12, '2023_06_01_110133_create_posts_table', 1),
(13, '2023_06_01_111603_create_comments_table', 1),
(14, '2023_06_01_112827_create_likes_table', 1),
(15, '2023_06_01_113341_create_saveposts_table', 1),
(16, '2023_06_01_113636_create_shareposts_table', 1),
(17, '2023_06_01_114004_create_payedposts_table', 1),
(18, '2023_06_01_114515_create_photos_table', 1),
(19, '2023_06_01_114734_create_videos_table', 1),
(20, '2023_06_01_120053_create_userfollowers_table', 1),
(21, '2023_06_01_120438_create_stories_table', 1),
(22, '2023_06_01_121442_create_officialaccounts_table', 1),
(23, '2023_06_01_121930_create_moreaccountes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `moreaccountes`
--

CREATE TABLE `moreaccountes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_profile_id` int(10) UNSIGNED NOT NULL,
  `link` varchar(191) NOT NULL,
  `type` enum('facebook','instagram') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('1b8df5bcc240e8aa3377c55b463c9af5c2c4afd5eee565928abb829404d542e72c8b6335c60fec8d', 2, 1, 'User Api Token', '[]', 0, '2023-07-15 16:04:24', '2023-07-15 16:04:24', '2024-07-15 19:04:24'),
('43f560fa2384705d2eed9ad224120cbfc0b467cddbc4aabbbfcfdce854513b04a0676ece00e2dd87', 2, 1, 'User Api Token', '[]', 0, '2023-07-15 20:52:41', '2023-07-15 20:52:41', '2024-07-15 23:52:41'),
('5714e33d542562f0845eca63a00ad99782268929f581878b990f7f3a1c17d31f9f23a146cd0e8df6', 2, 1, 'User Api Token', '[]', 0, '2023-07-15 17:36:26', '2023-07-15 17:36:26', '2024-07-15 20:36:26'),
('5a59cc93e4a9790fbddc8272b55ca37b2ac57245d8bd9c466755d1890441abd7e5bf2ea8a0560050', 2, 1, 'User Api Token', '[]', 0, '2023-07-15 21:11:43', '2023-07-15 21:11:43', '2024-07-16 00:11:43'),
('8135649e07ffbd1c523da134445ae011c5e80c93375746a24443e611976436214d765aab5d0d3134', 1, 1, 'User Api Token', '[]', 0, '2023-07-16 09:28:01', '2023-07-16 09:28:01', '2024-07-16 12:28:01'),
('836bfe5696969438e34c0fea2a748a20df4def9bef1f20202eb32c63086be36f82106721afd4a0ef', 1, 1, 'User Api Token', '[]', 0, '2023-07-16 10:00:28', '2023-07-16 10:00:28', '2024-07-16 13:00:28'),
('83aa706e84fc6c33e5ebdbce1bfb61f230a85e78edfe18dab352c2f64038b9dd4062f901b7460b48', 2, 1, 'User Api Token', '[]', 0, '2023-07-16 09:54:11', '2023-07-16 09:54:11', '2024-07-16 12:54:11'),
('af5b1160096daefefd10d04536e3f30d7d925bb2f9796b4d0c92ea3a191e64909a56910fbe9b5555', 1, 1, 'User Api Token', '[]', 0, '2023-07-15 21:24:48', '2023-07-15 21:24:48', '2024-07-16 00:24:48'),
('b042431a1bf0165648a77f73032efeddc0e2f773cddbe0706f0eb3e42faca466083e294ec921bb1e', 1, 1, 'User Api Token', '[]', 0, '2023-07-15 21:11:05', '2023-07-15 21:11:05', '2024-07-16 00:11:05'),
('d85c9feaf2a93bed9abef1ffbc672ec44b933df73ceed9ac48588c910f88b9cb9d7a8adb7c286f8b', 2, 1, 'User Api Token', '[]', 0, '2023-07-14 15:08:57', '2023-07-14 15:08:57', '2024-07-14 18:08:57'),
('da25cf875338ccf05aa7699ba0b9fbea2292e6274730fcb8d5e203eb0cadc18a788f91bb0ebc66d8', 1, 1, 'User Api Token', '[]', 0, '2023-07-14 15:08:20', '2023-07-14 15:08:20', '2024-07-14 18:08:20'),
('fc6be8005bde02dc92578264d5ad0f5335a3d9999824140cf8f0553fd35c173691d5ea9088f617c4', 1, 1, 'User Api Token', '[]', 0, '2023-07-15 20:21:05', '2023-07-15 20:21:05', '2024-07-15 23:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'MasterSocial Personal Access Client', 'jEBQ5ObeCRTn4OCb0EHLzX1tv8m5IHTvRXHvqIuS', NULL, 'http://localhost', 1, 0, 0, '2023-07-14 15:08:05', '2023-07-14 15:08:05'),
(2, NULL, 'MasterSocial Password Grant Client', 'HCZlFL4kHD0TM3mIusdEMLCCr1hCRVJASYBDXkVM', 'users', 'http://localhost', 0, 1, 0, '2023-07-14 15:08:05', '2023-07-14 15:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-07-14 15:08:05', '2023-07-14 15:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `officialaccounts`
--

CREATE TABLE `officialaccounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_profile_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `payedposts`
--

CREATE TABLE `payedposts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `promtion_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `photo_path` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `post_id`, `photo_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'storage/app/images/posts_pictures/first_picture.jpg', '2023-07-14 16:23:26', '2023-07-14 16:23:26'),
(2, 1, 'storage/app/images/posts_pictures/second_picture.jpg', '2023-07-14 16:23:34', '2023-07-14 16:23:34'),
(3, 1, 'storage/app/images/profile_picture/1685690560.jpg', '2023-07-14 16:23:39', '2023-07-14 16:23:39'),
(4, 2, 'storage/app/images/posts_pictures/first_picture.jpg', '2023-07-14 16:24:24', '2023-07-14 16:24:24'),
(7, 6, 'storage/app/images/posts_pictures/third_picture.jpg', '2023-07-16 10:46:11', '2023-07-16 10:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_profile_id` int(10) UNSIGNED NOT NULL,
  `post_body` longtext NOT NULL,
  `post_time` time NOT NULL,
  `post_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `user_profile_id`, `post_body`, `post_time`, `post_date`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'my post 1', '19:20:12', '2023-07-14', '2023-07-14 16:20:12', '2023-07-14 16:20:12'),
(2, 2, 2, 'my post 2', '19:24:02', '2023-07-14', '2023-07-14 16:14:02', '2023-07-14 16:14:02'),
(4, 1, 1, 'other post user 1 ', '18:38:11', '2023-07-15', '2023-07-15 15:38:11', '2023-07-15 15:38:11'),
(6, 1, 1, ' post 2 for user 1 ', '13:45:08', '2023-07-16', '2023-07-16 10:45:08', '2023-07-16 10:45:08'),
(7, 1, 1, ' post 3 for user 1 ', '13:45:20', '2023-07-16', '2023-07-16 10:45:20', '2023-07-16 10:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `reset_code_passwords`
--

CREATE TABLE `reset_code_passwords` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saveposts`
--

CREATE TABLE `saveposts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shareposts`
--

CREATE TABLE `shareposts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `body` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shareposts`
--

INSERT INTO `shareposts` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'user 1 share post of user 2 ', '2023-07-15 15:56:05', '2023-07-15 15:56:05'),
(2, 1, 1, 'user 1 share post 1 of user 2 ', '2023-07-15 15:56:20', '2023-07-15 15:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_profile_id` int(10) UNSIGNED NOT NULL,
  `story_body` text DEFAULT NULL,
  `story_date` date NOT NULL,
  `story_date_expire` timestamp NOT NULL DEFAULT '2023-07-15 15:08:03',
  `story_time` time NOT NULL,
  `media` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userfollowers`
--

CREATE TABLE `userfollowers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_profile_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `phone_num` varchar(191) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `provider_name` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `google_access_token_json` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `phone_num`, `gender`, `birthdate`, `provider_name`, `provider_id`, `google_access_token_json`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'asem', 'refa3i', 'asem@gmail.com', NULL, '$2y$10$asna53G6khtZhJZxYsNIouLU/T5owBi1EhyXRrMMYrRV2FtXaroZm', '0955220355', 1, '2001-08-02', NULL, NULL, NULL, NULL, '2023-07-14 15:08:20', '2023-07-14 15:08:40'),
(2, 'asem1', 'refa3i', 'asem1@gmail.com', NULL, '$2y$10$WhfAhhaKxNhZVo/c6KzWxeLHn4Myl5ND6qQjCJcmrjdNB480/XW82', '0947672246', 1, '2001-08-02', NULL, NULL, NULL, NULL, '2023-07-14 15:08:57', '2023-07-14 15:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `job` varchar(191) DEFAULT NULL,
  `study_place` varchar(191) DEFAULT NULL,
  `place_stay` varchar(191) DEFAULT NULL,
  `place_born` varchar(191) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `cover_photo` varchar(191) NOT NULL DEFAULT 'storage/app/images/cover_picture/Fw79JsNXwAEHNTq.jfif',
  `profile_photo` varchar(191) NOT NULL DEFAULT 'storage/app/images/profile_picture/default_photo.png',
  `followers_number` bigint(20) NOT NULL DEFAULT 0,
  `state` enum('single','engaged','married','in_relationship') DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `job`, `study_place`, `place_stay`, `place_born`, `bio`, `cover_photo`, `profile_photo`, `followers_number`, `state`, `user_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'storage/app/images/cover_picture/Fw79JsNXwAEHNTq.jfif', 'storage/app/images/profile_picture/default_photo.png', 0, NULL, 1, '2023-07-14 15:08:20', '2023-07-14 15:13:49'),
(2, 'engineer', 'damascus university', 'damascus', 'midan', 'listen george wassouf', 'storage/app/images/cover_picture/1689347469.jpg', 'storage/app/images/profile_picture/1689347498.jpg', -1, 'single', 2, '2023-07-14 15:08:57', '2023-07-14 15:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `video_path` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `post_id`, `video_path`, `created_at`, `updated_at`) VALUES
(2, 4, 'storage/app/videos/posts_videos/laravel.mp4', '2023-07-15 15:39:31', '2023-07-15 15:39:31'),
(4, 7, 'storage/app/videos/posts_videos/wahda.mp4', '2023-07-16 10:48:48', '2023-07-16 10:48:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_post_owner_foreign` (`post_owner`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_post_id_foreign` (`post_id`),
  ADD KEY `likes_post_owner_foreign` (`post_owner`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moreaccountes`
--
ALTER TABLE `moreaccountes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `moreaccountes_user_profile_id_foreign` (`user_profile_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `officialaccounts`
--
ALTER TABLE `officialaccounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `officialaccounts_user_profile_id_foreign` (`user_profile_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payedposts`
--
ALTER TABLE `payedposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payedposts_user_id_foreign` (`user_id`),
  ADD KEY `payedposts_post_id_foreign` (`post_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_post_id_foreign` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_user_profile_id_foreign` (`user_profile_id`);

--
-- Indexes for table `reset_code_passwords`
--
ALTER TABLE `reset_code_passwords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reset_code_passwords_email_index` (`email`);

--
-- Indexes for table `saveposts`
--
ALTER TABLE `saveposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saveposts_user_id_foreign` (`user_id`),
  ADD KEY `saveposts_post_id_foreign` (`post_id`);

--
-- Indexes for table `shareposts`
--
ALTER TABLE `shareposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shareposts_user_id_foreign` (`user_id`),
  ADD KEY `shareposts_post_id_foreign` (`post_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stories_user_id_foreign` (`user_id`),
  ADD KEY `stories_user_profile_id_foreign` (`user_profile_id`);

--
-- Indexes for table `userfollowers`
--
ALTER TABLE `userfollowers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userfollowers_user_id_foreign` (`user_id`),
  ADD KEY `userfollowers_user_profile_id_foreign` (`user_profile_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_post_id_foreign` (`post_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `moreaccountes`
--
ALTER TABLE `moreaccountes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `officialaccounts`
--
ALTER TABLE `officialaccounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payedposts`
--
ALTER TABLE `payedposts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reset_code_passwords`
--
ALTER TABLE `reset_code_passwords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saveposts`
--
ALTER TABLE `saveposts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shareposts`
--
ALTER TABLE `shareposts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userfollowers`
--
ALTER TABLE `userfollowers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_post_owner_foreign` FOREIGN KEY (`post_owner`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_post_owner_foreign` FOREIGN KEY (`post_owner`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `moreaccountes`
--
ALTER TABLE `moreaccountes`
  ADD CONSTRAINT `moreaccountes_user_profile_id_foreign` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `officialaccounts`
--
ALTER TABLE `officialaccounts`
  ADD CONSTRAINT `officialaccounts_user_profile_id_foreign` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payedposts`
--
ALTER TABLE `payedposts`
  ADD CONSTRAINT `payedposts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payedposts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_profile_id_foreign` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saveposts`
--
ALTER TABLE `saveposts`
  ADD CONSTRAINT `saveposts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saveposts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shareposts`
--
ALTER TABLE `shareposts`
  ADD CONSTRAINT `shareposts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shareposts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stories_user_profile_id_foreign` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userfollowers`
--
ALTER TABLE `userfollowers`
  ADD CONSTRAINT `userfollowers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userfollowers_user_profile_id_foreign` FOREIGN KEY (`user_profile_id`) REFERENCES `user_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
