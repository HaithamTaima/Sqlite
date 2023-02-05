create table if not exists Category
(
    CategoryId      integer     primary key     autoincrement,
    CategoryName    text        not null unique
);

create table if not exists Actor
(
    ActorId     integer     primary key     autoincrement,
    FirstName   text (200)  not null,
    LastName    text (200)  not null
); 

create table if not exists film
(
    FilmId     integer     primary key     autoincrement,
    Title      text        not null,
    Description text,
    ReleaseYear integer,
    Language    text       check(Language in ('English','Arabic')),
    Rate        float      check(Rate between 0 and 5),
    FilmLenfth  integer
    CategoryId  integer references Category(CategoryId)
); 

create table if not exists FilmActors
(
    FilmId  integer references film(FilmId)
    Actor   integer references Actor(ActorId)

    primary key (FilmId , ActorId)
); 