A social media website designed for club members of the Penn Buddhism Club to share information relating to their meditation and mindfulness practies. This was done as a final project for CIS196 at the University of Pennsylvania.  I used the Ruby on Rails framework and many gems that work with Ruby on Rails for the backend and Bootstrap mixed with plain CSS for the frontend to create a website with user identification, file storage, and a backend with multiple types of relationships (one-to-one, many-to-many, one-to-many).

A working version was bulk imported to this account from a VCS so not all edit records are shown in this commit history of this repo.

Note on Organization: Within BuddhismClub/ there are many directorys generated by Ruby that are needed, but are not useful for writing or reading the code in this repository. App/ and db/ hold all relevant information. App/ has the MVC structure as indicated by folder names; each of these respective folders hold the actual logic for the each component (i.e. views/users/index.html.erb houses all the logic for the view -- the frontend display -- of the user index page).