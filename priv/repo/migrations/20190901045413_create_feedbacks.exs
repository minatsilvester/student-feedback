defmodule ReactWorkshopFeedback.Repo.Migrations.CreateFeedbacks do
  use Ecto.Migration

  def change do
    create table(:feedbacks) do
      add :session1_feedback, :text
      add :session2_feedback, :text
      add :food_feedback, :text
      add :improvement, :text
      add :next_session, :text

      timestamps()
    end

  end
end
