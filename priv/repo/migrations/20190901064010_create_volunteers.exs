defmodule ReactWorkshopFeedback.Repo.Migrations.CreateVolunteers do
  use Ecto.Migration

  def change do
    create table(:volunteers) do
      add :name, :string
      add :college_name, :string
      add :phone_number, :string

      timestamps()
    end

  end
end
