# planlos-openapi

OpenAPI-Spezifikation der REST-API von
[planlos-server](https://github.com/planlos-hq/planlos-server):
[`openapi.yaml`](openapi.yaml).

Die gerenderte Fassung (Swagger UI) steht in der
[PlanLos-Dokumentation](https://github.com/planlos-hq/planlos-docs) unter
Entwicklung → API. Jenkins kopiert die `openapi.yaml` bei jedem Push dorthin
([`jenkinsfiles/auto-build-deploy`](jenkinsfiles/auto-build-deploy)).

## Entwicklung

Mit Nix: `direnv allow` bzw. `nix develop` (Node.js, Java, uv). Ohne Nix
werden Node.js und Java für den Generator benötigt, uv für die Tests.

```bash
npm install
npm run validate                 # Spezifikation prüfen
npm run build-html-interactive   # HTML-Doku nach html/
npm run build-html               # einfache HTML-Doku nach dist/
```

## API-Tests

[Schemathesis](https://schemathesis.readthedocs.io) testet einen laufenden
Server gegen die Spezifikation (Einstellungen in
[`schemathesis.toml`](schemathesis.toml)):

```bash
./run_tests.sh                                    # lokaler Server (Port 8004)
./run_tests.sh http://localhost:8004/api/v1/      # andere URL
```

**Achtung:** Die Tests legen zufällige Daten an und löschen welche. Nur gegen
eine Test-Datenbank laufen lassen.

**Keine Passwörter, Schlüssel, echten Namen, Benutzernamen, Hostnamen oder
Serverkonfigurationen committen.**
