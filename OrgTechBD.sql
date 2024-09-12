-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 12 2024 г., 10:15
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Polus`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Comments`
--

CREATE TABLE `Comments` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `masterID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Comments`
--

INSERT INTO `Comments` (`id`, `message`, `masterID`, `requestID`) VALUES
(1, 'Интересно...', 2, 1),
(2, 'Будем разбираться!', 3, 2),
(3, 'Сделаем всё на высшем уровне!', 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `orgTechType`
--

CREATE TABLE `orgTechType` (
  `id` int(11) NOT NULL,
  `orgTechType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orgTechType`
--

INSERT INTO `orgTechType` (`id`, `orgTechType`) VALUES
(1, 'Компьютер'),
(2, 'Ноутбук'),
(3, 'Принтер');

-- --------------------------------------------------------

--
-- Структура таблицы `Request`
--

CREATE TABLE `Request` (
  `id` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `orgTechTypeID` int(11) NOT NULL,
  `orgTechModel` varchar(255) NOT NULL,
  `problemDescryption` text NOT NULL,
  `requestStatusID` int(11) NOT NULL,
  `completionDate` date NOT NULL,
  `repairParts` varchar(255) NOT NULL,
  `masterID` int(11) DEFAULT NULL,
  `clientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Request`
--

INSERT INTO `Request` (`id`, `startDate`, `orgTechTypeID`, `orgTechModel`, `problemDescryption`, `requestStatusID`, `completionDate`, `repairParts`, `masterID`, `clientID`) VALUES
(1, '2023-06-06', 1, 'DEXP Aquilon O286', 'Перестал работать', 1, '2023-06-06', '', 2, 7),
(2, '2023-05-05', 1, 'DEXP Atlas H388', 'Перестал работать', 1, '2023-05-05', '', 3, 8),
(3, '2022-07-07', 2, 'MSI GF76 Katana 11UC-879XRU черный', 'Выключается', 2, '2023-01-01', '', 3, 9),
(4, '2023-08-02', 2, 'MSI Modern 15 B12M-211RU черный', 'Выключается', 2, '2023-08-02', '', NULL, 8),
(5, '2023-08-02', 3, 'HP LaserJet Pro M404dn', 'Перестала включаться', 2, '2023-08-02', '', NULL, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `requestStatus`
--

CREATE TABLE `requestStatus` (
  `id` int(11) NOT NULL,
  `requestStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requestStatus`
--

INSERT INTO `requestStatus` (`id`, `requestStatus`) VALUES
(1, 'В процессе ремонта'),
(2, 'Готова к выдаче'),
(3, 'Новая заявка');

-- --------------------------------------------------------

--
-- Структура таблицы `Type`
--

CREATE TABLE `Type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Type`
--

INSERT INTO `Type` (`id`, `type`) VALUES
(1, 'Менеджер'),
(2, 'Мастер'),
(3, 'Оператор'),
(4, 'Заказчик');

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`id`, `fio`, `phone`, `login`, `password`, `id_type`) VALUES
(1, 'Носов Иван Михайлович', '89210563128', 'login1', 'a722c63db8ec8625af6cf71cb8c2d939', 1),
(2, 'Ильин Александр Андреевич', '89535078985', 'login2', 'c1572d05424d0ecb2a65ec6a82aeacbf', 2),
(3, 'Никифоров Иван Дмитриевич', '89210673849', 'login3', '3afc79b597f88a72528e864cf81856d2', 2),
(4, 'Елисеев Артём Леонидович', '89990563748', 'login4', 'fc2921d9057ac44e549efaf0048b2512', 3),
(5, 'Титов Сергей Кириллович', '89994563847', 'login5', 'd35f6fa9a79434bcd17f8049714ebfcb', 3),
(6, 'Григорьев Семён Викторович', '89219567849', 'login11', '0102812fbd5f73aa18aa0bae2cd8f79f', 4),
(7, 'Сорокин Дмитрий Ильич', '89219567841', 'login12', '0bd0fe6372c64e09c4ae81e056a9dbda', 4),
(8, 'Белоусов Егор Ярославович', '89219567842', 'login13', 'c868bff94e54b8eddbdbce22159c0299', 4),
(9, 'Суслов Михаил Александрович', '89219567843', 'login14', 'd1f38b569c772ebb8fa464e1a90c5a00', 4),
(10, 'Васильев Вячеслав Александрович', '89219567844', 'login15', 'b279786ec5a7ed00dbe4d3fe1516c121', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `masterID` (`masterID`),
  ADD KEY `requestID` (`requestID`);

--
-- Индексы таблицы `orgTechType`
--
ALTER TABLE `orgTechType`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Request`
--
ALTER TABLE `Request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orgTechTypeID` (`orgTechTypeID`),
  ADD KEY `requestStatusID` (`requestStatusID`),
  ADD KEY `masterID` (`masterID`),
  ADD KEY `clientID` (`clientID`);

--
-- Индексы таблицы `requestStatus`
--
ALTER TABLE `requestStatus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `id_type` (`id_type`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Comments`
--
ALTER TABLE `Comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orgTechType`
--
ALTER TABLE `orgTechType`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Request`
--
ALTER TABLE `Request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `requestStatus`
--
ALTER TABLE `requestStatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Type`
--
ALTER TABLE `Type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`masterID`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Comments_ibfk_2` FOREIGN KEY (`requestID`) REFERENCES `Request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Request`
--
ALTER TABLE `Request`
  ADD CONSTRAINT `Request_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Request_ibfk_2` FOREIGN KEY (`requestStatusID`) REFERENCES `requestStatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Request_ibfk_3` FOREIGN KEY (`orgTechTypeID`) REFERENCES `orgTechType` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Request_ibfk_4` FOREIGN KEY (`masterID`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `Type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
