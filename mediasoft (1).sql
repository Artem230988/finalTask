-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 23 2020 г., 12:16
-- Версия сервера: 5.7.25
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mediasoft`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_03_19_124107_create_pictures_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `pictures`
--

CREATE TABLE `pictures` (
  `picture_id` bigint(20) NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countViews` int(11) DEFAULT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pictures`
--

INSERT INTO `pictures` (`picture_id`, `author_id`, `created_at`, `updated_at`, `tag`, `countViews`, `img`) VALUES
(26, 4, '2020-03-22 03:48:30', '2020-03-22 03:48:36', '#мояперваякартинка', 1, '/storage/6pWk7Ca3mQ8eRvRwrhLfed6sqt5zCaot7SGimFTo.jpeg'),
(27, 4, '2020-03-22 03:49:13', '2020-03-22 03:49:13', '#моявтораякартинка', 0, '/storage/mKgcJrmDSqKnkbj7qUqn3JARnkiNdWI300cGStxG.jpeg'),
(28, 5, '2020-03-22 03:49:59', '2020-03-22 03:49:59', '#водопад', 0, '/storage/Bqd88wfzkLemk5gZ8kyPQ2D8rlzlSfxn2v2YSRxz.jpeg'),
(29, 5, '2020-03-22 03:53:17', '2020-03-22 03:53:23', '#кот#иликошка', 1, '/storage/yTvkgbrH065yeUJSAVi16B2NN0LRuo8GtBZsr2G3.jpeg'),
(30, 5, '2020-03-22 03:53:50', '2020-03-22 03:53:50', '#природа', 0, '/storage/g8J6oVvuEAXkj54dHV0obFSVaq59bP42nVj0h8Zy.jpeg'),
(31, 5, '2020-03-22 03:54:25', '2020-03-22 03:54:25', '#горы', 0, '/storage/AH38PglQiZ1sn3gQBvFkwNdN8dX2E4pISWPvYBuQ.jpeg'),
(32, 6, '2020-03-22 03:56:50', '2020-03-22 03:57:02', '#панда', 1, '/storage/3pDcUM7a8kuyknfzecAyHR3pHpQZ5rMMRRQFYnDL.jpeg'),
(33, 6, '2020-03-22 03:57:16', '2020-03-22 03:57:16', '#авто', 0, '/storage/t9uy5yjY8tuAuUh1Gq3c8pQCwTETiCMw9umBW4vA.jpeg'),
(34, 6, '2020-03-22 03:57:36', '2020-03-23 03:47:12', '#зеленое#яблоко', 2, '/storage/OB1IWkyiLLB5Vypp9rmdxR75GZEXYGsWVLCiQHND.jpeg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Artem1', 'artemivanovfoto@yandex.ru', NULL, '$2y$10$H3bWq6do6CmxwHGxK3xnkeNndwodgfBpgyvvm6SwbVSapuQiJuND.', NULL, '2020-03-22 03:47:37', '2020-03-22 03:47:37'),
(5, 'Artem2', 'artemivansdfdsovfoto@yandex.ru', NULL, '$2y$10$L1NWN9DS3eDPChmVBjSvBOwUEQDf1nbRjRDVLtGNIj9rGGXs2UMfu', NULL, '2020-03-22 03:49:34', '2020-03-22 03:49:34'),
(6, 'Artem3', 'aldsgha@mail.ru', NULL, '$2y$10$yA6cVApUToW.F46dvWmrpuD9xGvCwLRSe1n.eCiSQ7HZbCjA5e0nC', NULL, '2020-03-22 03:54:47', '2020-03-22 03:54:47'),
(7, 'Artem5', 'artemivanovfoto2@yandex.ru', NULL, '$2y$10$WlTgAvVQ1XuS/Bivf/hSDuQksivQxtoFzAOJ/nzniYSSJLfrYap4y', NULL, '2020-03-22 04:01:25', '2020-03-22 04:01:25');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD UNIQUE KEY `picture_id` (`picture_id`),
  ADD KEY `pictures_author_id_foreign` (`author_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `pictures`
--
ALTER TABLE `pictures`
  MODIFY `picture_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
