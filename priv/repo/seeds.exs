# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Apolo.Repo.insert!(%Apolo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Apolo.Auth.create_user(%{username: "fguillermo", password: "Apolo2017!"})
Apolo.Auth.create_user(%{username: "evera", password: "Apolo2017!"})
