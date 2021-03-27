#!/usr/bin/env ruby

puts '== Instalando dependências =='
system 'gem install bundler --conservative'
system('bundle check') || system('bundle install')

require 'sqlite3'

puts "\n== Preparando banco de dados =="
begin
  db = SQLite3::Database.open "db/database.db"
  db.execute <<~SQL

    CREATE TABLE Estados(
      id integer,
      sigla varchar,
      nome varchar
      );
  SQL



    
    