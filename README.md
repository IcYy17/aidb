# aidb
<h1>SQL DB AI Project<h1>

## Overview
In this project we designed a database and created a natural language interface to it using AI.

## Purpose
The goal of this project is to:
- Explore the capabilities and limitations of GPT in generating SQL queries.
- Understand how GPT can be integrated into software engineering workflows.
- Experiment with three prompting strategies: **zero-shot**, **single-domain**, and **cross-domain**, as outlined in [this research paper](https://arxiv.org/abs/2305.11853).
- Provide an engaging and intuitive interface for querying database information.

## Database Design
We designed a database schema to model **League of Legends Worlds**, which tracks:
1. Teams competing in world championships (e.g. T1, BLG).
2. Players, their roles, and their performance statistics (e.g., KDA, CS, vision score).
3. Matches, teams involved, and the winners.

### Database Schema
The schema includes the following tables:
- `team`: Tracks teams, their region, and the number of world titles they have won.
- `player`: Tracks individual players, their roles, and which team they belong to.
- `matches`: Tracks matches, teams involved, the year, and the winners.
- `playerStats`: Tracks player performance in matches (e.g., KDA, CS, vision scores).
