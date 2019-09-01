defmodule ReactWorkshopFeedback.Studentcomment.Volunteer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "volunteers" do
    field :college_name, :string
    field :name, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(volunteer, attrs) do
    volunteer
    |> cast(attrs, [:name, :college_name, :phone_number])
    |> validate_required([:name, :college_name, :phone_number])
  end
end
