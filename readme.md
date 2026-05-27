# Galactic Spacefarer Adventure

## Overview

SAP CAP + SAP Fiori Elements application for managing galactic spacefarers.

## Technologies

- SAP CAP
- SAP Fiori Elements
- SQLite
- Node.js

## Features

- CRUD operations
- Draft enabled Object Page
- Before/After event handlers
- Mock authentication
- Planet based row-level authorization
- Sorting/filtering/pagination

## Event Handling

### Before CREATE
- validates stardust collection
- normalizes wormhole navigation skill
- sets default spacesuit color

### After CREATE
- sends mock cosmic notification

## Authorization

Users can only access spacefarers from their own origin planet.

## Start

npm install

cds deploy --to sqlite

cds watch

### Mock users:

elek / 1234
bernadett / 1234
