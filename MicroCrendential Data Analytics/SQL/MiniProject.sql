CREATE TABLE Video(
	video_id Serial PRIMARY KEY,
	title VARCHAR(100),
	length VARCHAR(50), 
	URL VARCHAR(100)
);

INSERT INTO video(title, length, url)
VALUES ('Titanic 3D Re-Release Official Trailer', '00:02:10', 'https://www.youtube.com/watch?v=kVrqfYjkTdQ'),
('Marvel Studios Doctor Strange in the Multiverse of Madness', '00:02:11', 'https://www.youtube.com/watch?v=Rt_UqUm38BI'),
('ONE HOUR of Amazing Animal Moments | BBC Earth','01:01:53','https://www.youtube.com/watch?v=eEaZvEZye84');

CREATE TABLE Reviewers(
	Reviewer_id Serial PRIMARY KEY,
	name VARCHAR(100),
	rating VARCHAR(50), 
	text_review VARCHAR(100),
	video_id INT REFERENCES Video(video_id)
);

INSERT INTO reviewers(name, rating, text_review, video_id)
VALUES ('Jorge Calle', '5', 'I like it!', 1),
('Mezbahuddin', '4', 'Really good trailer!', 2);

Select * FROM video as v
JOIN reviewers as r
ON r.video_id = v.video_id