select * from authors;  -- получить всех авторов
select * from users; -- получить всех пользователей
select * from books;  -- получить все книги
select * from genres;  -- получить все жанры книг
select * from bookrequests; -- получаем данные по запросам книг
select * from statuses; -- получаем все доступные статусы
select * from librarians; -- показать id библиотекарей
select * from readers; -- показать id пользователей

select b.idBook, b.title from books b
where b.idBook not in 
 (select idBook from bookrequests br 
   join statuses s on br.idStatus = s.idStatus
    where s.name != 'возврат'); -- получаем список книг, доступных для выдачи

select b.idBook, title 
 from books b
  join bookrequests br 
   on br.idBook = b.idBook
  join statuses s 
   on br.idStatus = s.idStatus
where s.name != 'возврат';  -- получаем список выданных книг и их id

select idBook, title from books
where title like '%тысяч%';  -- получаем название и id книг с названием включающим '20 тысяч' 

select idBook, title 
from 
	(
	select idBook, title, concat_ws(' ', name, patronymic, surname) fullname
	from books b
	join authors a
	on b.idAuthor = a.idAuthor
	) tbl
where fullname like '%Верн%'; -- получаем все книги автора 'Верн'

update users 
set users.login = 'ivanov1', users.password ='ivan1'
where users.idUser = 1; -- поменять у пользователя с id = 1 пароль и логин
