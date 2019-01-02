defmodule PdfCalendar.Pcal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pcal" do
    field :month, :integer
    field :year, :integer
  end

  def changeset(pcal, params \\ %{} ) do
    pcal
    |> cast(params, [:month, :year])
    |> validate_required([:month, :year])
    |> validate_number(:month, greater_than: 0, less_than: 13)
    |> validate_number(:year, greater_than: 0, less_than: 3000)
  end
end
