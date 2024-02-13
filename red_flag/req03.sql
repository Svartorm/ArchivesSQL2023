DELETE FROM public.epix_posts
USING epix_hashtags,epix_accounts, people
WHERE people.id = epix_accounts.person_id
    and epix_accounts.id = epix_posts.author_id 
    and hashtag_id = epix_hashtags.id 
    and epix_hashtags.name = 'EndSurveillance'
RETURNING first_name, last_name, username, body as post_content;
