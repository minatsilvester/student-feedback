defmodule ReactWorkshopFeedbackWeb.FeedbackController do
  use ReactWorkshopFeedbackWeb, :controller

  alias ReactWorkshopFeedback.Studentcomment
  alias ReactWorkshopFeedback.Studentcomment.Feedback

  def index(conn, _params) do
    feedbacks = Studentcomment.list_feedbacks()
    render(conn, "index.html", feedbacks: feedbacks)
  end

  def new(conn, _params) do
    changeset = Studentcomment.change_feedback(%Feedback{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"feedback" => feedback_params}) do
    case Studentcomment.create_feedback(feedback_params) do
      {:ok, feedback} ->
        conn
        |> put_flash(:info, "Feedback created successfully.")
        |> redirect(to: Routes.feedback_path(conn, :show, feedback))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    feedback = Studentcomment.get_feedback!(id)
    render(conn, "show.html", feedback: feedback)
  end

  def edit(conn, %{"id" => id}) do
    feedback = Studentcomment.get_feedback!(id)
    changeset = Studentcomment.change_feedback(feedback)
    render(conn, "edit.html", feedback: feedback, changeset: changeset)
  end

  def update(conn, %{"id" => id, "feedback" => feedback_params}) do
    feedback = Studentcomment.get_feedback!(id)

    case Studentcomment.update_feedback(feedback, feedback_params) do
      {:ok, feedback} ->
        conn
        |> put_flash(:info, "Feedback updated successfully.")
        |> redirect(to: Routes.feedback_path(conn, :show, feedback))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", feedback: feedback, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    feedback = Studentcomment.get_feedback!(id)
    {:ok, _feedback} = Studentcomment.delete_feedback(feedback)

    conn
    |> put_flash(:info, "Feedback deleted successfully.")
    |> redirect(to: Routes.feedback_path(conn, :index))
  end
end
