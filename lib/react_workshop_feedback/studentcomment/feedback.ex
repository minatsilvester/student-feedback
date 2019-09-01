defmodule ReactWorkshopFeedback.Studentcomment.Feedback do
  use Ecto.Schema
  import Ecto.Changeset

  schema "feedbacks" do
    field :food_feedback, :string
    field :improvement, :string
    field :next_session, :string
    field :session1_feedback, :string
    field :session2_feedback, :string

    timestamps()
  end

  @doc false
  def changeset(feedback, attrs) do
    feedback
    |> cast(attrs, [:session1_feedback, :session2_feedback, :food_feedback, :improvement, :next_session])
    |> validate_required([:session1_feedback, :session2_feedback, :food_feedback, :improvement, :next_session])
  end
end
