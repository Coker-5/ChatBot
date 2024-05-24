-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-12-12 17:00:17
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `chatbot`
--

-- --------------------------------------------------------

--
-- 表的结构 `ansdata`
--

CREATE TABLE `ansdata` (
  `id` int(255) NOT NULL,
  `question` varchar(9999) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(9999) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ansdata`
--

INSERT INTO `ansdata` (`id`, `question`, `answer`) VALUES
(1, '张飞是谁', '张飞是中国三国时期著名的军事家和蜀汉的重要将领**。他的字是益德，涿郡（今河北保定涿州市）人。张飞与刘备和关羽曾在桃园三结义，成为义兄弟。他在长坂坡大战中一声狮吼，令敌军胆寒，为后人所称颂。公元221年，张飞为替二哥关羽报仇，同刘备起兵攻伐东吴，但在出兵前被部将范疆、张达刺杀，享年五十五岁。'),
(2, '燕麦可以用来怎么做', '燕麦可以用来制作多种美食，以下是一些例子：\r\n\r\n1. **燕麦粥**：将燕麦加水煮熟，可以加入牛奶、蜂蜜等调味品，做成营养丰富的早餐粥。\r\n2. **燕麦饼干**：将燕麦片、面粉、糖等材料混合制成饼干，烘烤后口感香脆。\r\n3. **燕麦面包**：将燕麦片与面粉、酵母、水等材料混合制成面团，发酵后烤制成面包。\r\n4. **燕麦沙拉**：将煮熟的燕麦加入蔬菜、水果、鸡肉等食材，淋上沙拉酱，做成清爽美味的沙拉。\r\n\r\n可以根据自己的口味和喜好，创造出更多的燕麦美食。'),
(3, '中文很难吗', '**中文的难度因人而异**^[1][2]^。\r\n\r\n对于母语为中文的人来说，中文并不难。但对于那些母语不是中文的人来说，中文可能会比较难学。这是因为中文的语法、发音和书写系统与许多其他语言不同^[1][2]^。\r\n\r\n然而，学习任何一门语言都需要付出努力和耐心，通过不断的学习和实践，可以逐渐掌握中文^[1]^。'),
(4, '番茄炒蛋怎么做', '番茄炒蛋是一道简单又美味的家常菜，下面是制作番茄炒蛋的步骤：\r\n\r\n材料：\r\n- 2个鸡蛋\r\n- 2个番茄\r\n- 适量盐和胡椒粉\r\n- 适量食用油\r\n- 适量葱花（可选）\r\n\r\n步骤：\r\n1. 将番茄洗净切成小块备用。\r\n2. 打入鸡蛋，加入适量盐和胡椒粉，搅拌均匀。\r\n3. 热锅加入适量食用油，待油热后倒入鸡蛋液，用铲子迅速划散成小块状，炒熟至八成熟后盛出备用。\r\n4. 在同一个锅中加入番茄块，用铲子轻轻翻炒，炒至番茄变软出汁。\r\n5. 将炒熟的鸡蛋倒入锅中，和番茄一起翻炒均匀，继续炒制片刻。\r\n6. 最后加入适量盐和胡椒粉调味，炒匀后即可出锅。\r\n7. 可以撒上一些葱花作为装饰。\r\n\r\n番茄炒蛋可以搭配米饭或面条一起食用，味道鲜美，营养丰富。根据个人口味，还可以加入适量的蒜末或者蚝油等调料进行调味。'),
(5, '詹姆斯是谁', '詹姆斯通常指的是美国职业篮球运动员勒布朗·詹姆斯（LeBron James），他是NBA历史上最为知名和成功的球员之一。詹姆斯出生于1984年12月30日，他在职业生涯中效力过克利夫兰骑士队、迈阿密热火队和洛杉矶湖人队。他以出色的篮球技术、身体素质和领导能力而闻名，被认为是现代篮球的超级巨星之一。詹姆斯多次获得NBA总冠军、NBA最有价值球员（MVP）等荣誉，并在场上展现了卓越的篮球天赋和领袖风范。除了在篮球场上的成就，詹姆斯也积极参与公益事业并成为社会活动家，为社区和青少年提供支持和帮助。'),
(6, '你认为ai会取代人类吗', 'AI的发展确实在许多领域展现出了巨大的潜力，但目前的AI技术还远远不能完全取代人类。AI在处理大规模数据、自动化任务、模式识别等方面表现出色，但在复杂的创造性思维、情感理解、道德判断和人际交往等方面，人类的智能和能力仍然是独一无二的。\r\n\r\nAI的主要目标是辅助人类，提供更高效的工具和解决方案，而不是取代人类。人类与AI的合作可以带来更大的效益，例如在医疗、科学研究、自动驾驶等领域，AI可以提供更准确的分析和决策支持。\r\n\r\n然而，我们也需要认识到AI发展可能带来的一些挑战和风险，如失业问题、隐私和伦理问题等。因此，人类需要在AI的发展和应用过程中保持警惕，并确保其发展符合道德和社会价值观。\r\n\r\n总结来说，AI在许多方面将会为人类带来巨大的进步和便利，但人类的独特智能和能力仍然是不可替代的，我们需要在人机合作的基础上共同发展。'),
(7, '你好', '你好，有什么可以帮助你的吗');

-- --------------------------------------------------------

--
-- 表的结构 `ru_faq`
--

CREATE TABLE `ru_faq` (
  `id` int(255) NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `ru_faq`
--

INSERT INTO `ru_faq` (`id`, `question`, `answer`) VALUES
(1, 'Сайн уу\r\n', 'Сайн байна уу, би Chatbot байна\r\n'),
(2, '1-р сургуулийн байр хаана байдаг вэ?\r\n', 'BAGA TOIRUU-14, KHOROO 8, ULAANBAATAR, MONGOLIA 14191\r\n'),
(3, 'Би сургалтын төлбөрөө яаж төлөх вэ?\r\n', 'Та https://student.msue.edu.mn оюутны системд нэвтэрч төлбөрийн интерфэйс рүү орж сургалтын төлбөрөө харж, онлайнаар төлөх боломжтой.\r\n'),
(4, 'Би хичээлээ хэрхэн үзэх вэ?\r\n', 'Та https://student.msue.edu.mn оюутны системд нэвтэрч хичээлийнхээ мэдээллийг үзэх боломжтой.\r\n'),
(5, 'Математик байгалийн ухааны сургууль\r\n', 'https://smns.msue.edu.mn/\r\n'),
(6, ' Нийгэм, хүмүүнлэгийн ухааны сургууль\r\n', 'https://shss.msue.edu.mn/\r\n'),
(7, ' Дүрслэх урлаг, технологийн сургууль\r\n', 'https://sfat.msue.edu.mn/\r\n'),
(8, ' Боловсрол судлалын сургууль\r\n', 'https://ses.msue.edu.mn/\r\n'),
(9, ' Багшийн сургууль\r\n', 'https://ts.msue.edu.mn/\r\n'),
(10, ' Биеийн тамирын сургууль\r\n', 'https://spe.msue.edu.mn/\r\n'),
(11, ' Сургуулийн өмнөх боловсролын сургууль\r\n', 'https://spse.msue.edu.mn/\r\n'),
(12, ' Архангай дахь салбар сургууль\r\n', 'https://ast.msue.edu.mn/\r\n'),
(13, ' Харьяа ерөнхий боловсролын сургууль\r\n', 'https://ebs.msue.edu.mn/\r\n'),
(14, ' БАЯН-ӨЛГИЙН САЛБАР СУРГУУЛЬ\r\n', 'https://beta.msue.edu.mn/\r\n'),
(15, 'Сургуулийн холбоо барих хаяг юу вэ?\r\n', 'phone:+976 7777 5115 email:info@msue.edu.mn customer services:08.30am-17.30pm\r\n');

--
-- 转储表的索引
--

--
-- 表的索引 `ansdata`
--
ALTER TABLE `ansdata`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ansdata` ADD FULLTEXT KEY `question` (`question`);

--
-- 表的索引 `ru_faq`
--
ALTER TABLE `ru_faq`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ansdata`
--
ALTER TABLE `ansdata`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `ru_faq`
--
ALTER TABLE `ru_faq`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
