# Codex Skills

To repozytorium zawiera skille dla Codex. Można je wrzucić do folderu `.codex/skills` i używać w lokalnym środowisku Codex.

## Użytkowanie

Najwygodniej sklonować repozytorium do katalogu z projektami, na przykład `~/playground`, a następnie w `~/.codex/skills` podlinkować tylko te skille, których chcesz używać.

```bash
cd ~/playground
git clone git@github.com:eengineSH/codex-skills.git

mkdir -p ~/.codex/skills
cd ~/.codex/skills
ln -s ~/playground/codex-skills/burza-mozgow
```

Dzięki temu konfiguracja Codexa zawiera tylko wybrane skille, zamiast wszystkich elementów dostępnych w repozytorium.
