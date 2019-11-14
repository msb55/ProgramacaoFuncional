gnome-terminal --tab --title="Arca" -- bash -ic "cd ArcaWeb && cabal run"
gnome-terminal --tab --title="ArcaWeb" -- bash -ic "cd frontend && python3 -m http.server 9000"
gnome-terminal --tab --title="Server" -- bash -ic "cd server && cabal run"
